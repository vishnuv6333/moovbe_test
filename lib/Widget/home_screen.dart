import 'package:flutter/material.dart';
import '../Constant/dummy.dart';
import 'common/bus_driver_list.dart';
import 'common/card.dart';

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
                CardHome(type: "Bus"),
                CardHome(
                  type: "Driver",
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("${dummy.length} Busses Found"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CommonList(
                Buslist: dummy,
                type: "Bus",
              ),
            )
          ],
        ),
      ),
    );
  }
}
