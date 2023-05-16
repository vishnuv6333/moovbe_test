import 'package:flutter/material.dart';
import '../Widget/Login_screen.dart';
import '../Widget/driver_screen.dart';
import '../Widget/driver_screen.dart';
import '../Widget/home_screen.dart';

// ignore: non_constant_identifier_names
var RouteManage = <String, WidgetBuilder>{
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/driver': (context) => const DriverList(),
};
