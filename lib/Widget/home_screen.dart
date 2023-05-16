import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Stack(children: [
            Positioned(
              right: 17,
              top: -10,
              child: Image.asset(
                'assets/img/Polygon.png',
                height: 30,
                width: 20,
              ),
            ),
            Image.asset(
              'assets/img/moovbe.png',
              height: 30,
              width: 150,
            ),
          ]),
          backgroundColor: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Card(type: "Bus"),
                Card(
                  type: "Driver",
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("21 Busses Found"),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(9),
                  decoration: const BoxDecoration(
                    color: Color(0xFFffffff),
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 11.0,
                        spreadRadius: 2.0,
                        offset: Offset(
                          2.0, // Move to right 5  horizontally
                          2.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: ListTile(
                    leading: Image.asset("assets/img/bus2.png"),
                    title: const Text('KSRTC'),
                    subtitle: const Text('Item description'),
                    trailing: Container(
                      padding: const EdgeInsets.all(7),
                      height: 36,
                      width: 70,
                      decoration: BoxDecoration(
                          color: HexColor('#FC153B'),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3))),
                      child: const Center(
                        child: Text(
                          "Manage",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  final String type;

  const Card({Key? key, required this.type}) : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(clipBehavior: Clip.none, children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              if (widget.type == 'Bus') {
                Navigator.of(context).pushNamed('/driver');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: HexColor(widget.type == "Bus" ? '#FC153B' : '#2B2B2B'),
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.type == "Bus" ? "Bus" : "Driver",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.type == "Bus"
                                ? "Manage your Bus"
                                : "Mange your Driver",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
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
