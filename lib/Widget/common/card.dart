import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CardHome extends StatefulWidget {
  final String type;

  const CardHome({Key? key, required this.type}) : super(key: key);

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(clipBehavior: Clip.none, children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              if (widget.type == 'Driver') {
                Navigator.of(context).pushNamed('/driver');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: HexColor(widget.type == "Bus" ? '#FC153B' : '#2B2B2B'),
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.type == "Bus" ? "Bus" : "Driver",
                            style: const TextStyle(
                                fontFamily: "Axiforma",
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.type == "Bus"
                                ? "Manage your Bus"
                                : "Mange your Driver",
                            style: const TextStyle(
                                fontFamily: "Axiforma",
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        widget.type == "Bus"
                            ? "assets/img/bus.png"
                            : "assets/img/driver.png",
                        height: 100,
                        width: 100,
                      )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
