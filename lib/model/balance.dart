class Balance {
  List<Payment>? available;
  List<ConnectReserved>? connectReserved;
  bool? livemode;
  List<Payment>? pending;

  Balance({this.available, this.connectReserved, this.livemode, this.pending});

  Balance.fromMap(Map<String, dynamic> json) {
    if (json['available'] != null) {
      available = [];
      json['available'].forEach((v) {
        available!.add(new Payment.fromJson(v));
      });
    }
    if (json['connect_reserved'] != null) {
      connectReserved = [];
      json['connect_reserved'].forEach((v) {
        connectReserved!.add(new ConnectReserved.fromJson(v));
      });
    }
    livemode = json['livemode'];
    if (json['pending'] != null) {
      pending = [];
      json['pending'].forEach((v) {
        pending!.add(new Payment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.available != null) {
      data['available'] = this.available!.map((v) => v.toJson()).toList();
    }
    if (this.connectReserved != null) {
      data['connect_reserved'] = this.connectReserved!.map((v) => v.toJson()).toList();
    }
    data['livemode'] = this.livemode;
    if (this.pending != null) {
      data['pending'] = this.pending!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payment {
  int? amount;
  String? currency;
  SourceTypes? sourceTypes;

  Payment({this.amount, this.currency, this.sourceTypes});

  Payment.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
    sourceTypes =
        json['source_types'] != null ? new SourceTypes.fromJson(json['source_types']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    if (this.sourceTypes != null) {
      data['source_types'] = this.sourceTypes!.toJson();
    }
    return data;
  }
}

class SourceTypes {
  int? bankAccount;
  int? card;

  SourceTypes({this.bankAccount, this.card});

  SourceTypes.fromJson(Map<String, dynamic> json) {
    bankAccount = json['bank_account'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_account'] = this.bankAccount;
    data['card'] = this.card;
    return data;
  }
}

class ConnectReserved {
  int? amount;
  String? currency;

  ConnectReserved({this.amount, this.currency});

  ConnectReserved.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}
