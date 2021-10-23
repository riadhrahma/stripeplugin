

import 'charge.dart';

class PaymentIntent {
	String? id;
	int? amount;
	num? amountCapturable;
	num? amountReceived;
	String? application;
	num? applicationFeeAmount;
	int? canceledAt;
	String? cancellationReason;
	String? captureMethod;
	Charges? charges;
	String? clientSecret;
	String? confirmationMethod;
	int? created;
	String? currency;
	String? customer;
	String? description;
	String? invoice;
	LastPaymentError? lastPaymentError;
	bool? livemode;
	NextAction? nextAction;
	String? onBehalfOf;
	String? paymentMethod;
	List<String>? paymentMethodTypes;
	String? receiptEmail;
	String? status;
	TransferData? transferData;
	String? transferGroup;

	PaymentIntent({this.id, this.amount, this.amountCapturable, this.amountReceived, this.application, this.applicationFeeAmount, this.canceledAt, this.cancellationReason, this.captureMethod, this.charges, this.clientSecret, this.confirmationMethod, this.created, this.currency, this.customer, this.description, this.invoice, this.lastPaymentError, this.livemode, this.nextAction, this.onBehalfOf, this.paymentMethod, this.paymentMethodTypes, this.receiptEmail, this.status, this.transferData, this.transferGroup});

	PaymentIntent.fromMap(Map<String, dynamic> json) {
		id = json['id'];		
		amount = json['amount'];
		amountCapturable = json['amount_capturable'];
		amountReceived = json['amount_received'];
		application = json['application'];
		applicationFeeAmount = json['application_fee_amount'];
		canceledAt = json['canceled_at'];
		cancellationReason = json['cancellation_reason'];
		captureMethod = json['capture_method'];
		charges = json['charges'] != null ? new Charges.fromMap(json['charges']) : null;
		clientSecret = json['client_secret'];
		confirmationMethod = json['confirmation_method'];
		created = json['created'];
		currency = json['currency'];
		customer = json['customer'];
		description = json['description'];
		invoice = json['invoice'];
		lastPaymentError = json['last_payment_error'] != null ? new LastPaymentError.fromMap(json['last_payment_error']) : null;
		livemode = json['livemode'];	
		nextAction = json['next_action'] != null ? new NextAction.fromMap(json['next_action']) : null;
		onBehalfOf = json['on_behalf_of'];
		paymentMethod = json['payment_method'];	
		paymentMethodTypes = json['payment_method_types'].cast<String>();
		receiptEmail = json['receipt_email'];		
		status = json['status'];
		transferData = json['transfer_data'] != null ? new TransferData.fromMap(json['transfer_data']) : null;
		transferGroup = json['transfer_group'];
	}

	Map<String, dynamic> toMap() {
		final Map<String, dynamic> data = new Map<String, dynamic>();	
		data['amount'] = this.amount;
		data['amount_capturable'] = this.amountCapturable;
		data['amount_received'] = this.amountReceived;
		data['application'] = this.application;
		data['application_fee_amount'] = this.applicationFeeAmount;
		data['canceled_at'] = this.canceledAt;
		data['cancellation_reason'] = this.cancellationReason;
		data['capture_method'] = this.captureMethod;
		if (this.charges != null) {
      data['charges'] = this.charges!.toMap();
    }
		data['client_secret'] = this.clientSecret;
		data['confirmation_method'] = this.confirmationMethod;
		data['created'] = this.created;
		data['currency'] = this.currency;
		data['customer'] = this.customer;
		data['description'] = this.description;	
		data['livemode'] = this.livemode;		
		data['next_action'] = this.nextAction;
		data['on_behalf_of'] = this.onBehalfOf;
		data['payment_method'] = this.paymentMethod;		
		data['payment_method_types'] = this.paymentMethodTypes;
		data['receipt_email'] = this.receiptEmail;
    if (this.transferData != null) {				
		  data['transfer_data'] = this.transferData!.toMap();
    }
		data['transfer_group'] = this.transferGroup;
		return data;
	}

