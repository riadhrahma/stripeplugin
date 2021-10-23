class StripeError {
  Error? error;

  StripeError({this.error});

  StripeError.fromMap(Map<String, dynamic> json) {
    error = json['error'] != null ? new Error.fromMap(json['error']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error!.toMap();
    }
    return data;
  }
}

class Error {
  String? code;
  String? docUrl;
  String? message;
  String? param;
  String? type;

  Error({this.code, this.docUrl, this.message, this.param, this.type});

  Error.fromMap(Map<String, dynamic> json) {
    code = json['code'];
    docUrl = json['doc_url'];
    message = json['message'];
    param = json['param'];
    type = json['type'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['doc_url'] = this.docUrl;
    data['message'] = this.message;
    data['param'] = this.param;
    data['type'] = this.type;
    return data;
  }
}