class Shipping {
  String? name;
  ShippingAddress? address;

  Shipping({this.name, this.address});

  Shipping.fromMap(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'] != null ? new ShippingAddress.fromMap(json['address']) : null;
  }

   Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipping[name]'] = this.name;
    
    if(this.address !=null) {
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

class ShippingAddress {

  String? addressLine1;
  String? addressLine2;
  String? city;
  String? postalCode;
  String? state;
  String? countryCode;

  ShippingAddress(
      {
      this.addressLine1,
      this.addressLine2,
      this.city,     
      this.postalCode,
      this.state,
      this.countryCode});

  ShippingAddress.fromMap(Map<String, dynamic> json) {
   
    addressLine1 = json['line1'];
    addressLine2 = json['line2'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    countryCode = json['country'];
  }

  Map<String, dynamic> toPostMap() {

    final Map<String, dynamic> data = new Map<String, dynamic>();

    if(addressLine1 != null) {
      data['shipping[address][line1]'] = this.addressLine1;
    }
     if(addressLine2 != null) {
      data['shipping[address][line2]'] = this.addressLine2;
    }    
    if(city != null) {
        data['shipping[address][city]'] = this.city;
    }
     if(state != null) {
      data['shipping[address][state]'] = this.state; 
    }
    if(postalCode != null) {
      data['shipping[address][postal_code]'] = this.postalCode;  
    }

    if(countryCode != null) {
      data['shipping[address][country]'] = this.countryCode;  
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



