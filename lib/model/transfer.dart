class Transfer {
  String? id;
  int? amount;
  int? amountReversed;
  String? balanceTransaction;
  int? created;
  String? currency;
  String? description;
  String? destination;
  String? destinationPayment;
  bool? livemode;
  bool? reversed;
  String? sourceTransaction;
  String? sourceType;
  String? transferGroup;

  Transfer(
      {this.id,
      this.amount,      
      this.currency,
      this.description,
      this.destination,
      this.transferGroup,
     });

  Transfer.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    amountReversed = json['amount_reversed'];
    balanceTransaction = json['balance_transaction'];
    created = json['created'];
    currency = json['currency'];
    description = json['description'];
    destination = json['destination'];
    destinationPayment = json['destination_payment'];
    livemode = json['livemode'];
    reversed = json['reversed'];
    sourceTransaction = json['source_transaction'];
    sourceType = json['source_type'];
    transferGroup = json['transfer_group'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>(); 
    data['id'] = this.id;
    data['amount'] = this.amount; 
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['destination'] = this.destination;
    data['transfer_group'] = this.transferGroup;
    return data;
  }
  Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();   
    data['amount'] = this.amount.toString(); 
    data['currency'] = this.currency;
    if(this.description != null) {
      data['description'] = this.description;
    }
    data['destination'] = this.destination;
    if(transferGroup != null) {
      data['transfer_group'] = this.transferGroup;
    }    
    return data;
  }
}