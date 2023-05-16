import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mooovbe/Model/DriverModel.dart';

import '../../Model/BusModel.dart';

class CommonList extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final List Buslist;
  final String type;
  final DriverList? Driverlist;
  const CommonList({
    Key? key,
    required this.Buslist,
    required this.type,
    this.Driverlist,
  }) : super(key: key);

  @override
  State<CommonList> createState() => _CommonListState();
}

class _CommonListState extends State<CommonList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.type == 'Bus'
          ? widget.Buslist.length
          : widget.Driverlist!.driverList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 90,
          margin: const EdgeInsets.only(bottom: 9, top: 9),
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
          child: Center(
            child: ListTile(
              minLeadingWidth: 40,
              leading: Container(child: Image.asset("assets/img/bus2.png")),
              title: Text(widget.type == 'Bus'
                  ? widget.Buslist[index]['name']
                  : widget.Driverlist!.driverList[index].name),
              subtitle: Text(widget.type == 'Bus'
                  ? widget.Buslist[index]['model']
                  : widget.Driverlist!.driverList[index].licenseNo),
              trailing: Container(
                padding: const EdgeInsets.all(7),
                height: 36,
                width: 70,
                decoration: BoxDecoration(
                    color: HexColor('#FC153B'),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Center(
                  child: Text(
                    "Manage",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
