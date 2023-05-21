import 'package:flutter/material.dart';
import 'package:mooovbe/Router/route_mange.dart';
import 'package:provider/provider.dart';
import 'Provider/auth_user.dart';
import 'Provider/driver_list.dart';
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
        home: const SplashScreen(),
        routes: RouteManage,
      ),
    );
  }
}
