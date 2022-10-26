import 'dart:math';

import 'package:flutter/material.dart';
import 'package:overbank/constants.dart';
import 'package:overbank/pages/pageDiscounts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/pages/discount_stack/contact.dart';
import '/pages/discount_stack/swipeCard.dart';

import 'package:card_swiper/card_swiper.dart';

class SwipeCards extends StatefulWidget {
  List<String> items;

  SwipeCards(this.items);
  // final int tabIndex;
  // final Function callbackFunction;
  // const SwipeCards(
  //     {Key? key, required this.tabIndex, required this.callbackFunction})
  //     : super(key: key);

  @override
  State<SwipeCards> createState() => _SwipeCardsState();
}

class _SwipeCardsState extends State<SwipeCards> {
  @override
  int _currentItem = 0;
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;

    return Column(
      children: [
        SizedBox(height: 10 * heightRatio),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'groceries',
            style: TextStyle(fontSize: 14 * heightRatio, color: majorColor),
          ),
          Text(
            'Tesco',
            style: TextStyle(fontSize: 14 * heightRatio, color: majorColor),
          ),
          Text(
            'Athens',
            style: TextStyle(fontSize: 14 * heightRatio, color: majorColor),
          )
        ]),
        SizedBox(height: 5 * heightRatio),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'wine',
              style: TextStyle(fontSize: 14 * heightRatio, color: majorColor),
            ),
            Text(
              'Kerkya street',
              style: TextStyle(fontSize: 14 * heightRatio, color: majorColor),
            )
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              // height: deviceHeight / 2.8,
              // width: deviceWidth * 0.9,

              height: deviceHeight / 2.7,
              width: deviceWidth * 0.9,

              child: Container(
                child: Swiper(
                  itemCount: items.length,
                  layout: SwiperLayout.STACK,

                  itemHeight: deviceHeight * 0.25,
                  itemWidth: deviceWidth * 0.85,

                  // itemHeight: deviceHeight * 0.29,
                  // itemWidth: deviceWidth * 0.85,

                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return DiscountCardFace(context, Contact.contacts[index]);
                  },
                  onIndexChanged: (value) {
                    _currentItem = value;
                    setState(() {});
                  },
                ),
              ),
            ),
            Positioned(
              top: deviceHeight * 0.33,
              left: deviceWidth * 0.025,
              child: SizedBox(
                  height: deviceHeight * 0.25,
                  width: deviceWidth * 0.85,
                  child: DiscountCardBack(
                      context, Contact.contacts[_currentItem])),
            ),
            Positioned(
                left: -deviceWidth * 0.025,
                top:
                    min(90 * heightRatio, 150 * heightRatio - items.length * 5),
                child: AnimatedSmoothIndicator(
                  axisDirection: Axis.vertical,
                  activeIndex:
                      (min(7, items.length) * _currentItem / items.length)
                          .toInt(),
                  count: min(7, items.length),
                  effect: ExpandingDotsEffect(
                    activeDotColor: btnBgColor,
                    dotColor: btnBgColor,
                    dotHeight: 10 * heightRatio,
                    dotWidth: 10 * heightRatio,
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
