

import 'card.dart';

class CardToken {
  String? id;
  String? object;
  Card? card;
  String? clientIp;
  int? created;
  bool? livemode;
  String? type;
  bool? used;

  CardToken(
      {this.card,
      this.clientIp,
      this.created,
      this.livemode,
      this.type,
      this.used});

  CardToken.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    card = json['card'] != null ? new Card.fromMap(json['card']) : null;
    clientIp = json['client_ip'];
    created = json['created'];
    livemode = json['livemode'];
    type = json['type'];
    used = json['used'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    if (this.card != null) {
      data['card'] = this.card!.toMap();
    }
    data['client_ip'] = this.clientIp;
    data['created'] = this.created;
    data['livemode'] = this.livemode;
    data['type'] = this.type;
    data['used'] = this.used;
    return data;
  }
  
}