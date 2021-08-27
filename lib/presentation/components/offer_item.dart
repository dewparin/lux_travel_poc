import 'package:flutter/material.dart';
import 'package:lux_travel_poc/model/offer.dart';
import 'package:lux_travel_poc/model/offer_model.dart';
import 'package:lux_travel_poc/presentation/constant.dart';
import 'package:lux_travel_poc/presentation/screens/screen_arguments.dart';
import 'package:provider/provider.dart';

/// OfferItem functions.
///
/// Set favorite/unfavorite offer when tapped on favorite icon automatically via OfferModel.
/// Navigates to OfferDetailScreen when tapped on OfferItem.

class OfferItem extends StatelessWidget {
  final int offerUid;
  final bool allowNavigateToDetailScreen;

  const OfferItem({
    Key? key,
    required this.offerUid,
    this.allowNavigateToDetailScreen = false,
  }) : super(key: key);

  void _toggleFavorite(BuildContext context) {
    Provider.of<OfferModel>(context, listen: false).toggleFavorite(offerUid);
  }

  void _handleOnTappedOffer(BuildContext context) {
    if (allowNavigateToDetailScreen) {
      Navigator.pushNamed(
        context,
        '/detail',
        arguments: OfferDetailScreenArguments(offerUid),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OfferModel>(builder: (_, model, __) {
      final offer = model.getOfferByUid(offerUid);
      return GestureDetector(
        onTap: () {
          _handleOnTappedOffer(context);
        },
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
    });
  }

  Column _buildItemDetail(BuildContext context, Offer offer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLocationAndFavoriteListTile(context, offer),
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

  ListTile _buildLocationAndFavoriteListTile(
          BuildContext context, Offer offer) =>
      ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Icon(Icons.location_pin),
        title: Align(
          child: new Text(
            offer.location,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          alignment: Alignment(-1.3, 0),
        ),
        trailing: IconButton(
          icon: offer.isFavorite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          color: offer.isFavorite ? Colors.red[500] : null,
          onPressed: () {
            _toggleFavorite(context);
          },
        ),
      );
}
