



import 'billing_details.dart';
import 'package:stripeznpplugin/model/card.dart';

class PaymentMethod {
  String? id;
  Card? card;
  String? type;
  BillingDetails? billingDetails;
  String? customer;

  PaymentMethod({
    this.card,
    this.type = "card",
    this.customer,
    this.billingDetails
  });

  PaymentMethod.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    card = json['card'] != null ? new Card.fromMap(json['card']) : null;
    type = json['type'];
    customer = json['customer'];    
    billingDetails = json['billing_details'] != null ? new BillingDetails.fromMap(json['billing_details']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.card != null) {
      data['card'] = this.card!.toMap();
    }
    data['customer'] = this.customer;
    data['type'] = this.type;

    return data;
  }

  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.card != null) {
      data.addAll(this.card!.toPostMap());
    }  
     if(this.billingDetails !=null) {
      data.addAll(billingDetails!.toPostMap());
    }
    return data;
  }
}