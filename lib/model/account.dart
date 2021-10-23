class Account {
  String? id;
  BusinessProfile? businessProfile;
  String? businessType;
  Capabilities? capabilities;
  bool? chargesEnabled;
  String? country;
  int? created;
  String? defaultCurrency;
  bool? detailsSubmitted;
  String? email;
  bool? payoutsEnabled;
  String? type;

  Account(
      {this.id,
      this.businessProfile,
      this.businessType,
      this.capabilities,
      this.chargesEnabled,
      this.country,
      this.created,
      this.defaultCurrency,
      this.detailsSubmitted,
      this.email,
      this.payoutsEnabled,
      this.type});

  Account.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    businessProfile = json['business_profile'] != null
        ? new BusinessProfile.fromMap(json['business_profile'])
        : null;
    businessType = json['business_type'];
    capabilities = json['capabilities'] != null
        ? new Capabilities.fromJson(json['capabilities'])
        : null;
    chargesEnabled = json['charges_enabled'];
    country = json['country'];
    created = json['created'];
    defaultCurrency = json['default_currency'];
    detailsSubmitted = json['details_submitted'];
    email = json['email'];
    payoutsEnabled = json['payouts_enabled'];
    type = json['type'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.businessProfile != null) {
      data['business_profile'] = this.businessProfile!.toMap();
    }
    data['business_type'] = this.businessType;
    if (this.capabilities != null) {
      data['capabilities'] = this.capabilities!.toJson();
    }
    data['charges_enabled'] = this.chargesEnabled;
    data['country'] = this.country;
    data['created'] = this.created;
    data['default_currency'] = this.defaultCurrency;
    data['details_submitted'] = this.detailsSubmitted;
    data['email'] = this.email;
    data['payouts_enabled'] = this.payoutsEnabled;
    data['type'] = this.type;
    return data;
  }
}

class BusinessProfile {
  String? mcc;
  String? name;
  String? productDescription;
  String? supportEmail;
  String? supportPhone;
  String? supportUrl;
  String? url;

  BusinessProfile(
      {this.mcc,
      this.name,
      this.productDescription,
      this.supportEmail,
      this.supportPhone,
      this.supportUrl,
      this.url});

  BusinessProfile.fromMap(Map<String, dynamic> json) {
    mcc = json['mcc'];
    name = json['name'];
    productDescription = json['product_description'];
    supportEmail = json['support_email'];
    supportPhone = json['support_phone'];
    supportUrl = json['support_url'];
    url = json['url'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mcc'] = this.mcc;
    data['name'] = this.name;
    data['product_description'] = this.productDescription;
    data['support_email'] = this.supportEmail;
    data['support_phone'] = this.supportPhone;
    data['support_url'] = this.supportUrl;
    data['url'] = this.url;
    return data;
  }
}

class Capabilities {
  String? cardPayments;
  String? transfers;

  Capabilities({this.cardPayments, this.transfers});

  Capabilities.fromJson(Map<String, dynamic> json) {
    cardPayments = json['card_payments'];
    transfers = json['transfers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_payments'] = this.cardPayments;
    data['transfers'] = this.transfers;
    return data;
  }
}