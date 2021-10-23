class Refund {
  String? id;
  int? amount;
  String? balanceTransaction;
  String? charge;
  int? created;
  String? currency;
  String? paymentIntent;
  String? reason;
  String? receiptNumber;
  String? status;

  Refund(
      {this.amount,
      this.balanceTransaction,
      this.charge,
      this.created,
      this.currency,
      this.paymentIntent,
      this.reason,
      this.receiptNumber,      
      this.status,
      });

  Refund.fromMap(Map<String, dynamic> json) {
    id = json['id'];   
    amount = json['amount'];
    balanceTransaction = json['balance_transaction'];
    charge = json['charge'];
    created = json['created'];
    currency = json['currency'];
    paymentIntent = json['payment_intent'];
    reason = json['reason'];
    receiptNumber = json['receipt_number']; 
    status = json['status'];    
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['balance_transaction'] = this.balanceTransaction;
    data['charge'] = this.charge;
    data['created'] = this.created;
    data['currency'] = this.currency;
    data['payment_intent'] = this.paymentIntent;
    data['reason'] = this.reason;
    data['receipt_number'] = this.receiptNumber;
    data['status'] = this.status;    
    return data;
  }
   Map<String, dynamic> toPostMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.amount != null) {
      data['amount'] = this.amount.toString();
    }   
    if(this.charge != null) {
      data['charge'] = this.charge;
    }    
    if(this.paymentIntent != null) {
      data['payment_intent'] = this.paymentIntent;
    }      
    return data;
  }
}