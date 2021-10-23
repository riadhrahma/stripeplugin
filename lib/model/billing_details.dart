class BillingDetails {
  String? name;
  String? email;
  BillingAddress? address;

  BillingDetails({this.name, this.email, this.address});

  BillingDetails.fromMap(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'] != null
        ? new BillingAddress.fromMap(json['address'])
        : null;
  }

  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.name != null) {
      data['billing_details[name]'] = this.name;
    }
    if (this.email != null) {
      data['billing_details[email]'] = this.email;
    }
    if (this.address != null) {
      data.addAll(this.address!.toPostMap());
    }

    return data;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address!.toMap();
    }
    return data;
  }
}

class BillingAddress {
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? postalCode;
  String? state;
  String? countryCode;

  BillingAddress(
      {this.addressLine1,
      this.addressLine2,
      this.city,
      this.postalCode,
      this.state,
      this.countryCode});

  BillingAddress.fromMap(Map<String, dynamic> json) {
    addressLine1 = json['line1'];
    addressLine2 = json['line2'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    countryCode = json['country'];
  }

  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.addressLine1 != null) {
      data['billing_details[address][line1]'] = this.addressLine1;
    }
    if (this.addressLine2 != null) {
      data['billing_details[address][line2]'] = this.addressLine2;
    }
    if (this.city != null) {
      data['billing_details[address][city]'] = this.city;
    }
    if (this.state != null) {
      data['billing_details[address][state]'] = this.state;
    }
    if (this.postalCode != null) {
      data['billing_details[address][postal_code]'] = this.postalCode;
    }
    if (this.countryCode != null) {
      data['billing_details[address][country]'] = this.countryCode;
    }

    return data;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['line1'] = this.addressLine1;
    data['line2'] = this.addressLine2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postal_code'] = this.postalCode;
    data['country'] = this.countryCode;
    return data;
  }
}
