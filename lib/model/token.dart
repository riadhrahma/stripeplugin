/// A Token is the container for the Stripe connect express access token.
///
/// Recommended to store the access token in LocalStorage, so users don't need to log in every time
class Token {
  String? accessToken;
  String? tokenType;

  Token.fromMap(Map json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  
}
