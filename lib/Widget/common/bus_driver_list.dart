import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mooovbe/Model/driver_model.dart';
import 'package:provider/provider.dart';

import '../../Provider/driver_list.dart';

class CommonList extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final List Buslist;
  final String type;
  const CommonList({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.Buslist,
    required this.type,
  }) : super(key: key);

  @override
  State<CommonList> createState() => _CommonListState();
}

class _CommonListState extends State<CommonList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DriverProvider>(builder: (context, itemProvider, _) {
      return ListView.builder(
        shrinkWrap: true,
        physics: widget.type == 'Bus'
            ? const NeverScrollableScrollPhysics()
            : const ScrollPhysics(),
        itemCount: widget.type == 'Bus'
            ? widget.Buslist.length
            : itemProvider.driverLists.driverList.length,
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
                title: Text(
                  widget.type == 'Bus'
                      ? widget.Buslist[index]['name']
                      : itemProvider.driverLists.driverList[index].name ?? '',
                  style: const TextStyle(fontFamily: "Axiforma"),
                ),
                subtitle: Text(
                  widget.type == 'Bus'
                      ? widget.Buslist[index]['model']
                      : 'Lic no:${itemProvider.driverLists.driverList[index].licenseNo}',
                  style: const TextStyle(fontFamily: "Axiforma"),
                ),
                trailing: InkWell(
                  onTap: () {
                    if (widget.type != 'Bus') {
                      itemProvider.deleteDriver(
                          index, itemProvider.driverLists.driverList[index].id);
                    }else{
                      Navigator.of(context).pushNamed('/busSeat');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 36,
                    width: 70,
                    decoration: BoxDecoration(
                        color: HexColor('#FC153B'),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Center(
                      child: Text(
                        widget.type == 'Bus' ? "Manage" : "Delete",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
