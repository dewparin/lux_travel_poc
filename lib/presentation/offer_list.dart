import 'package:flutter/material.dart';
import 'package:lux_travel_poc/model/offer_model.dart';
import 'package:lux_travel_poc/presentation/components/offer_item.dart';
import 'package:provider/provider.dart';

class OfferList extends StatelessWidget {
  final bool onlyFavorites;

  const OfferList({Key? key, this.onlyFavorites = false}) : super(key: key);

  void _toggleFavorite(BuildContext context, int offerUid) {
    Provider.of<OfferModel>(context, listen: false).toggleFavorite(offerUid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OfferModel>(
      builder: (_, model, __) {
        final offers = onlyFavorites
            ? model.allOffers.where((offer) => offer.isFavorite).toList()
            : model.allOffers;
        return ListView.builder(
          itemCount: offers.length,
          itemBuilder: (context, index) => OfferItem(
            offer: offers[index],
            onTappedFavorite: (offerUid) {
              _toggleFavorite(context, offerUid);
            },
          ),
        );
      },
    );
  }
}
