import 'dart:convert';
import 'dart:io';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

import 'rest/enums.dart';

class BinanceSpot {
  String? _apiKey;
  String? _apiSecret;
  late String endpoint;
  late String wsEndpoint;

  final String prefix = "api/v3";

  int timestampDifference = 0;

  set testnet(bool value) {
    if (value) {
      endpoint = "testnet.binance.com";
      wsEndpoint = "wss://testnet.binance.vision";
    } else {
      endpoint = 'https://api.binance.com';
      wsEndpoint = 'wss://stream.binance.com:9443';
    }
  }

  set apiKey(String key) {
    _apiKey = key;
  }

  set apiSecret(String secret) {
    _apiSecret = secret;
  }

  BinanceSpot({
    String? key,
    String? secret,
    bool testnet = false,
  }) {
    _apiKey = key;
    _apiSecret = secret;
    this.testnet = testnet;
  }

  /// Call this function if you keep getting an error about server time
  Future<bool> syncWithServerTime() async {
    var response = await sendRequest(
      path: '$prefix/time',
      type: RequestType.getRequest,
    );
    if (response.isRight) {
      int serverTime = response.right['serverTime'];
      timestampDifference = DateTime.now().millisecondsSinceEpoch - serverTime;
      return true;
    } else {
      return false;
    }
  }

  /// Helper function to perform any kind of request to Binance API
  Future<Either<String, dynamic>> sendRequest({
    required String path,
    required RequestType type,
    bool keyRequired = false,
    bool signatureRequired = false,
    bool timestampRequired = false,
    Map<String, String>? params,
  }) async {
    params ??= {};
    if (timestampRequired) {
      params['timestamp'] =
          (DateTime.now().millisecondsSinceEpoch - timestampDifference)
              .toString();
    }

    if (signatureRequired) {
      if (_apiSecret == null) {
        return const Left("Missing API Secret Key");
      }
      var tempUri = Uri.https('', '', params);
      String queryParams = tempUri.toString().substring(7);
      List<int> messageBytes = utf8.encode(queryParams);
      List<int> key = utf8.encode(_apiSecret!);
      Hmac hmac = Hmac(sha256, key);
      Digest digest = hmac.convert(messageBytes);
      String signature = hex.encode(digest.bytes);
      params['signature'] = signature;
    }

    Map<String, String> header = {};
    header[HttpHeaders.contentTypeHeader] = "application/x-www-form-urlencoded";
    if (keyRequired) {
      if (_apiKey == null) {
        return const Left("Missing API Key");
      }
      header["X-MBX-APIKEY"] = _apiKey!;
    }

    final uri = Uri.https(endpoint, path, params);
    http.Response? response;

    switch (type) {
      case RequestType.getRequest:
        response = await http.get(
          uri,
          headers: keyRequired ? header : null,
        );
        break;
      case RequestType.postRequest:
        response = await http.post(
          uri,
          headers: header,
        );
        break;
      case RequestType.deleteRequest:
        response = await http.delete(
          uri,
          headers: header,
        );
        break;
      case RequestType.putRequest:
        response = await http.put(uri);
        break;
      default:
    }

    final result = jsonDecode(response!.body);

    if (result is Map) {
      if (result.containsKey("code") && result['code'] != 200) {
        return Left(
            "Binance API returned error ${result["code"]} : ${result["msg"]}");
      }
    }

    return Right(result);
  }

  /// Helper function to subscribe to any websocket stream from Binance API
  IOWebSocketChannel subscribe(String channel) => IOWebSocketChannel.connect(
        '$wsEndpoint/ws/$channel',
        pingInterval: const Duration(minutes: 5),
      );

  Map toMap(json) => jsonDecode(json);
  List<Map> toList(json) => List<Map>.from(jsonDecode(json));
}
