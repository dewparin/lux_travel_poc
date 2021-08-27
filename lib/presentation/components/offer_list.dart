import 'package:flutter/material.dart';
import 'package:lux_travel_poc/model/offer.dart';
import 'package:lux_travel_poc/model/offer_model.dart';
import 'package:lux_travel_poc/presentation/components/offer_item.dart';
import 'package:lux_travel_poc/presentation/constant.dart';
import 'package:provider/provider.dart';

class OfferList extends StatelessWidget {
  final bool onlyFavorites;

  const OfferList({Key? key, this.onlyFavorites = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OfferModel>(
      builder: (_, model, __) {
        final offers = onlyFavorites
            ? model.allOffers.where((offer) => offer.isFavorite).toList()
            : model.allOffers;
        if (offers.length > 0) {
          return _buildListView(offers);
        } else {
          return Center(child: _buildEmptyView(context));
        }
      },
    );
  }

  ListView _buildListView(List<Offer> offers) => ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.only(bottom: defaultPadding),
          child: OfferItem(
            offerUid: offers[index].uid,
            allowNavigateToDetailScreen: true,
          ),
        ),
      );

  Row _buildEmptyView(BuildContext context) {
    String message;
    IconData iconData;
    if (onlyFavorites) {
      message = "Let's going somewhere!";
      iconData = Icons.star_border_outlined;
    } else {
      message = "No place to go.";
      iconData = Icons.local_offer_outlined;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData),
        SizedBox(
          width: smallPadding,
        ),
        Text(message),
      ],
    );
  }
}
