import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/screens-n-widgets/wg_cards_4buttons.dart';
import '/constants.dart';
import '/screens-n-widgets/wg_recents_on_cards.dart';
import '/screens-n-widgets/wg_transaction_on_cards.dart';
import 'package:flutter_svg/flutter_svg.dart';

class scr_banksPage extends StatefulWidget {
  @override
  State<scr_banksPage> createState() => _scr_bankPage_State();
}

class _scr_bankPage_State extends State<scr_banksPage> {
  int activeIndex = 0;
  final cardImages = [
    [
      'assets/bank_logos/Bank logo 1.svg',
      'ING | Mortgage transit',
      '€5.801,00',
      'FR91AXNF0R1916A541'
    ],
    [
      'assets/bank_logos/Bank logo 2.png',
      'HA | Internet basic usage',
      '€90,00',
      'GB91ABNA041716C773'
    ],
    [
      'assets/bank_logos/Bank logo 3.png',
      'Rabobank | Study Savings',
      '€25.901,02',
      'NL91ABNA0417164300'
    ],
    [
      'assets/bank_logos/Bank logo 4.svg',
      'Shield Bank | Travel Savings',
      '€10.000,00',
      'DE91EKBR0417167762'
    ],
    [
      'assets/bank_logos/Bank logo 5.svg',
      'Infinite | Personal Insurance',
      '€0,02',
      'GR91ITMPS041128531'
    ],
  ];

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
    final TextStyle txt24 = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 24 * heightRatio,
        fontWeight: FontWeight.w400);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider.builder(
              itemCount: cardImages.length,
              itemBuilder: (context, index, realIndex) {
                final cardImage = cardImages[index][0];

                return buildImage(cardImage, index, heightRatio);
              },
              options: CarouselOptions(
                height: 90 * heightRatio,
                viewportFraction: 0.25,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              )),
          SizedBox(height: 20 * heightRatio),
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
          SizedBox(height: 20 * heightRatio),
          Text(cardImages[activeIndex][1], style: txt24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 40 * heightRatio),
              Text(cardImages[activeIndex][3], style: txt24),
              SizedBox(width: 20 * heightRatio),
              SvgPicture.asset(
                'assets/button_faces/Copy icon.svg',
                height: 20 * heightRatio,
              ),
            ],
          ),
          Text(cardImages[activeIndex][2],
              style: TextStyle(
                  fontFamily: 'Inter-regular',
                  color: majorColor,
                  fontSize: 40 * heightRatio,
                  fontWeight: FontWeight.w400)),
          wg_4buttons(context, heightRatio),
          Expanded(
            child: ListView.builder(
              //scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 28.0 * heightRatio,
                            right: 28.0 * heightRatio),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20 * widthRatio,
                        height: 35 * heightRatio,
                      ),
                      Text('Transactions',
                          style: TextStyle(
                              fontFamily: 'Inter-regular',
                              color: majorColor,
                              fontSize: 20 * heightRatio,
                              fontWeight: FontWeight.w400)),
                    ],
                  );
                } else {
                  return wgTBanksButton(BankPageTransactions[index - 2], index,
                      heightRatio, widthRatio);
                }
              },
              itemCount: BankPageTransactions.length + 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String cardImage, int Index, double heightRatio) =>
      Container(
          //margin: EdgeInsets.symmetric(horizontal: 12),
          //color: Colors.green,
          //width: double.infinity,
          child: (cardImage.substring(cardImage.length - 3) == 'svg')
              ? SvgPicture.asset(
                  cardImage,
                  fit: BoxFit.contain,
                  height: 90 * heightRatio,
                  width: 90 * heightRatio,
                )
              : Image.asset(
                  cardImage,
                  fit: BoxFit.contain,
                  height: 90 * heightRatio,
                  width: 90 * heightRatio,
                  //  height: 70 * heightRatio,
                )

          //  Image.asset(
          //   height: 50,
          //   width: 50,
          //   cardImage,
          //   fit: BoxFit.contain,
          // ),
          );

  Widget buildIdicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: cardImages.length,
        //effect: ,
      );
}
