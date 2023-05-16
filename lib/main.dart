import 'package:flutter/material.dart';
import 'package:mooovbe/Router/route_mange.dart';
import 'package:provider/provider.dart';

import 'Provider/driver_list.dart';
import 'Widget/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DriverProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: RouteManage,
      ),
    );
  }
}
