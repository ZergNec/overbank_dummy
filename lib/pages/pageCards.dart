import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/constants.dart';
import '/screens-n-widgets/wg_recents_on_cards.dart';
import '/screens-n-widgets/wg_transaction_on_cards.dart';
import '/screens-n-widgets/wg_cards_4buttons.dart';

class scr_cardsPage extends StatefulWidget {
  @override
  State<scr_cardsPage> createState() => _scr_cardPage_State();
}

class _scr_cardPage_State extends State<scr_cardsPage> {
  int activeIndex = 0;
  final cardImages = [
    'assets/card_faces/AMRO Bank Card.png',
    'assets/card_faces/ING Bank Card.png',
    'assets/card_faces/Robobank Card.png',
  ];

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
            itemCount: cardImages.length,
            itemBuilder: (context, index, realIndex) {
              final cardImage = cardImages[index];

              return buildImage(cardImage, index);
            },
            options: CarouselOptions(
              height: 220 * heightRatio,
              viewportFraction: 0.75,
              // enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            )),

        SizedBox(height: 15 * heightRatio),

//              buildIndicator(),

        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: cardImages.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Color(0xFF7DA4A1),
            dotColor: Color(0xFF7DA4A1),
            //dotColor: Color(0xFF7DA4A1),
            dotHeight: 10 * heightRatio,
            dotWidth: 10 * heightRatio,
          ),
        ),
        wg_4buttons(context, heightRatio),
        // SizedBox(height: 10 * heightRatio),

        // Padding(
        //   padding: EdgeInsets.only(
        //       left: 28.0 * heightRatio, right: 28.0 * heightRatio),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text('Recents',
        //           style: TextStyle(
        //               fontFamily: 'Inter-regular',
        //               color: majorColor,
        //               fontSize: 20 * heightRatio,
        //               fontWeight: FontWeight.w400)),
        //       SvgPicture.asset('assets/button_faces/Recipient book.svg',
        //           height: 25 * heightRatio, width: 25 * heightRatio),
        //     ],
        //   ),
        // ),

        Expanded(
          child: ListView.builder(
            //scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 28.0 * heightRatio, right: 28.0 * heightRatio),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Recents',
                              style: TextStyle(
                                  fontFamily: 'Inter-regular',
                                  color: majorColor,
                                  fontSize: 20 * heightRatio,
                                  fontWeight: FontWeight.w400)),
                          SvgPicture.asset(
                              'assets/button_faces/Recipient book.svg',
                              height: 25 * heightRatio,
                              width: 25 * heightRatio),
                        ],
                      ),
                    ),
                    wgRecents(context, heightRatio),
                  ],
                );
              } else if (index == 1) {
                return Row(
                  children: [
                    SizedBox(width: 20 * widthRatio),
                    Text('Transactions',
                        style: TextStyle(
                            fontFamily: 'Inter-regular',
                            color: majorColor,
                            fontSize: 20 * heightRatio,
                            fontWeight: FontWeight.w400)),
                  ],
                );
              } else {
                return wgTButton(
                    BankTransactions[index - 2], index, heightRatio);
              }
            },
            itemCount: BankTransactions.length + 2,
          ),
        ),
      ],
    );
  }

  Widget buildImage(String cardImage, int Index) => Container(
        //margin: EdgeInsets.symmetric(horizontal: 12),
        //color: Colors.green,
        //width: double.infinity,
        child: Image.asset(
          cardImage,
          fit: BoxFit.contain,
        ),
      );

  Widget buildIdicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: cardImages.length,
        //effect: ,
      );
}
