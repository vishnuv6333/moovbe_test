import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mooovbe/Widget/Login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(50),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Center(
                  child: Text(
                "Get Started",
                style: TextStyle(color: HexColor('#FC153B')),
              )),
            ),
          ),
        ),
        backgroundColor: HexColor('#FC153B'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Stack(
              children: [
                Positioned(
                  left: 160,
                  child: Image.asset("assets/img/Polygon.png"),
                  width: 27,
                  height: 20,
                ),
                Image.asset("assets/img/moovbe.png")
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class OnInkWell {}
