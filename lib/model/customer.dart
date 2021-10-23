
import 'package:stripeznpplugin/model/shipping.dart';

class Customer {
  String? id;
  String? address;
  Shipping? shipping;
  int? balance;
  int? created;
  String? currency;
  String? defaultSource;
  String? description;
  String? discount;
  String? email;
  bool? livemode;
  String? name;
  String? phone;
  String? taxExempt;

  Customer(
      {this.id,
      this.address,
      this.shipping,
      this.balance,
      this.created,
      this.currency,
      this.defaultSource,
      this.description,
      this.discount,
      this.email,
      this.livemode,
      this.name,
      this.phone,
      this.taxExempt});

  Customer.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    shipping =
        json['shipping'] != null ? Shipping.fromMap(json['shipping']) : null;
    balance = json['balance'];
    created = json['created'];
    currency = json['currency'];
    defaultSource = json['default_source'];
    description = json['description'];
    discount = json['discount'];
    email = json['email'];
    livemode = json['livemode'];
    name = json['name'];
    phone = json['phone'];
    taxExempt = json['tax_exempt'];
  }

  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.shipping != null) {
      data.addAll(this.shipping!.toPostMap());
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['shipping'] = this.shipping;
    data['balance'] = this.balance;
    data['created'] = this.created;
    data['currency'] = this.currency;
    data['default_source'] = this.defaultSource;
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['email'] = this.email;
    data['livemode'] = this.livemode;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['tax_exempt'] = this.taxExempt;
    return data;
  }
}
