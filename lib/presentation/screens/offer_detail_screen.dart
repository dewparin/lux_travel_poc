import 'package:flutter/material.dart';
import 'package:lux_travel_poc/model/offer_model.dart';
import 'package:provider/provider.dart';

class OfferDetailScreenArguments {
  final int offerUid;

  OfferDetailScreenArguments(this.offerUid);
}

class OfferDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as OfferDetailScreenArguments;
    final offer = Provider.of<OfferModel>(context).getOfferByUid(args.offerUid);
    return Scaffold(
      appBar: AppBar(
        title: Text(offer.accommodationName),
      ),
      body: Center(
        child: Text('Offer Detail for offer: ${args.offerUid}'),
      ),
    );
  }
}
