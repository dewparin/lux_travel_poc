import 'package:flutter/material.dart';
import 'package:lux_travel_poc/model/offer.dart';
import 'package:lux_travel_poc/presentation/constant.dart';

class OfferItem extends StatelessWidget {
  final Offer offer;

  const OfferItem({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: defaultPadding),
      child: Column(
        children: [
          SizedBox(
              height: 250,
              width: double.infinity,
              child: Image(
                image: AssetImage(offer.imageUri),
                fit: BoxFit.cover,
              )),
          Container(
            padding: EdgeInsets.fromLTRB(
              defaultPadding,
              smallPadding,
              defaultPadding,
              defaultPadding,
            ),
            child: _buildItemDetail(context, offer),
          ),
        ],
      ),
    );
  }

  Column _buildItemDetail(BuildContext context, Offer offer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemListTile(context, offer),
          Text(
            offer.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: smallPadding,
          ),
          Text(
            offer.accommodationName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(
            height: mediumPadding,
          ),
          Text(
            offer.priceDetail,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      );

  ListTile _buildItemListTile(BuildContext context, Offer offer) => ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Icon(Icons.location_pin),
        // title: Text(offer.location),
        title: Align(
          child: new Text(
            offer.location,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          alignment: Alignment(-1.3, 0),
        ),
        trailing: Icon(Icons.favorite_outline),
      );
}
