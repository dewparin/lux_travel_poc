import 'package:flutter/material.dart';
import 'package:lux_travel_poc/model/offer.dart';
import 'package:lux_travel_poc/model/offer_model.dart';
import 'package:lux_travel_poc/presentation/constant.dart';
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
      itemBuilder: (context, index) => _buildOfferItem(offers[index]),
    );
  }

  Widget _buildOfferItem(Offer offer) {
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
            padding: EdgeInsets.all(defaultPadding),
            child: _buildItemDetail(context, offer),
          ),
        ],
      ),
    );
  }

  Column _buildItemDetail(BuildContext context, Offer offer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemListTile(offer),
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
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: mediumPadding,
          ),
          Text(
            offer.priceDetail,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      );

  ListTile _buildItemListTile(Offer offer) => ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Icon(Icons.location_pin),
        // title: Text(offer.location),
        title: Align(
          child: new Text(offer.location),
          alignment: Alignment(-1.3, 0),
        ),
        trailing: Icon(Icons.favorite_outline),
      );
}
