import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:lux_travel_poc/model/offer.dart';

final List<Offer> _mockOffers = [
  Offer(
    imageUri: 'assets/images/alexander-kaunas-unsplash.jpg',
    location: 'Khao Lak, Thailand',
    title: 'Khao Lak Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Khao Lak Villas',
    priceDetail: 'THB 4,290',
  ),
];

class OfferModel extends ChangeNotifier {
  bool _isFetching = false;

  bool get isFetching => _isFetching;

  final List<Offer> _offers = [];

  UnmodifiableListView<Offer> get allOffers => UnmodifiableListView(_offers);

  // mimic reload all offers flow
  void fetchAllOffers() {
    _offers.clear();
    _isFetching = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 3), () {
      _offers.addAll(_mockOffers);
      _isFetching = false;
      notifyListeners();
    });
  }
}
