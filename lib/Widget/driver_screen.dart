import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constant/dummy.dart';
import '../Provider/driver_list.dart';
import 'common/bus_driver_list.dart';

class DriverList extends StatelessWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final driverList = Provider.of<DriverProvider>(context, listen: false);
    driverList.getDriverList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Driver List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20),
              child:
                  ElevatedButton(onPressed: () {}, child: Text("Add Driver"))),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Text(
                "${driverList.DriverLists.driverList.length} Busses Found"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CommonList(
                Driverlist: driverList.DriverLists,
                Buslist: const [],
                type: "Driver"),
          ),
        ],
      ),
    );
  }
}
