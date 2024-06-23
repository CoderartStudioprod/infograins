import 'dart:convert';

class LoginResponse {
  int? status;
  bool success;
  String? message;
  Result? result;

  LoginResponse({
    this.status,
    required this.success,
    this.message,
    this.result,
  });

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
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
  int? status;
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
  Wallet? wallet;

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
        wallet: json["wallet"] == null ? null : Wallet.fromMap(json["wallet"]),
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
        "wallet": wallet?.toMap(),
      };
}

class Wallet {
  int? id;
  int? userId;
  String? xpub;
  String? mnemonic;
  String? address;
  String? privateSkey;
  int? faitWalletAmount;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Wallet({
    this.id,
    this.userId,
    this.xpub,
    this.mnemonic,
    this.address,
    this.privateSkey,
    this.faitWalletAmount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Wallet.fromJson(String str) => Wallet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        userId: json["user_id"],
        xpub: json["xpub"],
        mnemonic: json["mnemonic"],
        address: json["address"],
        privateSkey: json["private_skey"],
        faitWalletAmount: json["fait_wallet_amount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "xpub": xpub,
        "mnemonic": mnemonic,
        "address": address,
        "private_skey": privateSkey,
        "fait_wallet_amount": faitWalletAmount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
