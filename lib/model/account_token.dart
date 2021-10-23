import 'package:flutter/material.dart';

class AccountToken {
  String? accesstoken;
  bool? livemode;
  String? refreshToken;
  String? tokenType;
  String? stripePublishableKey;
  String? stripeUserId;
  String? scope;

  AccountToken({@required this.accesstoken,@required this.livemode,@required this.refreshToken,
  @required this.scope,@required this.stripePublishableKey,@required this.stripeUserId,@required this.tokenType});


   AccountToken.fromMap(Map json) {
    stripeUserId = json['stripe_user_id'];
    accesstoken = json['access_token'];
    stripePublishableKey = json["stripe_publishable_key"];
    tokenType = json["token_type"];
    livemode = json['livemode'];
    refreshToken = json["refresh_token"];
    scope = json["scope"];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stripe_user_id'] = this.stripeUserId;
    data['access_token'] = this.accesstoken;
    data['token_type'] = this.tokenType;
    data['stripe_publishable_key'] = this.stripePublishableKey;
    data['refresh_token'] = this.refreshToken;
    data['scope'] = this.scope;
    data['livemode'] = this.livemode;
    return data;
  }  
}
