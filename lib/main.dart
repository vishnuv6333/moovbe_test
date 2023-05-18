import 'package:flutter/material.dart';
import 'package:mooovbe/Router/route_mange.dart';
import 'package:mooovbe/Widget/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/Auth.dart';
import 'Provider/driver_list.dart';
import 'Widget/Login_screen.dart';
import 'Widget/splash_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DriverProvider>(
          create: (_) => DriverProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: ggdh(context: context),
        home: const SplashScreen(),
        routes: RouteManage,
      ),
    );
  }
}
