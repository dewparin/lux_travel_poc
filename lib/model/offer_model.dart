import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:lux_travel_poc/model/offer.dart';

final List<Offer> _mockOffers = [
  Offer(
    uid: 1,
    imageUri: 'assets/images/alexander-kaunas-unsplash.jpg',
    location: 'Koh Phangan, Thailand',
    title: 'Koh Phangan Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Koh Phangan Villas',
    priceDetail: 'THB 7,290',
    isFavorite: false,
  ),
  Offer(
    uid: 2,
    imageUri: 'assets/images/edvin-johansson-unsplash.jpg',
    location: 'Tropical Paradise',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Paradise Island',
    priceDetail: 'THB 7,290',
    isFavorite: false,
  ),
  Offer(
    uid: 3,
    imageUri: 'assets/images/hello-lightbulb-unsplash.jpg',
    location: 'Oia, Greece',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Oia Villas',
    priceDetail: 'THB 7,290',
    isFavorite: false,
  ),
  Offer(
    uid: 4,
    imageUri: 'assets/images/manuel-moreno-unsplash.jpg',
    location: 'Encuentro Guadalupe, El Porvenir, Mexico',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Encuentro Guadalupe Villas',
    priceDetail: 'THB 7,290',
    isFavorite: false,
  ),
  Offer(
    uid: 5,
    imageUri: 'assets/images/paolo-nicolello-unsplash.jpg',
    location: 'oneeighty°, Indonesia',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'oneeighty°, Indonesia Villas',
    priceDetail: 'THB 7,290',
    isFavorite: false,
  ),
  Offer(
    uid: 6,
    imageUri: 'assets/images/patrick-robert-doyle-unsplash.jpg',
    location: 'Walensee, Switzerland',
    title: 'Five-Star with Daily Dining & Nightly Cocktails',
    accommodationName: 'Walensee, Switzerland Villas',
    priceDetail: 'THB 7,290',
    isFavorite: false,
  ),
];

class OfferModel extends ChangeNotifier {
  final List<Offer> _offers = _mockOffers;

  UnmodifiableListView<Offer> get allOffers => UnmodifiableListView(_offers);

  void toggleFavorite(int uid) {
    final index = _offers.indexWhere((elem) => elem.uid == uid);
    if (index == -1) {
      return;
    }
    _offers[index] = _offers[index].copyWithInverseFavorite();
    notifyListeners();
  }
}
