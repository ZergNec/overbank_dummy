import 'package:flutter/material.dart';

import 'navmain.dart';
import 'pages/pageAddNFT.dart';
import 'pages/pageAddDCard.dart';
import 'pages/Cards pages/pageRequestToCard.dart';
import 'pages/Cards pages/pagePayFromCard.dart';

void main() {
  runApp(
    MaterialApp(
      // title: 'MBank',
      initialRoute: '/',
      routes: {
        '/': (context) => navmain(),
        '/scr_cardsRequestToCard': (context) => PageRequestToCard(),
        '/scr_cardsPayFromCard': (context) => PagePayFromCard(),
        '/addNFT': (context) => PageAddNFT(),
        '/addDCard': (context) => PageAddDCard(),
      },
    ),
  );
}
