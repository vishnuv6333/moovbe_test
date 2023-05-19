import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mooovbe/Constant/seat22.dart';

class BusDetails extends StatefulWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  List seq = [];
  @override
  void initState() {
    var au = seat[0][0]['id'];
    double myDouble = au.toDouble();
    print(myDouble.runtimeType);
    int count = 36; // Number of elements in the sequence
    List<int> sequence = [];

    for (int i = 2; i <= count; i += 4) {
      sequence.add(i);
    }
    print(sequence);
    seq = sequence;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [],
          title: const Text("ksrtc")),
      body: Container(
        child: Column(
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
                        children: List.generate(seat.length, (inde) {
                      return Padding(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          children: [
                            Stack(
                                children: List.generate(seat[inde].length, (index) {
                              var tk = seat[inde][index]['top'];
                              var le = seat[inde][index]['left'];
                              double myDouble = tk.toDouble();
                              double myDoub = le.toDouble();
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: myDoub, top: myDouble),
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          left: 6.9,
                                          child: Image.asset(
                                              "assets/img/Rectangle.png")),
                                      Image.asset("assets/img/Union.png"),
                                    ],
                                  ),
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
      ),
    );
  }
}
