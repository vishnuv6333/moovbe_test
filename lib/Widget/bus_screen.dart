import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mooovbe/Constant/seat22.dart';

import '../Constant/arguments.dart';

class BusDetails extends StatefulWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  int top = 0;

  int left = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MyArguments? args =
        ModalRoute.of(context)?.settings.arguments as MyArguments?;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [],
          title: Text(args!.argument1)),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(7))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Rohit sharma",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Axiforma",
                          fontSize: 18),
                    ),
                    Text(
                      "Lic no:763sdf",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Axiforma",
                          fontSize: 12),
                    ),
                  ],
                ),
                Image.asset("assets/img/driver.png")
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(46),
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor("#DCDCDC"),
                    width: 1,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(
                      children: List.generate(
                          args.argument2 == "2*2" ? seat.length : seat3.length,
                          (inde) {
                    return Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: [
                          Stack(
                              children: List.generate(
                                  args.argument2 == "2*2"
                                      ? seat[inde].length
                                      : seat3[inde].length, (index) {
                            if (args.argument2 == "2*2") {
                              top = seat[inde][index]['top'];
                              left = seat[inde][index]['left'];
                            } else if (args.argument2 == "1*3") {
                              top = seat3[inde][index]['top'];
                              left = seat3[inde][index]['left'];
                            }

                            double myDouble = top.toDouble();
                            double myDoub = left.toDouble();
                            return Padding(
                              padding:
                                  EdgeInsets.only(left: myDoub, top: myDouble),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 6.9,
                                      top: -2,
                                      child: Image.asset(inde == 0
                                          ? "assets/img/Rectangleblack.png"
                                          : "assets/img/Rectangle.png")),
                                  Image.asset(inde == 0
                                      ? "assets/img/Unionblack.png"
                                      : "assets/img/Union.png"),
                                ],
                              ),
                            );
                          }))
                        ],
                      ),
                    );
                  })),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
