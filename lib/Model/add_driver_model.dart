import 'dart:convert';

AddDriver addDriverFromJson(String str) => AddDriver.fromJson(json.decode(str));

String addDriverToJson(AddDriver data) => json.encode(data.toJson());

class AddDriver {
  final bool? status;
  final String? message;

  AddDriver({
    required this.status,
    required this.message,
  });

  factory AddDriver.fromJson(Map<String, dynamic> json) => AddDriver(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
