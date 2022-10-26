import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import '/constants.dart';

Widget button170x170(
  BuildContext context,
  String assetName,
  String assetValue,
  String assetChange,
  String assetPut,
  String assetGive,
  double heightRatio,
  double widthRatio,
  String navigateTo,
) {
  TextStyle styleAssetName = TextStyle(
      fontFamily: 'Inter-regular',
      fontWeight: FontWeight.w400,
      color: btnLightColor,
      fontSize: 20 * heightRatio);

  TextStyle styleAssetValue = TextStyle(
      fontFamily: 'Inter-regular',
      fontWeight: FontWeight.w400,
      color: btnLightColor,
      fontSize: 25 * heightRatio);

  TextStyle assetDetails = TextStyle(
      fontFamily: 'Inter-regular',
      fontWeight: FontWeight.w400,
      fontSize: 14 * heightRatio,
      color: majorColor);

  return SizedBox(
    height: 155 * heightRatio,
    width: 175 * widthRatio,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: btnBgColor,
        elevation: 5,
        //fixedSize:
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      onPressed: () {
        print('== Button "$assetName" pressed ===');
        //Navigator.pushNamed(context, navigateTo);
        //DefaultTabController.of(context)?.animateTo(1);
//        of(context).currentIndex = 1;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20 * heightRatio),
          Text(
              //textAlign: TextAlign.left,
              assetName,
              style: styleAssetName),
          Text(assetValue, style: styleAssetValue),
          SizedBox(height: 24.52 * heightRatio),
          Text(assetChange, style: assetDetails),
          Text(assetPut, style: assetDetails),
          Text(assetGive, style: assetDetails),
        ],
      ),
    ),
  );
}

Widget wg_six_buttons(
    BuildContext context, double heightRatio, double widthRatio) {
  final double spacer = 18 * min(heightRatio, widthRatio);

  return Container(
    padding: EdgeInsets.only(
      left: 30 * widthRatio,
      right: 30 * widthRatio,
    ),
    decoration: BoxDecoration(
      color: bgColor,
    ),
    child: // ListView(
        Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button 1
            button170x170(
                context,
                'Cards',
                '€2.750,01',
                '1M +15%',
                'Received €1.549,14',
                'Spent €1.014,22',
                heightRatio,
                widthRatio,
                '/scr_cards'),

            SizedBox(width: spacer),
            // Button 2
            button170x170(
                context,
                'Bank accounts',
                '€56.906,63',
                '1W +42%',
                'Received €40K',
                'Sent €3.200,24',
                heightRatio,
                widthRatio,
                '/scr_banks'),
            // Button 2
          ],
        ),
        SizedBox(height: spacer),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button 3
            button170x170(
                context,
                'Portfolio',
                '€20.860,00',
                '1Y +4,3% ',
                'Invested €20.000,00',
                'Revenue €860,00',
                heightRatio,
                widthRatio,
                '/scr_portfolio'),

            SizedBox(width: spacer),
            // Button 4
            button170x170(
                context,
                'Crypto',
                '€14.234,27',
                '6M -18%',
                'Invested €20.000,00',
                'Revenue -€5.765,73',
                heightRatio,
                widthRatio,
                '/scr_crypto'),
          ],
        ),
        SizedBox(height: spacer),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button 5
            button170x170(
                context,
                'NFT',
                '€915,42',
                '3M -8%',
                'Bought €1.000,00',
                'Sold €84,58',
                heightRatio,
                widthRatio,
                '/scr_tokens'),
            // Button 6
            SizedBox(width: spacer),
            button170x170(context, 'Discounts', ' ', ' ', 'Cards added 33',
                'Available nearby 47', heightRatio, widthRatio, '/scr_cards'),
          ],
        ),
      ],
    ),
  );
}
