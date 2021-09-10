import 'package:flutter/material.dart';
import 'package:lux_travel_poc/presentation/screens/home_screen.dart';
import 'package:lux_travel_poc/presentation/screens/offer_detail_screen.dart';

class LuxTravelApp extends StatelessWidget {
  const LuxTravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lux Travel POC',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.black,
        appBarTheme:
            AppBarTheme.of(context).copyWith(backgroundColor: Colors.black),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/detail': (_) => const OfferDetailScreen(),
      },
    );
  }
}
