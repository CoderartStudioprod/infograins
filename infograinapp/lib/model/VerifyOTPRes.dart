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
  Result();

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result();

  Map<String, dynamic> toMap() => {};
}
