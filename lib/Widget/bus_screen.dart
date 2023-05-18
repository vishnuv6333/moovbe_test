import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BusDetails extends StatelessWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [],
          title: const Text("ksrtc")),
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
              width: MediaQuery.of(context).size.width-20,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor("#DCDCDC"),
                    width: 1,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              child: Column(
                children: const [
                ]
                ),
            ),
          )
        ],
      ),
    );
  }
}
