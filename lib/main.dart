import 'package:flutter/material.dart';
import 'package:lux_travel_poc/lux_travel_app.dart';
import 'package:lux_travel_poc/model/offer_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OfferModel())
      ],
      child: const LuxTravelApp(),
    ),
  );
}
