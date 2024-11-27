// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../common/classes.dart';
import '../common/enums.dart';
import 'enums.dart';

class Symbol {
  String symbol;
  SymbolStatus status;
  String baseAsset;
  int baseAssetPrecision;
  String quoteAsset;
  int quotePrecision;
  int quoteAssetPrecision;
  List<OrderType> orderTypes;
  bool icebergAllowed;
  bool ocoAllowed;
  bool isSpotTradingAllowed;
  bool isMarginTradingAllowed;
  List<Filter> filters;
  List<String> permissions;

  Symbol.fromMap(Map m)
      : symbol = m['symbol'],
        status = SymbolStatus.fromString(m['status'] as String),
        baseAsset = m['baseAsset'],
        baseAssetPrecision = m['baseAssetPrecision'],
        quoteAsset = m['quoteAsset'],
        quotePrecision = m['quotePrecision'],
        quoteAssetPrecision = m['quoteAssetPrecision'],
        orderTypes = (m['orderTypes'] as List<dynamic>)
            .cast<String>()
            .map((String e) => OrderType.fromString(e))
            .toList(),
        icebergAllowed = m['icebergAllowed'],
        ocoAllowed = m['ocoAllowed'],
        isSpotTradingAllowed = m['isSpotTradingAllowed'],
        isMarginTradingAllowed = m['isMarginTradingAllowed'],
        filters = (m['filters'] as List<dynamic>)
            .map((e) => Filter.fromMap(e))
            .toList(),
        permissions = m['permissions'].cast<String>();

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'status': status.str,
        'baseAsset': baseAsset,
        'baseAssetPrecision': baseAssetPrecision,
        'quoteAsset': quoteAsset,
        'quotePrecision': quotePrecision,
        'quoteAssetPrecision': quoteAssetPrecision,
        'orderTypes': orderTypes.map((e) => e.str).toList(),
        'icebergAllowed': icebergAllowed,
      };
}

class Filter {
  String type;
  Map<String, dynamic> data;

  Filter.fromMap(m)
      : type = m["filterType"],
        data = m;

  // toJson
  Map<String, dynamic> toJson() => {
        'type': type,
        'data': data,
      };
}

class ExchangeInfo {
  String timezone;
  int serverTime;
  List<dynamic> rateLimits;
  List<Filter> exchangeFilters;
  List<Symbol> symbols;

  ExchangeInfo.fromMap(Map m)
      : timezone = m['timezone'],
        serverTime = m['serverTime'],
        rateLimits = m['rateLimits'],
        exchangeFilters = (m['exchangeFilters'] as List<dynamic>)
            .map((e) => Filter.fromMap(e))
            .toList(),
        symbols = (m['symbols'] as List<dynamic>)
            .map((e) => Symbol.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'timezone': timezone,
        'serverTime': serverTime,
        'rateLimits': rateLimits,
        'exchangeFilters': exchangeFilters,
        'symbols': symbols,
      };
}

class OrderBook {
  int lastUpdateId;
  int messageOutputTime;
  int transactionTime;
  List<DepthOrder> bids;
  List<DepthOrder> asks;

  OrderBook.fromMap(Map m)
      : lastUpdateId = m['lastUpdateId'],
        messageOutputTime = m['E'],
        transactionTime = m['T'],
        bids = (m['bids'] as List<dynamic>)
            .map((e) => DepthOrder.fromList(e))
            .toList(),
        asks = (m['asks'] as List<dynamic>)
            .map((e) => DepthOrder.fromList(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'lastUpdateId': lastUpdateId,
        'messageOutputTime': messageOutputTime,
        'transactionTime': transactionTime,
        'bids': bids,
        'asks': asks,
      };
}

class Trade {
  int id;
  double price;
  double qty;
  double quoteQty;
  int time;
  bool isBuyerMaker;

  Trade.fromMap(Map m)
      : id = m['id'],
        price = double.parse(m['price']),
        qty = double.parse(m['qty']),
        quoteQty = double.parse(m['quoteQty']),
        time = m['time'],
        isBuyerMaker = m['isBuyerMaker'];

  // toJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'qty': qty,
        'quoteQty': quoteQty,
        'time': time,
        'isBuyerMaker': isBuyerMaker,
      };
}

class Kline {
  int timestamp;
  double open;
  double high;
  double low;
  double close;
  double volume;
  int closeTimestamp;
  double quoteAssetVolume;
  int tradeNumber;
  double takerBuyBaseAssetVolume;
  double takerBuyQuoteAssetVolume;

  Kline({
    required this.timestamp,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.closeTimestamp,
    required this.quoteAssetVolume,
    required this.tradeNumber,
    required this.takerBuyBaseAssetVolume,
    required this.takerBuyQuoteAssetVolume,
  });

  Kline.fromList(List l)
      : timestamp = l[0],
        open = double.parse(l[1]),
        high = double.parse(l[2]),
        low = double.parse(l[3]),
        close = double.parse(l[4]),
        volume = double.parse(l[5]),
        closeTimestamp = l[6],
        quoteAssetVolume = double.parse(l[7]),
        tradeNumber = l[8],
        takerBuyBaseAssetVolume = double.parse(l[9]),
        takerBuyQuoteAssetVolume = double.parse(l[10]);

  // toJson
  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'open': open,
        'high': high,
        'low': low,
        'close': close,
        'volume': volume,
        'closeTimestamp': closeTimestamp,
        'quoteAssetVolume': quoteAssetVolume,
        'tradeNumber': tradeNumber,
        'takerBuyBaseAssetVolume': takerBuyBaseAssetVolume,
        'takerBuyQuoteAssetVolume': takerBuyQuoteAssetVolume,
      };
}

class AveragePrice {
  int mins;
  double price;

  AveragePrice.fromMap(Map m)
      : mins = m['mins'],
        price = double.parse(m['price']);

  // toJson
  Map<String, dynamic> toJson() => {
        'mins': mins,
        'price': price,
      };
}

class TickerStatistics {
  String symbol;
  double priceChange;
  double priceChangePercent;
  double weightedAvgPrice;
  double prevClosePrice;
  double lastPrice;
  double lastQty;
  double bidPrice;
  double askPrice;
  double openPrice;
  double highPrice;
  double lowPrice;
  double volume;
  double quoteVolume;
  int openTime;
  int closeTime;
  int firstId;
  int lastId;
  int count;

  TickerStatistics.fromMap(Map m)
      : symbol = m['symbol'],
        priceChange = double.parse(m['priceChange']),
        priceChangePercent = double.parse(m['priceChangePercent']),
        weightedAvgPrice = double.parse(m['weightedAvgPrice']),
        prevClosePrice = double.parse(m['prevClosePrice']),
        lastPrice = double.parse(m['lastPrice']),
        lastQty = double.parse(m['lastQty']),
        bidPrice = double.parse(m['bidPrice']),
        askPrice = double.parse(m['askPrice']),
        openPrice = double.parse(m['openPrice']),
        highPrice = double.parse(m['highPrice']),
        lowPrice = double.parse(m['lowPrice']),
        volume = double.parse(m['volume']),
        quoteVolume = double.parse(m['quoteVolume']),
        openTime = m['openTime'],
        closeTime = m['closeTime'],
        firstId = m['firstId'],
        lastId = m['lastId'],
        count = m['count'];

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'priceChange': priceChange,
        'priceChangePercent': priceChangePercent,
        'weightedAvgPrice': weightedAvgPrice,
        'prevClosePrice': prevClosePrice,
        'lastPrice': lastPrice,
        'lastQty': lastQty,
        'bidPrice': bidPrice,
        'askPrice': askPrice,
        'openPrice': openPrice,
        'highPrice': highPrice,
        'lowPrice': lowPrice,
        'volume': volume,
        'quoteVolume': quoteVolume,
        'openTime': openTime,
        'closeTime': closeTime,
        'firstId': firstId,
        'lastId': lastId,
        'count': count,
      };
}

