import 'package:flutter/material.dart';
import 'package:lux_travel_poc/screen/home/home_screen.dart';

class LuxTravelApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lux Travel POC',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.black,
        accentColor: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }

}
