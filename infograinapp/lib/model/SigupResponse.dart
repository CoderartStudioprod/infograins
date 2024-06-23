import 'dart:convert';

class SignUpresponse {
  int? status;
  bool success;
  String? message;
  Result? result;

  SignUpresponse({
    this.status,
    required this.success,
    this.message,
    this.result,
  });

  factory SignUpresponse.fromJson(String str) =>
      SignUpresponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpresponse.fromMap(Map<String, dynamic> json) => SignUpresponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "message": message,
        "result": result?.toMap(),
      };
}

class Result {
  int? id;
  String? firstName;
  String? lastName;
  String? countryCode;
  String? phoneNumber;
  String? email;
  dynamic status;
  String? profilePic;
  String? deviceToken;
  String? deviceType;
  String? country;
  String? currency;
  String? accessToken;
  String? tokenType;
  String? bankAcount;
  List<dynamic>? loginActivity;
  String? kyc;
  String? wallet;

  Result({
    this.id,
    this.firstName,
    this.lastName,
    this.countryCode,
    this.phoneNumber,
    this.email,
    this.status,
    this.profilePic,
    this.deviceToken,
    this.deviceType,
    this.country,
    this.currency,
    this.accessToken,
    this.tokenType,
    this.bankAcount,
    this.loginActivity,
    this.kyc,
    this.wallet,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        countryCode: json["countryCode"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        status: json["status"],
        profilePic: json["profilePic"],
        deviceToken: json["deviceToken"],
        deviceType: json["deviceType"],
        country: json["country"],
        currency: json["currency"],
        accessToken: json["accessToken"],
        tokenType: json["tokenType"],
        bankAcount: json["bankAcount"],
        loginActivity: json["loginActivity"] == null
            ? []
            : List<dynamic>.from(json["loginActivity"]!.map((x) => x)),
        kyc: json["kyc"],
        wallet: json["wallet"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
        "email": email,
        "status": status,
        "profilePic": profilePic,
        "deviceToken": deviceToken,
        "deviceType": deviceType,
        "country": country,
        "currency": currency,
        "accessToken": accessToken,
        "tokenType": tokenType,
        "bankAcount": bankAcount,
        "loginActivity": loginActivity == null
            ? []
            : List<dynamic>.from(loginActivity!.map((x) => x)),
        "kyc": kyc,
        "wallet": wallet,
      };
}
