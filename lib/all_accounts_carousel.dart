import 'package:flutter/material.dart';

Widget allAccountsCarousel(
    BuildContext context, double Amount, String Currency) {
  final double deviceWidth = MediaQuery.of(context).size.width;
  final double deviceHeight = MediaQuery.of(context).size.height;
  // double amount = 0;
  //String currency = 'EUR';

  return Container(
    //height: 60,
    width: .2 * deviceWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('All accounts: $Amount $Currency'),
        SizedBox(
          width: .05 * deviceWidth,
        ),
      ],
    ),
  );
}
