import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:lux_travel_poc/model/offer.dart';

final List<Offer> _mockOffers = [
  Offer(
    imageUri: 'assets/images/alexander-kaunas-unsplash.jpg',
    location: 'Koh Phangan, Thailand',
    title: 'Koh Phangan Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Koh Phangan Villas',
    priceDetail: 'THB 7,290',
  ),
  Offer(
    imageUri: 'assets/images/edvin-johansson-unsplash.jpg',
    location: 'Tropical Paradise',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Paradise Island',
    priceDetail: 'THB 7,290',
  ),
  Offer(
    imageUri: 'assets/images/hello-lightbulb-unsplash.jpg',
    location: 'Oia, Greece',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Oia Villas',
    priceDetail: 'THB 7,290',
  ),
  Offer(
    imageUri: 'assets/images/manuel-moreno-unsplash.jpg',
    location: 'Encuentro Guadalupe, El Porvenir, Mexico',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Encuentro Guadalupe Villas',
    priceDetail: 'THB 7,290',
  ),
  Offer(
    imageUri: 'assets/images/paolo-nicolello-unsplash.jpg',
    location: 'oneeighty°, Indonesia',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'oneeighty°, Indonesia Villas',
    priceDetail: 'THB 7,290',
  ),
  Offer(
    imageUri: 'assets/images/patrick-robert-doyle-unsplash.jpg',
    location: 'Walensee, Switzerland',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Walensee, Switzerland Villas',
    priceDetail: 'THB 7,290',
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
