// To parse this JSON data, do
//
//     final seat = seatFromJson(jsonString);

import 'dart:convert';

List<List<Seat>> seatFromJson(String str) => List<List<Seat>>.from(json.decode(str).map((x) => List<Seat>.from(x.map((x) => Seat.fromJson(x)))));

String seatToJson(List<List<Seat>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class Seat {
    final int id;
    final int top;
    final int left;

    Seat({
        required this.id,
        required this.top,
        required this.left,
    });

    factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        id: json["id"],
        top: json["top"],
        left: json["left"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "top": top,
        "left": left,
    };
}
