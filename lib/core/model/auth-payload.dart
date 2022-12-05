import 'dart:convert';

AuthPayload authPayloadFromJson(String str) =>
    AuthPayload.fromJson(json.decode(str));

String authPayloadToJson(AuthPayload data) => json.encode(data.toJson());

class AuthPayload {
  AuthPayload({
    this.token,
    this.accountType,
  });

  String? token;
  String? accountType;

  factory AuthPayload.fromJson(Map<String, dynamic> json) => AuthPayload(
        token: json["token"],
        accountType: json["accountType"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "accountType": accountType,
      };
}
