class Card {
  String? id;
  String? brand;
  String? country;
  String? number;
  int? expMonth;
  int? expYear;
  String? cvc;
  String? fingerprint;
  String? funding;
  String? installments;
  String? last4;
  String? network;
  ThreeDSecure? threeDSecure;
  String? wallet;

  Card(
      {this.brand,
      this.country,
      this.number,
      this.expMonth,
      this.expYear,
      this.cvc,
      this.fingerprint,
      this.funding,
      this.installments,
      this.last4,
      this.network,
      this.threeDSecure,
      this.wallet});

  Card.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    country = json['country'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    fingerprint = json['fingerprint'];
    funding = json['funding'];
    installments = json['installments'];
    last4 = json['last4'];
    network = json['network'];  
    threeDSecure = json['three_d_secure'] != null ? new ThreeDSecure.fromMap(json['three_d_secure']) : null;
    wallet = json['wallet'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['country'] = this.country;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['fingerprint'] = this.fingerprint;
    data['funding'] = this.funding;
    data['installments'] = this.installments;
    data['last4'] = this.last4;
    data['network'] = this.network;
    if(this.threeDSecure != null) {
      data['three_d_secure'] = this.threeDSecure!.toMap();
    }   
    data['wallet'] = this.wallet;
    return data;
  }

  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card[number]'] = this.number.toString();
    data['card[exp_month]'] = this.expMonth.toString();
    data['card[exp_year]'] = this.expYear.toString();
    data['card[cvc]'] = this.cvc.toString();
    return data;
  }
}

class ThreeDSecure {
	bool? authenticated;
	bool? succeeded;
	String? version;

	ThreeDSecure({this.authenticated, this.succeeded, this.version});

	ThreeDSecure.fromMap(Map<String, dynamic> json) {
		authenticated = json['authenticated'];
		succeeded = json['succeeded'];
		version = json['version'];
	}

	Map<String, dynamic> toMap() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['authenticated'] = this.authenticated;
		data['succeeded'] = this.succeeded;
		data['version'] = this.version;
		return data;
	}
}