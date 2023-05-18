import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../Provider/driver_list.dart';
import 'common/form.dart';

class AddDriver extends StatelessWidget {
  AddDriver({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final driverPro = Provider.of<DriverProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: (){
        Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/driver',
                      (route) => false,
                    );
        return Future.value(true);
      },
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () async {
              if (_formKey.currentState!.validate() == true) {
                await driverPro.addDriver();
                if (driverPro.addisloading == true) {}
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: HexColor('#FC153B'),
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              child: const Center(
                  child: Text(
                "Save",
                style: TextStyle(color: Colors.white, fontFamily: " Axiforma"),
              )),
            ),
          ),
        ),
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/driver',
                      (route) => false,
                    );
              },
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: const Text(
              "Add Driver",
              style: TextStyle(color: Colors.white),
            )),
        body: Column(
          children: [
            FormWidget(
              type: 'addDriver',
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
