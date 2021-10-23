import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../account.dart';
import '../account_token.dart';
import '../balance.dart';
import '../billing_details.dart';
import '../card.dart';
import '../card_token.dart';
import '../charge.dart';
import '../customer.dart';
import '../payment_intent.dart';
import '../payment_method.dart';
import '../payout.dart';
import '../refund.dart';
import '../shipping.dart';
import '../stripe_error.dart';
import '../transfer.dart';

class StripeConnect {
  static String? apiKey;

  static const _apiBaseUrl = 'https://api.stripe.com/v1';
  static const _oAuthLink =
      'https://connect.stripe.com/express/oauth/authorize';
  static const _connectUrl = 'https://connect.stripe.com/oauth/token';
  static const _paymentIntents = 'payment_intents';
  static const _paymentsMethods = 'payment_methods';

  static const _tokens = 'tokens';
  static const _accounts = 'accounts';
  static const _customers = 'customers';
  static const _balance = 'balance';
  static const _transfers = 'transfers';
  static const _refunds = 'refunds';
  static const _charges = 'charges';
  static const _payouts = "payouts";

  StripeConnect._internal();

  static final StripeConnect _singleton = StripeConnect._internal();

  factory StripeConnect() {
    return _singleton;
  }

  set setApiKey(String apikey) {
    StripeConnect.apiKey = apikey;
  }

  Uri getOAuthEndPoint(String clientId, String redirectUrl) {
    return Uri.parse(
        "${StripeConnect._oAuthLink}?redirect_uri=$redirectUrl&client_id=$clientId&scope=read_write");
  }

  String getTokenEndPoint() {
    return "${StripeConnect._connectUrl}";
  }