class Ticker {
  String symbol;
  double price;

  Ticker.fromMap(Map m)
      : symbol = m['symbol'],
        price = double.parse(m['price']);

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'price': price,
      };
}

class BookTicker {
  String symbol;
  double bidPrice;
  double bidQty;
  double askPrice;
  double askQty;

  BookTicker.fromMap(Map m)
      : symbol = m['symbol'],
        bidPrice = double.parse(m['bidPrice']),
        bidQty = double.parse(m['bidQty']),
        askPrice = double.parse(m['askPrice']),
        askQty = double.parse(m['askQty']);

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'bidPrice': bidPrice,
        'bidQty': bidQty,
        'askPrice': askPrice,
        'askQty': askQty,
      };
}

class Order {
  String symbol;
  int orderId;
  int orderListId;
  String clientOrderId;
  int transactTime;
  double price;
  double origQty;
  double executedQty;
  double cummulativeQuoteQty;
  OrderStatus status;
  TimeInForce timeInForce;
  OrderType type;
  Side side;
  double? stopPrice;

  Order.fromMap(Map m)
      : symbol = m['symbol'],
        orderId = m['orderId'],
        orderListId = m['orderListId'],
        clientOrderId = m['clientOrderId'],
        transactTime = m['transactTime'],
        price = double.parse(m['price']),
        origQty = double.parse(m['origQty']),
        executedQty = double.parse(m['executedQty']),
        cummulativeQuoteQty = double.parse(m['cummulativeQuoteQty']),
        status = OrderStatus.fromString(m['status'] as String),
        timeInForce = TimeInForce.fromString(m['timeInForce'] as String),
        type = OrderType.fromString(m['type'] as String),
        side = Side.fromString(m['side'] as String),
        stopPrice = double.parse(m['price']);

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'orderId': orderId,
        'orderListId': orderListId,
        'clientOrderId': clientOrderId,
        'transactTime': transactTime,
        'price': price,
        'origQty': origQty,
        'executedQty': executedQty,
        'cummulativeQuoteQty': cummulativeQuoteQty,
        'status': status.str,
        'timeInForce': timeInForce.str,
        'type': type.str,
        'side': side.str,
        'stopPrice': stopPrice,
      };
}

class CanceledOrder {
  String symbol;
  String origClientOrderId;
  int orderId;
  int orderListId;
  String clientOrderId;
  double price;
  double origQty;
  double executedQty;
  double cummulativeQuoteQty;
  OrderStatus status;
  TimeInForce timeInForce;
  OrderType type;
  Side side;

  CanceledOrder.fromMap(Map m)
      : symbol = m['symbol'],
        origClientOrderId = m['origClientOrderId'] ?? "",
        orderId = m['orderId'],
        orderListId = m['orderListId'],
        clientOrderId = m['clientOrderId'],
        price = double.parse(m['price']),
        origQty = double.parse(m['origQty']),
        executedQty = double.parse(m['executedQty']),
        cummulativeQuoteQty = double.parse(m['cummulativeQuoteQty']),
        status = OrderStatus.fromString(m['status'] as String),
        timeInForce = TimeInForce.fromString(m['timeInForce'] as String),
        type = OrderType.fromString(m['type'] as String),
        side = Side.fromString(m['side'] as String);

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'origClientOrderId': origClientOrderId,
        'orderId': orderId,
        'orderListId': orderListId,
        'clientOrderId': clientOrderId,
        'price': price,
        'origQty': origQty,
        'executedQty': executedQty,
        'cummulativeQuoteQty': cummulativeQuoteQty,
        'status': status.str,
        'timeInForce': timeInForce.str,
        'type': type.str,
        'side': side.str,
      };
}

class CurrentOrder {
  String symbol;
  int orderId;
  int orderListId;
  String clientOrderId;
  double price;
  double origQty;
  double executedQty;
  double cummulativeQuoteQty;
  OrderStatus status;
  TimeInForce timeInForce;
  OrderType type;
  Side side;
  double stopPrice;
  double icebergQty;
  int time;
  int updateTime;
  bool isWorking;
  double origQuoteOrderQty;

  CurrentOrder.fromMap(Map m)
      : symbol = m['symbol'],
        orderId = m['orderId'],
        orderListId = m['orderListId'],
        clientOrderId = m['clientOrderId'],
        price = double.parse(m['price']),
        origQty = double.parse(m['origQty']),
        executedQty = double.parse(m['executedQty']),
        cummulativeQuoteQty = double.parse(m['cummulativeQuoteQty']),
        status = OrderStatus.fromString(m['status'] as String),
        timeInForce = TimeInForce.fromString(m['timeInForce'] as String),
        type = OrderType.fromString(m['type'] as String),
        side = Side.fromString(m['side'] as String),
        stopPrice = double.parse(m['stopPrice']),
        icebergQty = double.parse(m['icebergQty']),
        time = m['time'],
        updateTime = m['updateTime'],
        isWorking = m['isWorking'],
        origQuoteOrderQty = double.parse(m['origQuoteOrderQty']);

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'orderId': orderId,
        'orderListId': orderListId,
        'clientOrderId': clientOrderId,
        'price': price,
        'origQty': origQty,
        'executedQty': executedQty,
        'cummulativeQuoteQty': cummulativeQuoteQty,
        'status': status.str,
        'timeInForce': timeInForce.str,
        'type': type.str,
        'side': side.str,
        'stopPrice': stopPrice,
        'icebergQty': icebergQty,
        'time': time,
        'updateTime': updateTime,
        'isWorking': isWorking,
        'origQuoteOrderQty': origQuoteOrderQty,
      };
}

class OrderInfo {
  String symbol;
  int orderId;
  String clientOrderId;

  OrderInfo.fromMap(Map m)
      : symbol = m['symbol'],
        orderId = m['orderId'],
        clientOrderId = m['clientOrderId'];

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'orderId': orderId,
        'clientOrderId': clientOrderId,
      };
}

class OcoOrder {
  int orderListId;
  String contingencyType;
  OcoStatus listStatusType;
  OcoOrderStatus listOrderStatus;
  String listClientOrderId;
  int transactionTime;
  String symbol;
  List<OrderInfo> orders;
  List<Order> orderReports;

  OcoOrder.fromMap(Map m)
      : orderListId = m['orderListId'],
        contingencyType = m['contingencyType'],
        listStatusType = OcoStatus.fromString(m['listStatusType'] as String),
        listOrderStatus =
            OcoOrderStatus.fromString(m['listOrderStatus'] as String),
        listClientOrderId = m['listClientOrderId'],
        transactionTime = m['transactionTime'],
        symbol = m['symbol'],
        orders = (m['orders'] as List<dynamic>)
            .map((e) => OrderInfo.fromMap(e))
            .toList(),
        orderReports = m.containsKey('orderReports')
            ? (m['orderReports'] as List<dynamic>)
                .map((e) => Order.fromMap(e))
                .toList()
            : [];

  // toJson
  Map<String, dynamic> toJson() => {
        'orderListId': orderListId,
        'contingencyType': contingencyType,
        'listStatusType': listStatusType.str,
        'listOrderStatus': listOrderStatus.str,
        'listClientOrderId': listClientOrderId,
        'transactionTime': transactionTime,
        'symbol': symbol,
        'orders': orders.map((e) => e.toJson()).toList(),
        'orderReports': orderReports.map((e) => e.toJson()).toList(),
      };
}

class AccountInfo {
  int makerCommission;
  int takerCommission;
  int buyerCommission;
  int sellerCommission;
  bool canTrade;
  bool canWithdraw;
  bool canDeposit;
  int updateTime;
  String accountType;
  List<Balance> balances;
  List<String> permissions;

