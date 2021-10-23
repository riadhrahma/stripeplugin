class Payout {
  String? id;
  int? amount;
  int? arrivalDate;
  bool? automatic;
  String? balanceTransaction;
  int? created;
  String? currency;
  String? description;
  String? destination;
  String? failureBalanceTransaction;
  String? failureCode;
  String? failureMessage;
  String? method;
  String? sourceType;
  String? statementDescriptor;
  String? status;
  String? type;

  Payout(
      {this.id,
      this.amount,
      this.arrivalDate,
      this.automatic,
      this.balanceTransaction,
      this.created,
      this.currency,
      this.description,
      this.destination,
      this.failureBalanceTransaction,
      this.failureCode,
      this.failureMessage,
      this.method,
      this.sourceType,
      this.statementDescriptor,
      this.status,
      this.type});

  Payout.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    arrivalDate = json['arrival_date'];
    automatic = json['automatic'];
    balanceTransaction = json['balance_transaction'];
    created = json['created'];
    currency = json['currency'];
    description = json['description'];
    destination = json['destination'];
    failureBalanceTransaction = json['failure_balance_transaction'];
    failureCode = json['failure_code'];
    failureMessage = json['failure_message'];
    method = json['method'];
    sourceType = json['source_type'];
    statementDescriptor = json['statement_descriptor'];
    status = json['status'];
    type = json['type'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['arrival_date'] = this.arrivalDate;
    data['automatic'] = this.automatic;
    data['balance_transaction'] = this.balanceTransaction;
    data['created'] = this.created;
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['destination'] = this.destination;
    data['failure_balance_transaction'] = this.failureBalanceTransaction;
    data['failure_code'] = this.failureCode;
    data['failure_message'] = this.failureMessage;
    data['method'] = this.method;
    data['source_type'] = this.sourceType;
    data['statement_descriptor'] = this.statementDescriptor;
    data['status'] = this.status;
    data['type'] = this.type;
    return data;
  }

  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.amount != null) {
      data['amount'] = this.amount.toString();
    }
    if (this.currency != null) {
      data['currency'] = this.currency;
    }
    if (this.destination != null) {
      data['destination'] = this.destination;
    }
    if (this.statementDescriptor != null) {
      data['statement_descriptor'] = this.statementDescriptor!.substring(0, 21);
    }
    return data;
  }
}
