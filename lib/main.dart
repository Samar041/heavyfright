import 'package:flutter/material.dart';
import 'package:heavyfreight_flutter_test/screens/login_screen.dart';
import 'package:heavyfreight_flutter_test/screens/package_screen.dart';
import 'package:heavyfreight_flutter_test/screens/Driver_screen.dart';


void main() {
  runApp(HeavyFreightApp());
}

class HeavyFreightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeavyFreight',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/form': (context) => PackageFormScreen(),
        '/tracking': (context) => DeliveryInfoScreen(),
      },
      
    );
  }
}