  AccountInfo.fromMap(Map m)
      : makerCommission = m['makerCommission'],
        takerCommission = m['takerCommission'],
        buyerCommission = m['buyerCommission'],
        sellerCommission = m['sellerCommission'],
        canTrade = m['canTrade'],
        canWithdraw = m['canWithdraw'],
        canDeposit = m['canDeposit'],
        updateTime = m['updateTime'],
        accountType = m['accountType'],
        balances = (m['balances'] as List<dynamic>)
            .map((e) => Balance.fromMap(e))
            .toList(),
        permissions = m['permissions'].cast<String>();

  // toJson
  Map<String, dynamic> toJson() => {
        'makerCommission': makerCommission,
        'takerCommission': takerCommission,
        'buyerCommission': buyerCommission,
        'sellerCommission': sellerCommission,
        'canTrade': canTrade,
        'canWithdraw': canWithdraw,
        'canDeposit': canDeposit,
        'updateTime': updateTime,
        'accountType': accountType,
        'balances': balances.map((e) => e.toJson()).toList(),
        'permissions': permissions,
      };
}

class AccountTrade {
  String symbol;
  int id;
  int orderId;
  int orderListId;
  double price;
  double qty;
  double quoteQty;
  double commission;
  String commissionAsset;
  int time;
  bool isBuyer;
  bool isMaker;
  bool isBestMatch;

  AccountTrade.fromMap(Map m)
      : symbol = m['symbol'],
        id = m['id'],
        orderId = m['orderId'],
        orderListId = m['orderListId'],
        price = double.parse(m['price']),
        qty = double.parse(m['qty']),
        quoteQty = double.parse(m['quoteQty']),
        commission = double.parse(m['commission']),
        commissionAsset = m['commissionAsset'],
        time = m['time'],
        isBuyer = m['isBuyer'],
        isMaker = m['isMaker'],
        isBestMatch = m['isBestMatch'];

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'id': id,
        'orderId': orderId,
        'orderListId': orderListId,
        'price': price,
        'qty': qty,
        'quoteQty': quoteQty,
        'commission': commission,
        'commissionAsset': commissionAsset,
        'time': time,
        'isBuyer': isBuyer,
        'isMaker': isMaker,
        'isBestMatch': isBestMatch,
      };
}

class FiatTransferData {
  String orderNo;
  String fiatCurrency;
  double indicatedAmount;
  double amount;
  double totalFee;
  String method;
  String status;
  int createTime;
  int updateTime;

  FiatTransferData.fromMap(Map m)
      : orderNo = m['orderNo'],
        fiatCurrency = m['fiatCurrency'],
        indicatedAmount = double.parse(m['indicatedAmount']),
        amount = double.parse(m['amount']),
        totalFee = double.parse(m['totalFee']),
        method = m['method'],
        status = m['status'],
        createTime = m['createTime'],
        updateTime = m['updateTime'];

  // toJson
  Map<String, dynamic> toJson() => {
        'orderNo': orderNo,
        'fiatCurrency': fiatCurrency,
        'indicatedAmount': indicatedAmount,
        'amount': amount,
        'totalFee': totalFee,
        'method': method,
        'status': status,
        'createTime': createTime,
        'updateTime': updateTime,
      };
}

class FiatTransferHistory {
  double code;
  String message;
  List<FiatTransferData> data;
  int total;
  bool success;

  FiatTransferHistory.fromMap(Map m)
      : code = double.parse(m['code']),
        message = m['message'],
        data = (m['data'] as List<dynamic>)
            .map((e) => FiatTransferData.fromMap(e))
            .toList(),
        total = m['total'],
        success = m['success'];

  // toJson
  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data.map((e) => e.toJson()).toList(),
        'total': total,
        'success': success,
      };
}

class FiatPaymentData {
  String orderNo;
  double sourceAmount;
  String fiatCurrency;
  double obtainAmount;
  String cryptoCurrency;
  double totalFee;
  double price;
  String status;
  int createTime;
  int updateTime;

  FiatPaymentData.fromMap(Map m)
      : orderNo = m['orderNo'],
        sourceAmount = double.parse(m['sourceAmount']),
        fiatCurrency = m['fiatCurrency'],
        obtainAmount = double.parse(m['obtainAmount']),
        cryptoCurrency = m['cryptoCurrency'],
        totalFee = double.parse(m['totalFee']),
        price = double.parse(m['price']),
        status = m['status'],
        createTime = m['createTime'],
        updateTime = m['updateTime'];

  // toJson
  Map<String, dynamic> toJson() => {
        'orderNo': orderNo,
        'sourceAmount': sourceAmount,
        'fiatCurrency': fiatCurrency,
        'obtainAmount': obtainAmount,
        'cryptoCurrency': cryptoCurrency,
        'totalFee': totalFee,
        'price': price,
        'status': status,
        'createTime': createTime,
        'updateTime': updateTime,
      };
}

class FiatPaymentHistory {
  double code;
  String message;
  List<FiatPaymentData> data;
  int total;
  bool success;

  FiatPaymentHistory.fromMap(Map m)
      : code = double.parse(m['code']),
        message = m['message'],
        data = (m['data'] as List<dynamic>)
            .map((e) => FiatPaymentData.fromMap(e))
            .toList(),
        total = m['total'],
        success = m['success'];

  // toJson
  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data.map((e) => e.toJson()).toList(),
        'total': total,
        'success': success,
      };
}

class SubAccountInfo {
  String email;
  bool isFreeze;
  int createTime;

  SubAccountInfo.fromMap(Map m)
      : email = m['email'],
        isFreeze = m['isFreeze'],
        createTime = m['createTime'];

  // toJson
  Map<String, dynamic> toJson() => {
        'email': email,
        'isFreeze': isFreeze,
        'createTime': createTime,
      };
}

class SubAccountList {
  List<SubAccountInfo> subAccounts;

  SubAccountList.fromMap(Map m)
      : subAccounts = (m['subAccounts'] as List<dynamic>)
            .map((e) => SubAccountInfo.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'subAccounts': subAccounts.map((e) => e.toJson()).toList(),
      };
}

class SubAccountTransfer {
  String from;
  String to;
  String asset;
  double qty;
  String status;
  int tranId;
  int time;

  SubAccountTransfer.fromMap(Map m)
      : from = m['from'],
        to = m['to'],
        asset = m['asset'],
        qty = double.parse(m['qty']),
        status = m['status'] ?? "",
        tranId = m['tranId'],
        time = m['time'];

  // toJson
  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'asset': asset,
        'qty': qty,
        'status': status,
        'tranId': tranId,
        'time': time,
      };
}

class SubAccountFuturesTransferHistory {
  bool success;
  int futuresType;
  List<SubAccountTransfer> transfers;

  SubAccountFuturesTransferHistory.fromMap(Map m)
      : success = m['success'],
        futuresType = m['futuresType'],
        transfers = (m['transfers'] as List<dynamic>)
            .map((e) => SubAccountTransfer.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'success': success,
        'futuresType': futuresType,
        'transfers': transfers.map((e) => e.toJson()).toList(),
      };
}

class SubAccountFuturesTransfer {
  bool success;
  double txnId;

  SubAccountFuturesTransfer.fromMap(Map m)
      : success = m['success'],
        txnId = double.parse(m['txnId']);

  // toJson
  Map<String, dynamic> toJson() => {
        'success': success,
        'txnId': txnId,
      };
}

class SubAccountBalance {
  String asset;
  double free;
  double locked;

  SubAccountBalance.fromMap(Map m)
      : asset = m['asset'],
        free = (m['free'] is int) ? (m["free"] as int).toDouble() : m["free"],
        locked = (m['locked'] is int)
            ? (m["locked"] as int).toDouble()
            : m["locked"];

  // toJson
  Map<String, dynamic> toJson() => {
        'asset': asset,
        'free': free,
        'locked': locked,
      };
}

