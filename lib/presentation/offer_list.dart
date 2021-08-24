import 'package:flutter/material.dart';
import 'package:lux_travel_poc/model/offer_model.dart';
import 'package:provider/provider.dart';

class OfferList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<OfferList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<OfferModel>(context, listen: false).fetchAllOffers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OfferModel>(
      builder: (_, model, __) {
        if (model.isFetching) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return _buildOfferList(model);
        }
      },
    );
  }

  Widget _buildOfferList(OfferModel model) {
    final offers = model.allOffers;
    return ListView.builder(
      itemCount: offers.length,
      itemBuilder: (context, index) {
        final offer = offers[index];
        return ListTile(
          title: Text(offer.accommodationName),
        );
      },
    );
  }
}
