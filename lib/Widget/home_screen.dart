import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          automaticallyImplyLeading: false,
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
          actions: [
            Material(
              color: const Color.fromARGB(0, 196, 185, 185),
              child: InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.logout_outlined,
                  ),
                ),
                onTap: () {
                  _showAlertDialog(context);
                },
              ),
            ),
          ],
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
              child: Text(
                "${dummy.length} Busses Found",
                style: const TextStyle(fontFamily: 'Axiforma'),
              ),
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

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: const Text('Cancel booking'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to Log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('user_token');
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