class SubAccountBalances {
  List<SubAccountBalance> balances;

  SubAccountBalances.fromMap(Map m)
      : balances = (m['balances'] as List<dynamic>)
            .map((e) => SubAccountBalance.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'balances': balances.map((e) => e.toJson()).toList(),
      };
}

class SubAccountBtcValued {
  String email;
  double totalAsset;

  SubAccountBtcValued.fromMap(Map m)
      : email = m['email'],
        totalAsset = double.parse(m['totalAsset']);

  // toJson
  Map<String, dynamic> toJson() => {
        'email': email,
        'totalAsset': totalAsset,
      };
}

class SubAccountSpotAssetsSummary {
  int totalCount;
  double masterAccountTotalAsset;
  List<SubAccountBtcValued> spotSubUserAssetBtcVoList;

  SubAccountSpotAssetsSummary.fromMap(Map m)
      : totalCount = m['totalCount'],
        masterAccountTotalAsset = double.parse(m['masterAccountTotalAsset']),
        spotSubUserAssetBtcVoList =
            (m['spotSubUserAssetBtcVoList'] as List<dynamic>)
                .map((e) => SubAccountBtcValued.fromMap(e))
                .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'totalCount': totalCount,
        'masterAccountTotalAsset': masterAccountTotalAsset,
        'spotSubUserAssetBtcVoList':
            spotSubUserAssetBtcVoList.map((e) => e.toJson()).toList(),
      };
}

class DepositAddress {
  String address;
  String coin;
  String tag;
  String url;

  DepositAddress.fromMap(Map m)
      : address = m['address'],
        coin = m['coin'],
        tag = m['tag'],
        url = m['url'];

  // toJson
  Map<String, dynamic> toJson() => {
        'address': address,
        'coin': coin,
        'tag': tag,
        'url': url,
      };
}

class Deposit {
  double amount;
  String coin;
  String network;
  int status;
  String address;
  String addressTag;
  String txId;
  int insertTime;
  int transferType;
  String unlockConfirm;
  String confirmTimes;

  Deposit.fromMap(Map m)
      : amount = double.parse(m['amount']),
        coin = m['coin'],
        network = m['network'],
        status = m['status'],
        address = m['address'],
        addressTag = m['addressTag'],
        txId = m['txId'],
        insertTime = m['insertTime'],
        transferType = m['transferType'],
        unlockConfirm = m['unlockConfirm'] ?? "",
        confirmTimes = m['confirmTimes'];

  // toJson
  Map<String, dynamic> toJson() => {
        'amount': amount,
        'coin': coin,
        'network': network,
        'status': status,
        'address': address,
        'addressTag': addressTag,
        'txId': txId,
        'insertTime': insertTime,
        'transferType': transferType,
        'unlockConfirm': unlockConfirm,
        'confirmTimes': confirmTimes,
      };
}

class SubAccountStatus {
  String email;
  bool isSubUserEnabled;
  bool isUserActive;
  int insertTime;
  bool isMarginEnabled;
  bool isFutureEnabled;
  int mobile;

  SubAccountStatus.fromMap(Map m)
      : email = m['email'],
        isSubUserEnabled = m['isSubUserEnabled'],
        isUserActive = m['isUserActive'],
        insertTime = m['insertTime'],
        isMarginEnabled = m['isMarginEnabled'],
        isFutureEnabled = m['isFutureEnabled'],
        mobile = m['mobile'];

  // toJson
  Map<String, dynamic> toJson() => {
        'email': email,
        'isSubUserEnabled': isSubUserEnabled,
        'isUserActive': isUserActive,
        'insertTime': insertTime,
        'isMarginEnabled': isMarginEnabled,
        'isFutureEnabled': isFutureEnabled,
        'mobile': mobile,
      };
}

class SubAccountMarginCoeff {
  double forceLiquidationBar;
  double marginCallBar;
  double normalBar;

  SubAccountMarginCoeff.fromMap(Map m)
      : forceLiquidationBar = double.parse(m['forceLiquidationBar']),
        marginCallBar = double.parse(m['marginCallBar']),
        normalBar = double.parse(m['normalBar']);

  // toJson
  Map<String, dynamic> toJson() => {
        'forceLiquidationBar': forceLiquidationBar,
        'marginCallBar': marginCallBar,
        'normalBar': normalBar,
      };
}

class MarginBalance {
  String asset;
  double borrowed;
  double free;
  double interest;
  double locked;
  double netAsset;

  MarginBalance.fromMap(Map m)
      : asset = m['asset'],
        borrowed = double.parse(m['borrowed']),
        free = double.parse(m['free']),
        interest = double.parse(m['interest']),
        locked = double.parse(m['locked']),
        netAsset = double.parse(m['netAsset']);

  // toJson
  Map<String, dynamic> toJson() => {
        'asset': asset,
        'borrowed': borrowed,
        'free': free,
        'interest': interest,
        'locked': locked,
        'netAsset': netAsset,
      };
}

class SubAccountMarginDetail {
  String email;
  double marginLevel;
  double totalAssetOfBtc;
  double totalLiabilityOfBtc;
  double totalNetAssetOfBtc;
  List<SubAccountMarginCoeff> marginTradeCoeffVo;
  List<MarginBalance> marginUserAssetVoList;

  SubAccountMarginDetail.fromMap(Map m)
      : email = m['email'],
        marginLevel = double.parse(m['marginLevel']),
        totalAssetOfBtc = double.parse(m['totalAssetOfBtc']),
        totalLiabilityOfBtc = double.parse(m['totalLiabilityOfBtc']),
        totalNetAssetOfBtc = double.parse(m['totalNetAssetOfBtc']),
        marginTradeCoeffVo = (m['marginTradeCoeffVo'] as List<dynamic>)
            .map((e) => SubAccountMarginCoeff.fromMap(e))
            .toList(),
        marginUserAssetVoList = (m['marginUserAssetVoList'] as List<dynamic>)
            .map((e) => MarginBalance.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'email': email,
        'marginLevel': marginLevel,
        'totalAssetOfBtc': totalAssetOfBtc,
        'totalLiabilityOfBtc': totalLiabilityOfBtc,
        'totalNetAssetOfBtc': totalNetAssetOfBtc,
        'marginTradeCoeffVo':
            marginTradeCoeffVo.map((e) => e.toJson()).toList(),
        'marginUserAssetVoList':
            marginUserAssetVoList.map((e) => e.toJson()).toList(),
      };
}

class SubAccountMarginSummary {
  String email;
  double totalAssetOfBtc;
  double totalLiabilityOfBtc;
  double totalNetAssetOfBtc;

  SubAccountMarginSummary.fromMap(Map m)
      : email = m['email'],
        totalAssetOfBtc = double.parse(m['totalAssetOfBtc']),
        totalLiabilityOfBtc = double.parse(m['totalLiabilityOfBtc']),
        totalNetAssetOfBtc = double.parse(m['totalNetAssetOfBtc']);

  // toJson
  Map<String, dynamic> toJson() => {
        'email': email,
        'totalAssetOfBtc': totalAssetOfBtc,
        'totalLiabilityOfBtc': totalLiabilityOfBtc,
        'totalNetAssetOfBtc': totalNetAssetOfBtc,
      };
}

class AllSubAccountMarginSummary {
  double totalAssetOfBtc;
  double totalLiabilityOfBtc;
  double totalNetAssetOfBtc;
  List<SubAccountMarginSummary> subAccountList;

  AllSubAccountMarginSummary.fromMap(Map m)
      : totalAssetOfBtc = double.parse(m['totalAssetOfBtc']),
        totalLiabilityOfBtc = double.parse(m['totalLiabilityOfBtc']),
        totalNetAssetOfBtc = double.parse(m['totalNetAssetOfBtc']),
        subAccountList = (m['subAccountList'] as List<dynamic>)
            .map((e) => SubAccountMarginSummary.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'totalAssetOfBtc': totalAssetOfBtc,
        'totalLiabilityOfBtc': totalLiabilityOfBtc,
        'totalNetAssetOfBtc': totalNetAssetOfBtc,
        'subAccountList': subAccountList.map((e) => e.toJson()).toList(),
      };
}

