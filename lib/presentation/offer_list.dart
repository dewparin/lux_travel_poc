import 'package:flutter/material.dart';
import 'package:lux_travel_poc/model/offer_model.dart';
import 'package:lux_travel_poc/presentation/components/offer_item.dart';
import 'package:provider/provider.dart';

class OfferList extends StatefulWidget {
  final bool onlyFavorites;

  const OfferList({Key? key, this.onlyFavorites = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<OfferList> {
  void _toggleFavorite(int offerUid) {
    Provider.of<OfferModel>(context, listen: false).toggleFavorite(offerUid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OfferModel>(
      builder: (_, model, __) {
        return _buildOfferList(model);
      },
    );
  }

  Widget _buildOfferList(OfferModel model) {
    final offers = widget.onlyFavorites
        ? model.allOffers.where((offer) => offer.isFavorite).toList()
        : model.allOffers;
    return ListView.builder(
      itemCount: offers.length,
      itemBuilder: (context, index) => OfferItem(
        offer: offers[index],
        onTappedFavorite: _toggleFavorite,
      ),
    );
  }
}
