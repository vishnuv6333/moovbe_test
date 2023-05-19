import 'package:flutter/material.dart';
import '../Widget/Login_screen.dart';
import '../Widget/bus_screen.dart';

import '../Widget/add_driver_screen.dart';
import '../Widget/driver_screen.dart';
import '../Widget/home_screen.dart';

var RouteManage = <String, WidgetBuilder>{
  '/login': (context) => LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/driver': (context) => const DriverList(),
  '/addDriver': (context) => AddDriver(),
  '/busSeat': ((context) => const BusDetails())
};
