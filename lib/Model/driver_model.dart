import 'dart:convert';

DriverList driverListFromJson(String str) =>
    DriverList.fromJson(json.decode(str));

String driverListToJson(DriverList data) => json.encode(data.toJson());

class DriverList {
  final bool? status;
  final List<DriverListElement> driverList;

  DriverList({
    required this.status,
    required this.driverList,
  });

  factory DriverList.fromJson(Map<String, dynamic> json) => DriverList(
        status: json["status"],
        driverList: List<DriverListElement>.from(
            json["driver_list"].map((x) => DriverListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "driver_list": List<dynamic>.from(driverList.map((x) => x.toJson())),
      };
}

class DriverListElement {
  final int? id;
  final String? name;
  final String? mobile;
  final String? licenseNo;

  DriverListElement({
    required this.id,
    required this.name,
    required this.mobile,
    required this.licenseNo,
  });

  factory DriverListElement.fromJson(Map<String, dynamic> json) =>
      DriverListElement(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        licenseNo: json["license_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "license_no": licenseNo,
      };
}
