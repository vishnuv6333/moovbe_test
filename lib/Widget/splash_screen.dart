import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mooovbe/Widget/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
              chekLogin();
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

  Future<void> chekLogin() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    if (sharedPrefs.getString('user_token') != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.of(context).pushNamed('/login');
    }
  }
}
