import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/screens-n-widgets/wg_cards_4buttons.dart';
import '/constants.dart';

import '/scr_start_graph_stacktool.dart';

int selectedCrypto = 0;

class scr_cryptoPage extends StatefulWidget {
  @override
  State<scr_cryptoPage> createState() => _scr_cryptoPage_State();
}

class _scr_cryptoPage_State extends State<scr_cryptoPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;
    final TextStyle plateText = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle dropdownText = TextStyle(
        fontFamily: 'Inter-regular',
        color: containerColor,
        fontSize: 14 * heightRatio,
        fontWeight: FontWeight.w400);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Your crypto total',
              style: TextStyle(
                  fontFamily: 'Inter-regular',
                  color: majorColor,
                  fontSize: 20 * heightRatio,
                  fontWeight: FontWeight.w400)),
          Text('€25.901,02',
              style: TextStyle(
                  fontFamily: 'Inter-regular',
                  color: majorColor,
                  fontSize: 40 * heightRatio,
                  fontWeight: FontWeight.w400)),
          ToggleButtons3(),
          SizedBox(height: 10 * heightRatio),
          Row(
            children: [
              SizedBox(width: 35 * widthRatio),
              Text('Wallet', style: plateText),
              SizedBox(width: 10 * widthRatio),
              Image.asset(
                'assets/button_faces/Add new icon.png',
                height: 20 * heightRatio,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                CryptoItem(CryptoAssets[0], widthRatio, heightRatio, 0),
                CryptoItem(CryptoAssets[1], widthRatio, heightRatio, 1),
                CryptoItem(CryptoAssets[2], widthRatio, heightRatio, 2),
                CryptoItem(CryptoAssets[3], widthRatio, heightRatio, 3),
                CryptoItem(CryptoAssets[2], widthRatio, heightRatio, 4),
                CryptoItem(CryptoAssets[3], widthRatio, heightRatio, 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget CryptoItem(
      Crypto cryptoAsset, double widthRatio, double heightRatio, int index) {
    TextStyle txt20mj = TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        color: majorColor,
        fontSize: 20 * heightRatio);

    TextStyle txt15low = TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        color: btnBgColor,
        fontSize: 15 * heightRatio);

    return Padding(
        padding: EdgeInsets.only(
            left: 20 * widthRatio,
            right: 20 * widthRatio,
            top: 12 * heightRatio),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10 * heightRatio),
            primary: containerColor,
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          onPressed: () {
            if (selectedCrypto != index) {
              setState(() {
                selectedCrypto = index;
              });
            }
          },
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      height: 40 * heightRatio,
                      width: 40 * heightRatio,
                      child: Image.asset(cryptoAsset.path)),
                  SizedBox(width: 10 * heightRatio),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(cryptoAsset.code, style: txt20mj),
                            Row(
                              children: [
                                Text(cryptoAsset.wallet, style: txt20mj),
                                SizedBox(width: 10 * heightRatio),
                              ],
                            ),
                            Text(
                                '${cryptoAsset.amount.toString()} ${cryptoAsset.code}',
                                style: txt20mj)
                            // Text(
                            //     '€${NumberFormat.currency(locale: "eu", symbol: '').format(cryptoAsset.amount)}',
                            //     style: txt20mj)
                          ],
                        ),
                        SizedBox(height: 5 * heightRatio),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '€${NumberFormat.currency(locale: "eu", symbol: '').format(cryptoAsset.rate)}',
                                style: txt15low),
                            Text(
                                '€${NumberFormat.currency(locale: "eu", symbol: '').format(cryptoAsset.amount * cryptoAsset.rate)}',
                                style: txt15low),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10 * heightRatio),
              selectedCrypto == index
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          wg_button(
                              context,
                              heightRatio,
                              'assets/button_faces/Deposit icon.svg',
                              'svg',
                              'Buy',
                              0),
                          wg_button(
                              context,
                              heightRatio,
                              'assets/button_faces/Withdraw icon.svg',
                              'svg',
                              'Sell',
                              0),
                          wg_button(
                              context,
                              heightRatio,
                              'assets/button_faces/Pay icon.svg',
                              'svg',
                              'Pay',
                              0,
                              route: '/scr_cardsPayFromCard'),
                          wg_button(
                              context,
                              heightRatio,
                              'assets/button_faces/Swap icon.svg',
                              'svg',
                              'Swap',
                              0),
                        ])
                  : SizedBox()
            ],
          ),
        ));
  }
}