class SubAccountFuturesAsset {
  String asset;
  double initialMargin;
  double maintenanceMargin;
  double marginBalance;
  double maxWithdrawAmount;
  double openOrderInitialMargin;
  double positionInitialMargin;
  double unrealizedProfit;
  double walletBalance;

  SubAccountFuturesAsset.fromMap(Map m)
      : asset = m['asset'],
        initialMargin = double.parse(m['initialMargin']),
        maintenanceMargin = double.parse(m['maintenanceMargin']),
        marginBalance = double.parse(m['marginBalance']),
        maxWithdrawAmount = double.parse(m['maxWithdrawAmount']),
        openOrderInitialMargin = double.parse(m['openOrderInitialMargin']),
        positionInitialMargin = double.parse(m['positionInitialMargin']),
        unrealizedProfit = double.parse(m['unrealizedProfit']),
        walletBalance = double.parse(m['walletBalance']);

  // toJson
  Map<String, dynamic> toJson() => {
        'asset': asset,
        'initialMargin': initialMargin,
        'maintenanceMargin': maintenanceMargin,
        'marginBalance': marginBalance,
        'maxWithdrawAmount': maxWithdrawAmount,
        'openOrderInitialMargin': openOrderInitialMargin,
        'positionInitialMargin': positionInitialMargin,
        'unrealizedProfit': unrealizedProfit,
        'walletBalance': walletBalance,
      };
}

class SubAccountFuturesDetail {
  String email;
  String asset;
  List<SubAccountFuturesAsset> assets;
  bool canDeposit;
  bool canTrade;
  bool canWithdraw;
  int feeTier;
  double maxWithdrawAmount;
  double totalInitialMargin;
  double totalMaintenanceMargin;
  double totalMarginBalance;
  double totalOpenOrderInitialMargin;
  double totalPositionInitialMargin;
  double totalUnrealizedProfit;
  double totalWalletBalance;
  int updateTime;

  SubAccountFuturesDetail.fromMap(Map m)
      : email = m['email'],
        asset = m['asset'],
        assets = (m['assets'] as List<dynamic>)
            .map((e) => SubAccountFuturesAsset.fromMap(e))
            .toList(),
        canDeposit = m['canDeposit'],
        canTrade = m['canTrade'],
        canWithdraw = m['canWithdraw'],
        feeTier = m['feeTier'],
        maxWithdrawAmount = double.parse(m['maxWithdrawAmount']),
        totalInitialMargin = double.parse(m['totalInitialMargin']),
        totalMaintenanceMargin = double.parse(m['totalMaintenanceMargin']),
        totalMarginBalance = double.parse(m['totalMarginBalance']),
        totalOpenOrderInitialMargin =
            double.parse(m['totalOpenOrderInitialMargin']),
        totalPositionInitialMargin =
            double.parse(m['totalPositionInitialMargin']),
        totalUnrealizedProfit = double.parse(m['totalUnrealizedProfit']),
        totalWalletBalance = double.parse(m['totalWalletBalance']),
        updateTime = m['updateTime'];

  // toJson
  Map<String, dynamic> toJson() => {
        'email': email,
        'asset': asset,
        'assets': assets.map((e) => e.toJson()).toList(),
        'canDeposit': canDeposit,
        'canTrade': canTrade,
        'canWithdraw': canWithdraw,
        'feeTier': feeTier,
        'maxWithdrawAmount': maxWithdrawAmount,
        'totalInitialMargin': totalInitialMargin,
        'totalMaintenanceMargin': totalMaintenanceMargin,
        'totalMarginBalance': totalMarginBalance,
        'totalOpenOrderInitialMargin': totalOpenOrderInitialMargin,
        'totalPositionInitialMargin': totalPositionInitialMargin,
        'totalUnrealizedProfit': totalUnrealizedProfit,
        'totalWalletBalance': totalWalletBalance,
        'updateTime': updateTime,
      };
}

class SubAccountFuturesSummary {
  String email;
  double totalInitialMargin;
  double totalMaintenanceMargin;
  double totalMarginBalance;
  double totalOpenOrderInitialMargin;
  double totalPositionInitialMargin;
  double totalUnrealizedProfit;
  double totalWalletBalance;
  String asset;

  SubAccountFuturesSummary.fromMap(Map m)
      : email = m['email'],
        totalInitialMargin = double.parse(m['totalInitialMargin']),
        totalMaintenanceMargin = double.parse(m['totalMaintenanceMargin']),
        totalMarginBalance = double.parse(m['totalMarginBalance']),
        totalOpenOrderInitialMargin =
            double.parse(m['totalOpenOrderInitialMargin']),
        totalPositionInitialMargin =
            double.parse(m['totalPositionInitialMargin']),
        totalUnrealizedProfit = double.parse(m['totalUnrealizedProfit']),
        totalWalletBalance = double.parse(m['totalWalletBalance']),
        asset = m['asset'];

  // toJson
  Map<String, dynamic> toJson() => {
        'email': email,
        'totalInitialMargin': totalInitialMargin,
        'totalMaintenanceMargin': totalMaintenanceMargin,
        'totalMarginBalance': totalMarginBalance,
        'totalOpenOrderInitialMargin': totalOpenOrderInitialMargin,
        'totalPositionInitialMargin': totalPositionInitialMargin,
        'totalUnrealizedProfit': totalUnrealizedProfit,
        'totalWalletBalance': totalWalletBalance,
        'asset': asset,
      };
}

class AllSubAccountFuturesSummary {
  double totalInitialMargin;
  double totalMaintenanceMargin;
  double totalMarginBalance;
  double totalOpenOrderInitialMargin;
  double totalPositionInitialMargin;
  double totalUnrealizedProfit;
  double totalWalletBalance;
  String asset;
  List<SubAccountFuturesSummary> subAccountList;

  AllSubAccountFuturesSummary.fromMap(Map m)
      : totalInitialMargin = double.parse(m['totalInitialMargin']),
        totalMaintenanceMargin = double.parse(m['totalMaintenanceMargin']),
        totalMarginBalance = double.parse(m['totalMarginBalance']),
        totalOpenOrderInitialMargin =
            double.parse(m['totalOpenOrderInitialMargin']),
        totalPositionInitialMargin =
            double.parse(m['totalPositionInitialMargin']),
        totalUnrealizedProfit = double.parse(m['totalUnrealizedProfit']),
        totalWalletBalance = double.parse(m['totalWalletBalance']),
        asset = m['asset'],
        subAccountList = (m['subAccountList'] as List<dynamic>)
            .map((e) => SubAccountFuturesSummary.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'totalInitialMargin': totalInitialMargin,
        'totalMaintenanceMargin': totalMaintenanceMargin,
        'totalMarginBalance': totalMarginBalance,
        'totalOpenOrderInitialMargin': totalOpenOrderInitialMargin,
        'totalPositionInitialMargin': totalPositionInitialMargin,
        'totalUnrealizedProfit': totalUnrealizedProfit,
        'totalWalletBalance': totalWalletBalance,
        'asset': asset,
        'subAccountList': subAccountList.map((e) => e.toJson()).toList(),
      };
}

class SubAccountFuturesPositionRisk {
  double entryPrice;
  double leverage;
  double maxNotional;
  double liquidationPrice;
  double markPrice;
  double positionAmount;
  String symbol;
  double unrealizedProfit;

