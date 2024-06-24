import 'dart:convert';

class VerifyOtPres {
  int? status;
  bool success;
  String? message;
  Result? result;

  VerifyOtPres({
    this.status,
    required this.success,
    this.message,
    this.result,
  });

  factory VerifyOtPres.fromJson(String str) =>
      VerifyOtPres.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerifyOtPres.fromMap(Map<String, dynamic> json) => VerifyOtPres(
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
  List<LoginActivity>? loginActivity;
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
            : List<LoginActivity>.from(
                json["loginActivity"]!.map((x) => LoginActivity.fromMap(x))),
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
            : List<dynamic>.from(loginActivity!.map((x) => x.toMap())),
        "kyc": kyc,
        "wallet": wallet?.toMap(),
      };
}

class LoginActivity {
  int? id;
  int? userId;
  String? clientId;
  String? name;
  String? deviceName;
  String? scopes;
  String? ipAdderss;
  String? deviceType;
  String? deviceToken;
  String? latitude;
  String? longitude;
  int? revoked;
  String? accessId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic expiresAt;

  LoginActivity({
    this.id,
    this.userId,
    this.clientId,
    this.name,
    this.deviceName,
    this.scopes,
    this.ipAdderss,
    this.deviceType,
    this.deviceToken,
    this.latitude,
    this.longitude,
    this.revoked,
    this.accessId,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
  });

  factory LoginActivity.fromJson(String str) =>
      LoginActivity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginActivity.fromMap(Map<String, dynamic> json) => LoginActivity(
        id: json["id"],
        userId: json["user_id"],
        clientId: json["client_id"],
        name: json["name"],
        deviceName: json["deviceName"],
        scopes: json["scopes"],
        ipAdderss: json["IpAdderss"],
        deviceType: json["deviceType"],
        deviceToken: json["deviceToken"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        revoked: json["revoked"],
        accessId: json["access_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        expiresAt: json["expires_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "client_id": clientId,
        "name": name,
        "deviceName": deviceName,
        "scopes": scopes,
        "IpAdderss": ipAdderss,
        "deviceType": deviceType,
        "deviceToken": deviceToken,
        "latitude": latitude,
        "longitude": longitude,
        "revoked": revoked,
        "access_id": accessId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "expires_at": expiresAt,
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