  String _getCardTokenEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._tokens}";
  }

  String _getAccountEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._accounts}";
  }

  String _getCustomerEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._customers}";
  }

  String _getChargeEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._charges}";
  }

  String _getTransferEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._transfers}";
  }

  String _getBalanceEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._balance}";
  }

  String _getPaymentMethodEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._paymentsMethods}";
  }

  String _getPaymentIntentEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._paymentIntents}";
  }

  String _getPayoutEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._payouts}";
  }

  String _getRefundEndPoint() {
    return "${StripeConnect._apiBaseUrl}/${StripeConnect._refunds}";
  }

  Future<http.Response> get() async {
    final response = await http.get(
      getOAuthEndPoint('clientId', 'redirectUrl'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
      },
    );

    return response;
  }

  Future<AccountToken> getAccountToken(String tokenCode) async {
    var params = new Map<String, dynamic>();

    params['code'] = tokenCode;
    params['grant_type'] = 'authorization_code';

    String endpoint = getTokenEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new AccountToken.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Account> getAccount(String accountid) async {
    String endpoint = _getAccountEndPoint() + "/$accountid";

    final http.Response response = await http.post(
      Uri.parse(endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
      },
    );

    if (response.statusCode == 200) {
      return new Account.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Customer> getCustomer(String customerid) async {
    String endpoint = _getCustomerEndPoint() + "/$customerid";

    final http.Response response = await http.post(
      Uri.parse(endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
      },
    );

    if (response.statusCode == 200) {
      return new Customer.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Balance> getBalance() async {
    String endpoint = _getBalanceEndPoint();

    final http.Response response = await http.get(
      Uri.parse(endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
      },
    );

    if (response.statusCode == 200) {
      return new Balance.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Customer> postCustomer(String name, String email,
      {String? line1,
      String? line2,
      String? city,
      String? zipcode,
      String? country}) async {
    Shipping? shipping;
    if (zipcode != null && line1 != null) {
      shipping = new Shipping(
          name: name,
          address: new ShippingAddress(
              addressLine1: line1,
              addressLine2: line2 ?? line2,
              city: city ?? city,
              countryCode: country ?? country!.toLowerCase(),
              postalCode: zipcode));
    }

    Customer customer =
        new Customer(name: name, email: email, shipping: shipping);

    String endpoint = _getCustomerEndPoint();

    var params = customer.toPostMap();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new Customer.fromMap(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<Customer> postCustomerDefaultPaymentMethod(
      String customerId, String cardToken) async {
    Map<String, dynamic> data = new Map<String, dynamic>();

    data['default_source'] = cardToken;

    String endpoint = _getCustomerEndPoint() + '/$customerId';

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: data);

    if (response.statusCode == 200) {
      return new Customer.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<PaymentMethod> postAttachPaymentMethod(
      String customerid, String paymentmethodid) async {
    String endpoint = _getPaymentMethodEndPoint() + '/$paymentmethodid/attach';

    var params = new Map<String, dynamic>();

    params['customer'] = customerid;

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new PaymentMethod.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<PaymentIntent> getPaymentIntent(String paymentIntentId) async {
    String endpoint = _getPaymentIntentEndPoint() + '/$paymentIntentId';

    final http.Response response = await http.get(
      Uri.parse(endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
      },
    );

    if (response.statusCode == 200) {
      return new PaymentIntent.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  /// use onbehalf parameter only for accounts outside stripe US, it's false by default for accounts outside us.
  Future<PaymentIntent> postPaymentIntent(
      {String? paymentMethodId,
      String? customerId,
      double? amount,
      String? currency,
      String? accountId,
      double? rate,
      double? gatewayFees,
      bool? onBehalf,
      String? description,
      String? receiptEmail,
      String? transferGroup}) async {
    int factor =
        currency!.contains("jpy") || currency.contains("krw") ? 1 : 100;

    int appFees = (amount! * factor * (gatewayFees! + rate!) / 100).round();

    int paidAmount = (amount * factor * (1 + gatewayFees / 100)).round();

    TransferData transferData = new TransferData(destination: accountId);

    PaymentIntent payment = new PaymentIntent(
        amount: paidAmount,
        currency: currency,
        paymentMethod: paymentMethodId,
        customer: customerId,
        receiptEmail: receiptEmail,
        transferData: transferData,
        applicationFeeAmount: appFees,
        onBehalfOf: onBehalf == false ? accountId : null,
        description: description,
        transferGroup: transferGroup);

    var params = payment.toPostMap();

    String endpoint = _getPaymentIntentEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new PaymentIntent.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<PaymentIntent> postPaymentIntentConfirmation(String paymentIntentId,
      {String? returnUrl}) async {
    String endpoint = _getPaymentIntentEndPoint() + '/$paymentIntentId/confirm';

    Map? params;

    if (returnUrl != null) {
      params = {'return_url': '$returnUrl'};
    }

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new PaymentIntent.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<PaymentIntent> postPaymentIntentCapture(String paymentIntentId) async {
    String endpoint = _getPaymentIntentEndPoint() + '/$paymentIntentId/capture';

    final http.Response response = await http.post(
      Uri.parse(endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
      },
    );

    if (response.statusCode == 200) {
      return new PaymentIntent.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<PaymentIntent> postPaymentIntentCancellation(
      String paymentIntentId) async {
    String endpoint = _getPaymentIntentEndPoint() + '/$paymentIntentId/cancel';

    final http.Response response = await http.get(
      Uri.parse(endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
      },
    );

    if (response.statusCode == 200) {
      return new PaymentIntent.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Transfer> postTransfer(int amount, String currency, String accountid,
      [String? transferGroup]) async {
    int factor = currency.contains("jpy") || currency.contains("krw") ? 1 : 100;

    Transfer transfer = new Transfer(
        amount: amount * factor,
        currency: currency,
        destination: accountid,
        transferGroup: transferGroup);

    var params = transfer.toPostMap();

    print(params);

    String endpoint = _getTransferEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new Transfer.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<CardToken> postCardToken(
      String number, int expmonth, int expyear, String cvc) async {
    Card card = new Card(
        number: number, expMonth: expmonth, expYear: expyear, cvc: cvc);

    Map params = card.toPostMap();

    String endpoint = _getCardTokenEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);
    if (response.statusCode == 200) {
      return new CardToken.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<PaymentMethod> postPaymentMethod(
      String number, int expmonth, int expyear, String cvc,
      {String? name,
      String? email,
      String? line1,
      String? line2,
      String? city,
      String? zipcode,
      String? country}) async {
    BillingDetails billingDetails = new BillingDetails(
        name: name,
        email: email,
        address: new BillingAddress(
            addressLine1: line1 ?? line1,
            addressLine2: line2 ?? line2,
            city: city ?? city,
            countryCode: country ?? country!.toLowerCase(),
            postalCode: zipcode ?? zipcode));

    Card card = new Card(
        number: number, expMonth: expmonth, expYear: expyear, cvc: cvc);

    PaymentMethod method = new PaymentMethod(
        card: card, type: 'card', billingDetails: billingDetails);

    Map params = method.toPostMap();

    String endpoint = _getPaymentMethodEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);
    if (response.statusCode == 200) {
      return new PaymentMethod.fromMap(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<Charge> postCharge(int amount, String currency, String cardToken,
      String customerId, String description) async {
    int factor = currency.contains("jpy") || currency.contains("krw") ? 1 : 100;

    Charge charge = new Charge(
        amount: amount * factor,
        currency: currency,
        source: cardToken,
        customer: customerId,
        description: description);

    Map params = charge.toPostMap();

    String endpoint = _getChargeEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);
    if (response.statusCode == 200) {
      return new Charge.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Charge> postChargeCapture(String chargeid) async {
    String endpoint = _getChargeEndPoint() + '/$chargeid/capture';

    final http.Response response = await http.post(
      Uri.parse(endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
      },
    );

    if (response.statusCode == 200) {
      return new Charge.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Refund> postRefundPayment(String paymentIntentId,
      {num? amount, String? currency, num? refundRate}) async {
    Refund refund;

    int refundAmount;

    if (amount == null || refundRate == 100) {
      refund = new Refund(paymentIntent: paymentIntentId);
    } else {
      int factor =
          currency!.contains("jpy") || currency.contains("krw") ? 1 : 100;

      refundAmount = amount * factor * refundRate! ~/ 100;

      refund = new Refund(
          paymentIntent: paymentIntentId,
          amount: refundAmount,
          currency: currency);
    }

    Map params = refund.toPostMap();

    String endpoint = _getRefundEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new Refund.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Refund> postRefundCharge(String chargeId) async {
    Refund refund = new Refund(charge: chargeId);

    Map params = refund.toPostMap();

    String endpoint = _getRefundEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new Refund.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Refund> postPartialRefundPayment(
      String paymentIntentId, int? amount, String currency) async {
    int factor = currency.contains("jpy") || currency.contains("krw") ? 1 : 100;

    Refund refund = new Refund(
        paymentIntent: paymentIntentId,
        amount: (amount!) * factor,
        currency: currency);

    Map params = refund.toPostMap();

    String endpoint = _getRefundEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new Refund.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Refund> postPartialRefundCharge(
      String chargeId, int amount, String currency) async {
    int factor = currency.contains("jpy") || currency.contains("krw") ? 1 : 100;

    Refund refund = new Refund(
        charge: chargeId, amount: amount * factor, currency: currency);

    Map params = refund.toPostMap();

    String endpoint = _getRefundEndPoint();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
        },
        body: params);

    if (response.statusCode == 200) {
      return new Refund.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Payout> getPayout(String payoutId) async {
    String endpoint = _getPayoutEndPoint() + "/$payoutId";

    final http.Response response = await http.get(
      Uri.parse(endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}"
      },
    );

    if (response.statusCode == 200) {
      return new Payout.fromMap(json.decode(response.body));
    } else {
      throw Exception(
          StripeError.fromMap(json.decode(response.body)).error!.message);
    }
  }

  Future<Payout> postPayout(
      num amount, String currency, String accountId, String description) async {
    String endpoint = _getPayoutEndPoint();

    int factor = currency.contains("jpy") || currency.contains("krw") ? 1 : 100;

    int payOutAmount = (amount * factor).toInt();

    Payout payout = new Payout(
        currency: currency, amount: payOutAmount, description: description);

    Map params = payout.toPostMap();

    final http.Response response = await http.post(Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${StripeConnect.apiKey}",
          "Stripe-Account": "$accountId"
        },
        body: params);

    if (response.statusCode == 200) {
      return new Payout.fromMap(json.decode(response.body));
    } else {
      throw Exception(response.body);
    }
  }
}
final stripeConnect=StripeConnect();
