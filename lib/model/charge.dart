
import 'package:stripeznpplugin/model/refund.dart';
import 'package:stripeznpplugin/model/transfer.dart';

import 'billing_details.dart';
import 'card.dart';
import 'card_token.dart';

class Charge {
  String? id;
  int? amount;
  int? amountRefunded;
  String? application;
  BillingDetails? billingDetails;
  bool? captured;
  int? created;
  String? currency;
  String? customer;
  String? description;
  bool? disputed;
  String? failureCode;
  String? failureMessage;
  String? invoice;
  bool? livemode;
  String? onBehalfOf;
  String? order;
  bool? paid;
  String? paymentIntent;
  String? paymentMethod;
  PaymentMethodDetails? paymentMethodDetails;
  String? receiptEmail;
  String? receiptNumber;
  String? receiptUrl;
  bool? refunded;
  Refunds? refunds;
  String? sourceTransfer;
  String? statementDescriptor;
  String? status;
  Transfer? transferData;
  String? transferGroup;
  String? source;

  Charge(
      {this.amount,
      this.amountRefunded,
      this.application,
      this.billingDetails,
      this.captured,
      this.created,
      this.currency,
      this.customer,
      this.description,
      this.disputed,
      this.failureCode,
      this.failureMessage,
      this.invoice,
      this.livemode,
      this.onBehalfOf,
      this.order,     
      this.paid,
      this.paymentIntent,
      this.paymentMethod,
      this.paymentMethodDetails,
      this.receiptEmail,
      this.receiptNumber,
      this.receiptUrl,
      this.refunded,
      this.refunds,
      this.sourceTransfer,
      this.statementDescriptor,
      this.status,
      this.transferData,
      this.transferGroup,
      this.source});

  Charge.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    amountRefunded = json['amount_refunded'];
    application = json['application'];
    billingDetails = json['billing_details'] != null
        ? new BillingDetails.fromMap(json['billing_details'])
        : null;
    captured = json['captured'];
    created = json['created'];
    currency = json['currency'];
    customer = json['customer'];
    description = json['description'];
    disputed = json['disputed'];
    failureCode = json['failure_code'];
    failureMessage = json['failure_message'];
    invoice = json['invoice'];
    livemode = json['livemode'];
    onBehalfOf = json['on_behalf_of'];
    order = json['order'];    
    paid = json['paid'];
    paymentIntent = json['payment_intent'];
    paymentMethod = json['payment_method'];
    paymentMethodDetails = json['payment_method_details'] != null
        ? new PaymentMethodDetails.fromJson(json['payment_method_details'])
        : null;
    receiptEmail = json['receipt_email'];
    receiptNumber = json['receipt_number'];
    receiptUrl = json['receipt_url'];
    refunded = json['refunded'];
    refunds =
        json['refunds'] != null ? new Refunds.fromMap(json['refunds']) : null;
    sourceTransfer = json['source_transfer'];
    statementDescriptor = json['statement_descriptor'];
    status = json['status'];
    transferData =  json['transfer_data'] != null ? new Transfer.fromMap(json['transfer_data']) : null;    
    transferGroup = json['transfer_group'];
    source = json['source'] != null ? new CardToken.fromMap(json['source']).id : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['amount_refunded'] = this.amountRefunded;
    data['application'] = this.application;
    if (this.billingDetails != null) {
      data['billing_details'] = this.billingDetails!.toMap();
    }
    data['captured'] = this.captured;
    data['created'] = this.created;
    data['currency'] = this.currency;
    data['customer'] = this.customer;
    data['description'] = this.description;
    data['disputed'] = this.disputed;
    data['failure_code'] = this.failureCode;
    data['failure_message'] = this.failureMessage;
    data['invoice'] = this.invoice;
    data['livemode'] = this.livemode;
    data['on_behalf_of'] = this.onBehalfOf;
    data['order'] = this.order;   
    data['paid'] = this.paid;
    data['payment_intent'] = this.paymentIntent;
    data['payment_method'] = this.paymentMethod;
    if (this.paymentMethodDetails != null) {
      data['payment_method_details'] = this.paymentMethodDetails!.toMap();
    }
    data['receipt_email'] = this.receiptEmail;
    data['receipt_number'] = this.receiptNumber;
    data['receipt_url'] = this.receiptUrl;
    data['refunded'] = this.refunded;
    if (this.refunds != null) {
      data['refunds'] = this.refunds!.toMap();
    }
    data['source_transfer'] = this.sourceTransfer;
    data['statement_descriptor'] = this.statementDescriptor;
    data['status'] = this.status;
    if (this.transferData != null) {
      data['transfer_data'] = this.transferData!.toMap();
    }  
    data['transfer_group'] = this.transferGroup;
    data['source'] = this.source;
    return data;
  }

  
Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
        
    data['amount'] = this.amount.toString();

    if (this.source != null) {
       data['source'] = this.source;
    }

    if(this.amountRefunded != null) {
      data['amount_refunded'] = this.amountRefunded.toString();    
    } 

    if (this.application != null) {
       data['application'] = this.application;
    }

    if (this.billingDetails != null) {
      data['billing_details'] = this.billingDetails!.toMap();
    }
    if (this.currency != null) {
       data['currency'] = this.currency;
    }   

    if (this.receiptEmail != null) {
       data['receipt_email'] = this.receiptEmail;
    }

    if (this.currency != null) {
       data['currency'] = this.currency;
    } 

    if (this.paymentIntent != null) {
       data['payment_intent'] = this.paymentIntent;
    } 

    if (this.customer != null) {
       data['customer'] = this.customer;
    }

    if (this.paymentMethod != null) {
       data['payment_method'] = this.paymentMethod;
    } 
    
    if (this.paymentMethodDetails != null) {
      data['payment_method_details'] = this.paymentMethodDetails!.toPostMap();
    }

    if (this.transferData != null) {
       data['transfer_data[destination]'] = this.transferData;
    } 
    
    return data;
  }
}

class PaymentMethodDetails {
  Card? card;
  String? type;

  PaymentMethodDetails({this.card, this.type});

  PaymentMethodDetails.fromJson(Map<String, dynamic> json) {
    card = json['card'] != null ? new Card.fromMap(json['card']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = this.card!.toMap();
    }
    data['type'] = this.type;
    return data;
  }

  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = this.card!.toPostMap();
    }
    data['type'] = this.type;
    return data;
  }
}

class Refunds {  
  List<Refund>? data;
  bool? hasMore;
  String? url;

  Refunds({this.data, this.hasMore, this.url});

  Refunds.fromMap(Map<String, dynamic> json) {  
    data = json['data'] == null ? null : List<Refund>.from(json['data'].map((x) => Refund.fromMap(x)));
    hasMore = json['has_more'];
    url = json['url'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data == null ? [] : List<Refund>.from(this.data!.map((x) => x.toMap()));
    data['has_more'] = this.hasMore;
    data['url'] = this.url;
    return data;
  }
}