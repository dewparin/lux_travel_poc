import 'package:flutter/material.dart';
import 'package:lux_travel_poc/model/offer_model.dart';
import 'package:lux_travel_poc/presentation/components/offer_item.dart';
import 'package:lux_travel_poc/presentation/constant.dart';
import 'package:provider/provider.dart';

const _mockDetailDescription =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    'Tellus at urna condimentum mattis. Eget gravida cum sociis natoque. '
    'Risus viverra adipiscing at in. Pretium fusce id velit ut. '
    'At quis risus sed vulputate odio. '
    'Sed sed risus pretium quam vulputate dignissim suspendisse. '
    'Pharetra et ultrices neque ornare. '
    'Vitae aliquet nec ullamcorper sit amet risus nullam. '
    'Ut lectus arcu bibendum at. '
    'Molestie a iaculis at erat pellentesque adipiscing commodo. '
    'Amet venenatis urna cursus eget. '
    'Lacinia at quis risus sed vulputate odio ut enim. '
    'Praesent tristique magna sit amet purus gravida quis blandit. '
    'Dolor purus non enim praesent elementum facilisis leo. '
    'Vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt. '
    'Arcu non sodales neque sodales ut. '
    'Sodales ut eu sem integer vitae justo eget magna. '
    'Sed nisi lacus sed viverra tellus in hac.'
    '\n'
    '\n'
    '\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    'Tellus at urna condimentum mattis. Eget gravida cum sociis natoque. '
    'Risus viverra adipiscing at in. Pretium fusce id velit ut. '
    'At quis risus sed vulputate odio. '
    'Sed sed risus pretium quam vulputate dignissim suspendisse. '
    'Pharetra et ultrices neque ornare. '
    'Vitae aliquet nec ullamcorper sit amet risus nullam. '
    'Ut lectus arcu bibendum at. '
    'Molestie a iaculis at erat pellentesque adipiscing commodo. '
    'Amet venenatis urna cursus eget. '
    'Lacinia at quis risus sed vulputate odio ut enim. '
    'Praesent tristique magna sit amet purus gravida quis blandit. '
    'Dolor purus non enim praesent elementum facilisis leo. '
    'Vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt. '
    'Arcu non sodales neque sodales ut. '
    'Sodales ut eu sem integer vitae justo eget magna. '
    'Sed nisi lacus sed viverra tellus in hac.';

class OfferDetailScreenArguments {
  final int offerUid;

  OfferDetailScreenArguments(this.offerUid);
}

class OfferDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as OfferDetailScreenArguments;
    return Consumer<OfferModel>(builder: (_, model, __) {
      final offer = model.getOfferByUid(args.offerUid);
      return Scaffold(
        appBar: AppBar(
          title: Text(offer.accommodationName),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OfferItem(
                  offerUid: offer.uid,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(_mockDetailDescription)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