  SubAccountFuturesPositionRisk.fromMap(Map m)
      : entryPrice = double.parse(m['entryPrice']),
        leverage = double.parse(m['leverage']),
        maxNotional = double.parse(m['maxNotional']),
        liquidationPrice = double.parse(m['liquidationPrice']),
        markPrice = double.parse(m['markPrice']),
        positionAmount = double.parse(m['positionAmount']),
        symbol = m['symbol'],
        unrealizedProfit = double.parse(m['unrealizedProfit']);

  // toJson
  Map<String, dynamic> toJson() => {
        'entryPrice': entryPrice,
        'leverage': leverage,
        'maxNotional': maxNotional,
        'liquidationPrice': liquidationPrice,
        'markPrice': markPrice,
        'positionAmount': positionAmount,
        'symbol': symbol,
        'unrealizedProfit': unrealizedProfit,
      };
}

class SubAccountTransferData {
  String counterParty;
  String email;
  int type;
  String asset;
  double qty;
  String fromAccountType;
  String toAccountType;
  String status;
  int tranId;
  int time;

  SubAccountTransferData.fromMap(Map m)
      : counterParty = m['counterParty'],
        email = m['email'],
        type = m['type'],
        asset = m['asset'],
        qty = double.parse(m['qty']),
        fromAccountType = m['fromAccountType'],
        toAccountType = m['toAccountType'],
        status = m['status'],
        tranId = m['tranId'],
        time = m['time'];

  // toJson
  Map<String, dynamic> toJson() => {
        'counterParty': counterParty,
        'email': email,
        'type': type,
        'asset': asset,
        'qty': qty,
        'fromAccountType': fromAccountType,
        'toAccountType': toAccountType,
        'status': status,
        'tranId': tranId,
        'time': time,
      };
}

class SubAccountUniversalTransfer {
  int tranId;
  String fromEmail;
  String toEmail;
  String asset;
  double amount;
  String fromAccountType;
  String toAccountType;
  String status;
  int createTimeStamp;

  SubAccountUniversalTransfer.fromMap(Map m)
      : tranId = m['tranId'],
        fromEmail = m['fromEmail'],
        toEmail = m['toEmail'],
        asset = m['asset'],
        amount = double.parse(m['amount']),
        fromAccountType = m['fromAccountType'],
        toAccountType = m['toAccountType'],
        status = m['status'],
        createTimeStamp = m['createTimeStamp'];

  // toJson
  Map<String, dynamic> toJson() => {
        'tranId': tranId,
        'fromEmail': fromEmail,
        'toEmail': toEmail,
        'asset': asset,
        'amount': amount,
        'fromAccountType': fromAccountType,
        'toAccountType': toAccountType,
        'status': status,
        'createTimeStamp': createTimeStamp,
      };
}

class ManagedSubAccountAsset {
  String coin;
  String name;
  double totalBalance;
  double availableBalance;
  double inOrder;
  double btcValue;

  ManagedSubAccountAsset.fromMap(Map m)
      : coin = m['coin'],
        name = m['name'],
        totalBalance = double.parse(m['totalBalance']),
        availableBalance = double.parse(m['availableBalance']),
        inOrder = double.parse(m['inOrder']),
        btcValue = double.parse(m['btcValue']);

  // toJson
  Map<String, dynamic> toJson() => {
        'coin': coin,
        'name': name,
        'totalBalance': totalBalance,
        'availableBalance': availableBalance,
        'inOrder': inOrder,
        'btcValue': btcValue,
      };
}

class SystemStatus {
  int status;
  String msg;

  SystemStatus.fromMap(Map m)
      : status = m['status'],
        msg = m['msg'];

  // toJson
  Map<String, dynamic> toJson() => {
        'status': status,
        'msg': msg,
      };
}

class Network {
  String addressRegex;
  String coin;
  String depositDesc;
  bool depositEnable;
  bool isDefault;
  String memoRegex;
  int minConfirm;
  String name;
  String network;
  bool resetAddressStatus;
  String specialTips;
  int unLockConfirm;
  String withdrawDesc;
  bool withdrawEnable;
  double withdrawFee;
  double withdrawIntegerMultiple;
  double withdrawMax;
  double withdrawMin;
  bool sameAddress;

  Network.fromMap(Map m)
      : addressRegex = m['addressRegex'],
        coin = m['coin'],
        depositDesc = m['depositDesc'],
        depositEnable = m['depositEnable'],
        isDefault = m['isDefault'],
        memoRegex = m['memoRegex'],
        minConfirm = m['minConfirm'],
        name = m['name'],
        network = m['network'],
        resetAddressStatus = m['resetAddressStatus'],
        specialTips = m['specialTips'],
        unLockConfirm = m['unLockConfirm'],
        withdrawDesc = m['withdrawDesc'],
        withdrawEnable = m['withdrawEnable'],
        withdrawFee = double.parse(m['withdrawFee']),
        withdrawIntegerMultiple = double.parse(m['withdrawIntegerMultiple']),
        withdrawMax = double.parse(m['withdrawMax']),
        withdrawMin = double.parse(m['withdrawMin']),
        sameAddress = m['sameAddress'];

  // toJson
  Map<String, dynamic> toJson() => {
        'addressRegex': addressRegex,
        'coin': coin,
        'depositDesc': depositDesc,
        'depositEnable': depositEnable,
        'isDefault': isDefault,
        'memoRegex': memoRegex,
        'minConfirm': minConfirm,
        'name': name,
        'network': network,
        'resetAddressStatus': resetAddressStatus,
        'specialTips': specialTips,
        'unLockConfirm': unLockConfirm,
        'withdrawDesc': withdrawDesc,
        'withdrawEnable': withdrawEnable,
        'withdrawFee': withdrawFee,
        'withdrawIntegerMultiple': withdrawIntegerMultiple,
        'withdrawMax': withdrawMax,
        'withdrawMin': withdrawMin,
        'sameAddress': sameAddress,
      };
}

class CoinData {
  String coin;
  bool depositAllEnable;
  double free;
  double freeze;
  double ipoable;
  double ipoing;
  bool isLegalMoney;
  double locked;
  String name;
  List<Network> networkList;
  double storage;
  bool trading;
  bool withdrawAllEnable;
  double withdrawing;

  CoinData.fromMap(Map m)
      : coin = m['coin'],
        depositAllEnable = m['depositAllEnable'],
        free = double.parse(m['free']),
        freeze = double.parse(m['freeze']),
        ipoable = double.parse(m['ipoable']),
        ipoing = double.parse(m['ipoing']),
        isLegalMoney = m['isLegalMoney'],
        locked = double.parse(m['locked']),
        name = m['name'],
        networkList = (m['networkList'] as List<dynamic>)
            .map((e) => Network.fromMap(e))
            .toList(),
        storage = double.parse(m['storage']),
        trading = m['trading'],
        withdrawAllEnable = m['withdrawAllEnable'],
        withdrawing = double.parse(m['withdrawing']);

  Map<String, dynamic> toJson() => {
        'coin': coin,
        'depositAllEnable': depositAllEnable,
        'free': free,
        'freeze': freeze,
        'ipoable': ipoable,
        'ipoing': ipoing,
        'isLegalMoney': isLegalMoney,
        'locked': locked,
        'name': name,
        'networkList': networkList,
        'storage': storage,
        'trading': trading,
        'withdrawAllEnable': withdrawAllEnable,
        'withdrawing': withdrawing,
      };
}

class SnapshotData {
  List<Balance> balances;
  double totalAssetOfBtc;

  SnapshotData.fromMap(Map m)
      : balances = (m['balances'] as List<dynamic>)
            .map((e) => Balance.fromMap(e))
            .toList(),
        totalAssetOfBtc = double.parse(m['totalAssetOfBtc']);

  // toJson
  Map<String, dynamic> toJson() => {
        'balances': balances,
        'totalAssetOfBtc': totalAssetOfBtc,
      };
}

class SnapshotVos {
  SnapshotData data;
  String type;
  int updateTime;

