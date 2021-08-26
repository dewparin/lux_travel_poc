import 'package:flutter/material.dart';
import 'package:lux_travel_poc/presentation/screens/home_screen.dart';
import 'package:lux_travel_poc/presentation/screens/offer_detail_screen.dart';

class LuxTravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lux Travel POC',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomeScreen(),
        '/detail': (_) => OfferDetailScreen(),
      },
    );
  }
}
