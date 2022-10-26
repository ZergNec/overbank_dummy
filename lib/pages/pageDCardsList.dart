import 'dart:math';

import 'package:flutter/material.dart';
import 'package:overbank/constants.dart';
import 'package:overbank/pages/pageDiscounts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/pages/discount_stack/contact.dart';
import '/pages/discount_stack/swipeCard.dart';
import 'package:card_swiper/card_swiper.dart';

List<String> items = [
  'A',
  'Afroditi',
  'AB city',
  'Ariadni',
  '',
  'B',
  'Bazaar',
  '',
  'C',
  'Chalkiadakis',
  '',
  'E',
  'Ellinika Market',
  '',
  'G',
  'Galaxias',
  '',
  'K',
  'Kritikos',
  'Koutelieris',
  '',
  'M',
  'Market In',
  'Masoutis',
  'My Market',
  '',
  'P',
  'Proton',
  '',
  'S',
  'Sklavenitis',
  'Spar',
  'SYN.KA Super Markets',
  '',
  'T',
  'Thanopoulos'
];

class ListDCards extends StatefulWidget {
  //ListDCards(this.items);
  // final int tabIndex;
  // final Function callbackFunction;
  // const SwipeCards(
  //     {Key? key, required this.tabIndex, required this.callbackFunction})
  //     : super(key: key);

  @override
  State<ListDCards> createState() => _ListDCardsState();
}

class _ListDCardsState extends State<ListDCards> {
  @override
  //int _currentItem = 0;
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;

    final TextStyle txt20 = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle plateText = TextStyle(
        fontFamily: 'Inter-regular',
        color: btnBgColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    return ListView.builder(
        itemCount: items.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: 25 * heightRatio,
                right: 20 * heightRatio,
                top: 5 * heightRatio),
            child: Text(
              items[index],
              //  '${items[index]} len: ${items[index].length}',
              style: items[index].length == 1 ? txt20 : plateText,
            ),
          );
        }));
  }
}