  SnapshotVos.fromMap(Map m)
      : data = SnapshotData.fromMap(m['data']),
        type = m['type'],
        updateTime = m['updateTime'];

  // toJson
  Map<String, dynamic> toJson() => {
        'data': data,
        'type': type,
        'updateTime': updateTime,
      };
}

class Snapshots {
  int code;
  String msg;
  List<SnapshotVos> snapshotVos;

  Snapshots.fromMap(Map m)
      : code = m['code'],
        msg = m['msg'],
        snapshotVos = (m['snapshotVos'] as List<dynamic>)
            .map((e) => SnapshotVos.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'snapshotVos': snapshotVos,
      };
}

class SnapshotMarginData {
  double marginLevel;
  double totalAssetOfBtc;
  double totalLiabilityOfBtc;
  double totalNetAssetOfBtc;
  List<MarginBalance> userAssets;

  SnapshotMarginData.fromMap(Map m)
      : marginLevel = double.parse(m['marginLevel']),
        totalAssetOfBtc = double.parse(m['totalAssetOfBtc']),
        totalLiabilityOfBtc = double.parse(m['totalLiabilityOfBtc']),
        totalNetAssetOfBtc = double.parse(m['totalNetAssetOfBtc']),
        userAssets = (m['userAssets'] as List<dynamic>)
            .map((e) => MarginBalance.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'marginLevel': marginLevel,
        'totalAssetOfBtc': totalAssetOfBtc,
        'totalLiabilityOfBtc': totalLiabilityOfBtc,
        'totalNetAssetOfBtc': totalNetAssetOfBtc,
        'userAssets': userAssets,
      };
}

class SnapshotVosMargin {
  SnapshotMarginData data;
  String type;
  int updateTime;

  SnapshotVosMargin.fromMap(Map m)
      : data = SnapshotMarginData.fromMap(m['data']),
        type = m['type'],
        updateTime = m['updateTime'];

  // toJson
  Map<String, dynamic> toJson() => {
        'data': data,
        'type': type,
        'updateTime': updateTime,
      };
}

class SnapshotsMargin {
  int code;
  String msg;
  List<SnapshotVosMargin> snapshotVos;

  SnapshotsMargin.fromMap(Map m)
      : code = m['code'],
        msg = m['msg'],
        snapshotVos = (m['snapshotVos'] as List<dynamic>)
            .map((e) => SnapshotVosMargin.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'snapshotVos': snapshotVos,
      };
}

class FuturesBalance {
  String asset;
  double marginBalance;
  double walletBalance;

  FuturesBalance.fromMap(Map m)
      : asset = m['asset'],
        marginBalance = double.parse(m['marginBalance']),
        walletBalance = double.parse(m['walletBalance']);

  // toJson
  Map<String, dynamic> toJson() => {
        'asset': asset,
        'marginBalance': marginBalance,
        'walletBalance': walletBalance,
      };
}

class FuturesPosition {
  double entryPrice;
  double markPrice;
  double positionAmt;
  String symbol;
  double unRealizedProfit;

  FuturesPosition.fromMap(Map m)
      : entryPrice = double.parse(m['entryPrice']),
        markPrice = double.parse(m['markPrice']),
        positionAmt = double.parse(m['positionAmt']),
        symbol = m['symbol'],
        unRealizedProfit = double.parse(m['unRealizedProfit']);

  // toJson
  Map<String, dynamic> toJson() => {
        'entryPrice': entryPrice,
        'markPrice': markPrice,
        'positionAmt': positionAmt,
        'symbol': symbol,
        'unRealizedProfit': unRealizedProfit,
      };
}

class SnapshotFuturesData {
  List<FuturesBalance> assets;
  List<FuturesPosition> position;

  SnapshotFuturesData.fromMap(Map m)
      : assets = (m['assets'] as List<dynamic>)
            .map((e) => FuturesBalance.fromMap(e))
            .toList(),
        position = (m['position'] as List<dynamic>)
            .map((e) => FuturesPosition.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'assets': assets,
        'position': position,
      };
}

class SnapshotVosFutures {
  SnapshotFuturesData data;
  String type;
  int updateTime;

  SnapshotVosFutures.fromMap(Map m)
      : data = SnapshotFuturesData.fromMap(m['data']),
        type = m['type'],
        updateTime = m['updateTime'];

  // toJson
  Map<String, dynamic> toJson() => {
        'data': data,
        'type': type,
        'updateTime': updateTime,
      };
}

class SnapshotsFutures {
  int code;
  String msg;
  List<SnapshotVosFutures> snapshotVos;

  SnapshotsFutures.fromMap(Map m)
      : code = m['code'],
        msg = m['msg'],
        snapshotVos = (m['snapshotVos'] as List<dynamic>)
            .map((e) => SnapshotVosFutures.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'snapshotVos': snapshotVos,
      };
}

class Withdraw {
  String address;
  double amount;
  String applyTime;
  String coin;
  String id;
  String withdrawOrderId;
  String network;
  int transferType;
  int status;
  double transactionFee;
  int confirmNo;
  String txId;

  Withdraw.fromMap(Map m)
      : address = m['address'],
        amount = double.parse(m['amount']),
        applyTime = m['applyTime'],
        coin = m['coin'],
        id = m['id'],
        withdrawOrderId = m['withdrawOrderId'],
        network = m['network'],
        transferType = m['transferType'],
        status = m['status'],
        transactionFee = double.parse(m['transactionFee']),
        confirmNo = m['confirmNo'],
        txId = m['txId'];

  // toJson
  Map<String, dynamic> toJson() => {
        'address': address,
        'amount': amount,
        'applyTime': applyTime,
        'coin': coin,
        'id': id,
        'withdrawOrderId': withdrawOrderId,
        'network': network,
        'transferType': transferType,
        'status': status,
        'transactionFee': transactionFee,
        'confirmNo': confirmNo,
        'txId': txId,
      };
}

class ICVT {
  String i;
  int c;
  double v;
  double t;

  ICVT.fromMap(Map m)
      : i = m['i'],
        c = m['c'],
        v = double.parse(m['v']),
        t = double.parse(m['t']);

  // toJson
  Map<String, dynamic> toJson() => {
        'i': i,
        'c': c,
        'v': v,
        't': t,
      };
}

class ApiTradingIndicator {
  String name;
  ICVT ufr;
  ICVT ifer;
  ICVT gcr;

  ApiTradingIndicator.fromEntry(MapEntry e)
      : name = e.key,
        ufr = ICVT.fromMap(e.value[0]),
        ifer = ICVT.fromMap(e.value[1]),
        gcr = ICVT.fromMap(e.value[2]);

  // toJson
  Map<String, dynamic> toJson() => {
        'name': name,
        'ufr': ufr,
        'ifer': ifer,
        'gcr': gcr,
      };
}

class AccountApiTradingData {
  bool isLocked;
  int plannedRecoverTime;
  Map<String, int> triggerCondition;
  List<ApiTradingIndicator> indicators;
  int updateTime;

  AccountApiTradingData.fromMap(Map m)
      : isLocked = m['isLocked'],
        plannedRecoverTime = m['plannedRecoverTime'],
        triggerCondition = m['triggerCondition'],
        indicators = (m['indicators'] as Map<String, dynamic>)
            .entries
            .map((e) => ApiTradingIndicator.fromEntry(e))
            .toList(),
        updateTime = m['updateTime'];

  // toJson
  Map<String, dynamic> toJson() => {
        'isLocked': isLocked,
        'plannedRecoverTime': plannedRecoverTime,
        'triggerCondition': triggerCondition,
        'indicators': indicators,
        'updateTime': updateTime,
      };
}

class DribbletDetail {
  int transId;
  double serviceChargeAmount;
  double amount;
  int operateTime;
  double transferedAmount;
  String fromAsset;

