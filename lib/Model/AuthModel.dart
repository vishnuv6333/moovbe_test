// To parse this JSON data, do
//
//     final authentication = authenticationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Authentication authenticationFromJson(String str) =>
    Authentication.fromJson(json.decode(str));

String authenticationToJson(Authentication data) => json.encode(data.toJson());

class Authentication {
  final bool? status;
  final String? name;
  final String? refresh;
  final String? access;
  final String message;
  final String? urlId;

  Authentication({
    required this.status,
    required this.name,
    required this.refresh,
    required this.access,
    required this.message,
    required this.urlId,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        status: json["status"],
        name: json["name"],
        refresh: json["refresh"],
        access: json["access"],
        message: json["message"],
        urlId: json["url_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "name": name,
        "refresh": refresh,
        "access": access,
        "message": message,
        "url_id": urlId,
      };
}
