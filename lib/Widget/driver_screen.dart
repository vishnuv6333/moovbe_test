import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../Provider/driver_list.dart';
import 'common/bus_driver_list.dart';

class DriverList extends StatelessWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final driverPro = Provider.of<DriverProvider>(context, listen: false);
    driverPro.getDriverList();
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (route) => false,
                    );
        return Future.value(true);
      },
      child: Scaffold(
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/addDriver');
          },
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HexColor('#FC153B'),
                borderRadius: const BorderRadius.all(Radius.circular(7))),
            child: const Center(
                child: Text(
              "Add Driver",
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              );
            },
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Driver List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<DriverProvider>(builder: (context, lriverProvider, child) {
          return lriverProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Text(
                          "${driverPro.driverLists.driverList.length} Busses Found",
                          style: const TextStyle(fontFamily:  "Axiforma"),
                          ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: CommonList(
                        type: "Driver",
                        Buslist: [],
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