  DribbletDetail.fromMap(Map m)
      : transId = m['transId'] ?? m['tranId'],
        serviceChargeAmount = double.parse(m['serviceChargeAmount']),
        amount = double.parse(m['amount']),
        operateTime = m['operateTime'],
        transferedAmount = double.parse(m['transferedAmount']),
        fromAsset = m['fromAsset'];

  // toJson
  Map<String, dynamic> toJson() => {
        'transId': transId,
        'serviceChargeAmount': serviceChargeAmount,
        'amount': amount,
        'operateTime': operateTime,
        'transferedAmount': transferedAmount,
        'fromAsset': fromAsset,
      };
}

class Dribblet {
  int operateTime;
  double totalTransferedAmount;
  double totalServiceChargeAmount;
  int transId;
  List<DribbletDetail> userAssetDribbletDetails;

  Dribblet.fromMap(Map m)
      : operateTime = m['operateTime'],
        totalTransferedAmount = double.parse(m['totalTransferedAmount']),
        totalServiceChargeAmount = double.parse(m['totalServiceChargeAmount']),
        transId = m['transId'],
        userAssetDribbletDetails =
            (m['userAssetDribbletDetails'] as List<dynamic>)
                .map((e) => DribbletDetail.fromMap(e))
                .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'operateTime': operateTime,
        'totalTransferedAmount': totalTransferedAmount,
        'totalServiceChargeAmount': totalServiceChargeAmount,
        'transId': transId,
        'userAssetDribbletDetails': userAssetDribbletDetails,
      };
}

class DustLog {
  int total;
  List<Dribblet> userAssetDribblets;

  DustLog.fromMap(Map m)
      : total = m['total'],
        userAssetDribblets = (m['userAssetDribblets'] as List<dynamic>)
            .map((e) => Dribblet.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'total': total,
        'userAssetDribblets': userAssetDribblets,
      };
}

class DustConversion {
  double totalServiceCharge;
  double totalTransfered;
  List<DribbletDetail> transferResult;

  DustConversion.fromMap(Map m)
      : totalServiceCharge = double.parse(m['totalServiceCharge']),
        totalTransfered = double.parse(m['totalTransfered']),
        transferResult = (m['transferResult'] as List<dynamic>)
            .map((e) => DribbletDetail.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'totalServiceCharge': totalServiceCharge,
        'totalTransfered': totalTransfered,
        'transferResult': transferResult,
      };
}

class Dividend {
  double amount;
  String asset;
  int divTime;
  String enInfo;
  int tranId;

  Dividend.fromMap(Map m)
      : amount = double.parse(m['amount']),
        asset = m['asset'],
        divTime = m['divTime'],
        enInfo = m['enInfo'],
        tranId = m['tranId'];

  // toJson
  Map<String, dynamic> toJson() => {
        'amount': amount,
        'asset': asset,
        'divTime': divTime,
        'enInfo': enInfo,
        'tranId': tranId,
      };
}

class DividendRecord {
  List<Dividend> rows;
  int total;

  DividendRecord.fromMap(Map m)
      : rows = (m['rows'] as List<dynamic>)
            .map((e) => Dividend.fromMap(e))
            .toList(),
        total = m['total'];

  // toJson
  Map<String, dynamic> toJson() => {
        'rows': rows,
        'total': total,
      };
}

class AssetDetail {
  String name;
  double minWithdrawAmount;
  bool depositStatus;
  int withdrawFee;
  bool withdrawStatus;
  String depositTip;

  AssetDetail.fromMapEntry(MapEntry e)
      : name = e.key,
        minWithdrawAmount = double.parse(e.value['minWithdrawAmount']),
        depositStatus = e.value['depositStatus'],
        withdrawFee = e.value['withdrawFee'],
        withdrawStatus = e.value['withdrawStatus'],
        depositTip = e.value['depositTip'];

  // toJson
  Map<String, dynamic> toJson() => {
        'name': name,
        'minWithdrawAmount': minWithdrawAmount,
        'depositStatus': depositStatus,
        'withdrawFee': withdrawFee,
        'withdrawStatus': withdrawStatus,
        'depositTip': depositTip,
      };
}

class TradeFee {
  String symbol;
  double makerCommission;
  double takerCommission;

  TradeFee.fromMap(Map m)
      : symbol = m['symbol'],
        makerCommission = double.parse(m['makerCommission']),
        takerCommission = double.parse(m['takerCommission']);

  // toJson
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'makerCommission': makerCommission,
        'takerCommission': takerCommission,
      };
}

class UniversalTransfer {
  String asset;
  double amount;
  String type;
  String status;
  int tranId;
  int timestamp;

  UniversalTransfer.fromMap(Map m)
      : asset = m['asset'],
        amount = double.parse(m['amount']),
        type = m['type'],
        status = m['status'],
        tranId = m['tranId'],
        timestamp = m['timestamp'];

  // toJson
  Map<String, dynamic> toJson() => {
        'asset': asset,
        'amount': amount,
        'type': type,
        'status': status,
        'tranId': tranId,
        'timestamp': timestamp,
      };
}

class UniversalTransferHistory {
  int total;
  List<UniversalTransfer> rows;

  UniversalTransferHistory.fromMap(Map m)
      : total = m['total'],
        rows = (m['rows'] as List<dynamic>)
            .map((e) => UniversalTransfer.fromMap(e))
            .toList();

  // toJson
  Map<String, dynamic> toJson() => {
        'total': total,
        'rows': rows,
      };
}

class FundingAsset {
  String asset;
  double free;
  double locked;
  double freeze;
  double withdrawing;
  double btcValuation;

  FundingAsset.fromMap(Map m)
      : asset = m['asset'],
        free = double.parse(m['free']),
        locked = double.parse(m['locked']),
        freeze = double.parse(m['freeze']),
        withdrawing = double.parse(m['withdrawing']),
        btcValuation = double.parse(m['btcValuation']);

  // toJson
  Map<String, dynamic> toJson() => {
        'asset': asset,
        'free': free,
        'locked': locked,
        'freeze': freeze,
        'withdrawing': withdrawing,
        'btcValuation': btcValuation,
      };
}

class ApiRestrictions {
  bool ipRestrict;
  int createTime;
  bool enableWithdrawals;
  bool enableInternalTransfer;
  bool permitsUniversalTransfer;
  bool enableVanillaOptions;
  bool enableReading;
  bool enableFutures;
  bool enableMargin;
  bool enableSpotAndMarginTrading;
  int? tradingAuthorityExpirationTime;

  ApiRestrictions.fromMap(Map m)
      : ipRestrict = m['ipRestrict'],
        createTime = m['createTime'],
        enableWithdrawals = m['enableWithdrawals'],
        enableInternalTransfer = m['enableInternalTransfer'],
        permitsUniversalTransfer = m['permitsUniversalTransfer'],
        enableVanillaOptions = m['enableVanillaOptions'],
        enableReading = m['enableReading'],
        enableFutures = m['enableFutures'],
        enableMargin = m['enableMargin'],
        enableSpotAndMarginTrading = m['enableSpotAndMarginTrading'],
        tradingAuthorityExpirationTime = m['tradingAuthorityExpirationTime'];

  // toJson
  Map<String, dynamic> toJson() => {
        'ipRestrict': ipRestrict,
        'createTime': createTime,
        'enableWithdrawals': enableWithdrawals,
        'enableInternalTransfer': enableInternalTransfer,
        'permitsUniversalTransfer': permitsUniversalTransfer,
        'enableVanillaOptions': enableVanillaOptions,
        'enableReading': enableReading,
        'enableFutures': enableFutures,
        'enableMargin': enableMargin,
        'enableSpotAndMarginTrading': enableSpotAndMarginTrading,
        'tradingAuthorityExpirationTime': tradingAuthorityExpirationTime,
      };
}