	Map<String, dynamic> toPostMap() {
		final Map<String, dynamic> data = new Map<String, dynamic>();	
		data['amount'] = this.amount.toString();
    data['currency'] = this.currency;
    if(this.amountCapturable != null) {
      data['amount_capturable'] = this.amountCapturable.toString();
    }
    if(this.amountReceived != null) {
      data['amount_received'] = this.amountReceived.toString();
    }
    if(this.applicationFeeAmount != null) {
      data['application_fee_amount'] = this.applicationFeeAmount.toString();
    }
		if (this.charges != null) {
      data.addAll(this.charges!.toPostMap());
    }			
    if(this.customer != null) {
      data['customer'] = this.customer;	
    }		
    if(this.description != null) {
      data['description'] = this.description;	
    }
    if(this.onBehalfOf != null) {
      data['on_behalf_of'] = this.onBehalfOf;	
    }	
    if(this.paymentMethod != null) {
      data['payment_method'] = this.paymentMethod;	
    }	
    if(this.paymentMethodTypes != null)
    {
        data['payment_method_types[]'] = this.paymentMethodTypes;
    }
    if(this.receiptEmail != null) {
      data['receipt_email'] = this.receiptEmail;	
    }				
    if (this.transferData != null) {				
		  data.addAll(this.transferData!.toPostMap());
    }
     if(this.transferGroup != null) {
      data['transfer_group'] = this.transferGroup;	
    }		
    if(this.nextAction != null) {
       data.addAll(this.nextAction!.toMap());
    }
	
		return data;
	}

}

class NextAction {
  String? type;
  RedirectToUrl? redirectToUrl;

  NextAction({this.type, this.redirectToUrl});

  NextAction.fromMap(Map<String, dynamic> json) {
    type = json['type'];
    redirectToUrl = json['redirect_to_url'] != null
        ? new RedirectToUrl.fromMap(json['redirect_to_url'])
        : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.redirectToUrl != null) {
      data['redirect_to_url'] = this.redirectToUrl!.toMap();
    }
    return data;
  }

    Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.type != null) {
      data['next_action[type]'] = this.type;
    }    
    if(this.redirectToUrl !=null) {
      data['next_action[return_url]'] = this.redirectToUrl!.toPostMap();
    }  
    return data;
  }
}

class RedirectToUrl {
  String? url;
  String? returnUrl;

  RedirectToUrl({this.url, this.returnUrl});

  RedirectToUrl.fromMap(Map<String, dynamic> json) {
    url = json['url'];
    returnUrl = json['return_url'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['return_url'] = this.returnUrl;
    return data;
  }

  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.url != null) {
      data['redirect_to_url[url]'] = this.url;
    }    
    if(this.returnUrl !=null) {
      data['redirect_to_url[return_url]'] = this.returnUrl;
    }  
    return data;
  }
}

class Charges { 
  List<Charge>? data;
  bool? hasMore;
  String? url;

  Charges({this.data, this.hasMore, this.url});

	Charges.fromMap(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = [];
			json['data'].forEach((v) { data!.add(new Charge.fromMap(v)); });
		}
		hasMore = json['has_more'];
		url = json['url'];
	}

	Map<String, dynamic> toMap() {
		final Map<String, dynamic> data = new Map<String, dynamic>();	    
		if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toMap()).toList();
    }
		data['has_more'] = this.hasMore;
		data['url'] = this.url;
		return data;
	}

  	Map<String, dynamic> toPostMap() {
		final Map<String, dynamic> data = new Map<String, dynamic>();		
    if(this.hasMore != null) {
      data['Charges[has_more]'] = this.hasMore;
    }
		
		data['Charges[url]'] = this.url;
		return data;
	}
}

class TransferData {
  int? amount;
  String? destination;

  TransferData({this.amount, this.destination});

  TransferData.fromMap(Map json) {
    amount = json['amount'];
    destination = json['destination'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['destination'] = this.destination;
    return data;
  }

  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.amount != null) {
      data['transfer_data[amount]'] = this.amount.toString();
    }    
    if(this.destination !=null) {
      data['transfer_data[destination]'] = this.destination.toString();
    }   
    
    return data;
  }

}

class LastPaymentError {
  String? type;
  String? message;

  LastPaymentError({this.type, this.message});

  LastPaymentError.fromMap(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
  }
  
}