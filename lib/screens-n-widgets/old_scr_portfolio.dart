import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'wg_bottom_bar.dart';

import 'wg_cards_4buttons.dart';
import '/constants.dart';
import 'wg_app_bar.dart';
import 'wg_recents_on_cards.dart';
import 'wg_transaction_on_cards.dart';
import '/scr_start_graph_stacktool.dart';

class scr_portfolioPage extends StatefulWidget {
  @override
  State<scr_portfolioPage> createState() => _scr_portfolioPage_State();
}

class _scr_portfolioPage_State extends State<scr_portfolioPage> {
  List<String> dropdownItems = [
    'This week',
    'This month',
    '6 months',
    'This year',
    '3 years',
  ];
  String _dropdownValue = 'This week';

  Widget dropDownResut(String value, double heightRatio) {
    String percentage = '25%';
    Color arrowColor = increaseColor;
    IconData arrowType = Icons.arrow_drop_up_sharp;

    switch (value) {
      case 'This week':
        percentage = '25%';
        arrowColor = increaseColor;
        arrowType = Icons.arrow_drop_up_sharp;
        break;
      case 'This month':
        percentage = '7%';
        arrowColor = increaseColor;
        arrowType = Icons.arrow_drop_up_sharp;
        break;
      case '6 months':
        percentage = '-7%';
        arrowColor = negativeAmount;
        arrowType = Icons.arrow_drop_down_sharp;
        break;
      case 'This year':
        percentage = '-16%';
        arrowColor = negativeAmount;
        arrowType = Icons.arrow_drop_down_sharp;
        break;
      case '3 years':
        percentage = '47%';
        arrowColor = increaseColor;
        arrowType = Icons.arrow_drop_up_sharp;
        break;
    }

    return Row(
      children: [
        Text(percentage,
            style: TextStyle(
                fontFamily: 'Inter-regular',
                color: arrowColor,
                fontSize: 20 * heightRatio,
                fontWeight: FontWeight.w400)),
        Icon(arrowType, color: arrowColor, size: 25 * heightRatio),
      ],
    );
  }

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

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: globalAppBar(context, 6, heightRatio, 1),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Your portfolio total',
                  style: TextStyle(
                      fontFamily: 'Inter-regular',
                      color: majorColor,
                      fontSize: 14 * heightRatio,
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
                  Text('Portfolio', style: plateText),
                  SizedBox(width: 10 * widthRatio),

                  Image.asset(
                    'assets/button_faces/Add new icon.png',
                    height: 20 * heightRatio,
                  ),

                  // Icon(
                  //   Icons.add_box_outlined,
                  //   size: 25 * heightRatio,
                  //   color: majorColor,
                  // ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    // ##### High tech stocks

                    Padding(
                      padding: EdgeInsets.only(
                          left: 20 * widthRatio,
                          right: 20 * widthRatio,
                          top: 10 * heightRatio),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: containerColor,
                          elevation: 5,
                          //fixedSize:
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        onPressed: () {},
                        child: Container(
                            child: Column(
                          children: [
                            SizedBox(height: 10 * widthRatio),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40 * heightRatio,
                                  width: 120 * widthRatio,
                                  child: Image.asset(
                                      'assets/bank_logos/HF_logo_long.png',
                                      fit: BoxFit.contain),
                                ),
                                Text('€4.750,91', style: plateText)
                              ],
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('High tech stocks', style: plateText),
                                  Text(
                                    '1W +20.5%',
                                    style: TextStyle(
                                        color: increaseColor,
                                        fontSize: 20 * heightRatio,
                                        fontFamily: 'Inter-regular',
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  wg_button(
                                      context,
                                      heightRatio,
                                      'assets/button_faces/Buy icon.png',
                                      'png',
                                      'Deposit',
                                      0),
                                  wg_button(
                                      context,
                                      heightRatio,
                                      'assets/button_faces/Withdraw icon.png',
                                      'png',
                                      'Withdraw',
                                      0),
                                  wg_button(
                                      context,
                                      heightRatio,
                                      'assets/button_faces/Pay icon.png',
                                      'png',
                                      'Pay',
                                      0),
                                  wg_button(
                                      context,
                                      heightRatio,
                                      'assets/button_faces/Portfolio icon.png',
                                      'png',
                                      'List',
                                      0),
                                ])
                          ],
                        )),
                      ),
                    ),

                    // ####### Industrial stocks
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20 * widthRatio,
                          right: 20 * widthRatio,
                          top: 12 * heightRatio),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: containerColor,
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        onPressed: () {},
                        child: Container(
                            child: Column(
                          children: [
                            SizedBox(height: 10 * widthRatio),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40 * heightRatio,
                                  width: 120 * widthRatio,
                                  child: Image.asset(
                                      'assets/bank_logos/HF_logo_long.png',
                                      fit: BoxFit.contain),
                                ),
                                Text('€4.750,91', style: plateText)
                              ],
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Industrial stocks', style: plateText),
                                  Text(
                                    '1W +20.5%',
                                    style: TextStyle(
                                        color: increaseColor,
                                        fontSize: 20 * heightRatio,
                                        fontFamily: 'Inter-regular',
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                            SizedBox(height: 10 * heightRatio),
                          ],
                        )),
                      ),
                    ),

// ######## General stocks
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20 * widthRatio,
                          right: 20 * widthRatio,
                          top: 12 * heightRatio),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: containerColor,
                          elevation: 5,
                          //fixedSize:
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        onPressed: () {},
                        child: Container(
                            child: Column(
                          children: [
                            SizedBox(height: 10 * widthRatio),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40 * heightRatio,
                                  width: 120 * widthRatio,
                                  child: Image.asset(
                                      'assets/bank_logos/HF_logo_long.png',
                                      fit: BoxFit.contain),
                                ),
                                Text('€4.750,91', style: plateText)
                              ],
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('General stocks', style: plateText),
                                  Text(
                                    '1W +20.5%',
                                    style: TextStyle(
                                        color: increaseColor,
                                        fontSize: 20 * heightRatio,
                                        fontFamily: 'Inter-regular',
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                wg_button(
                                    context,
                                    heightRatio,
                                    'assets/button_faces/Deposit icon.png',
                                    'png',
                                    'Deposit',
                                    0),
                                wg_button(
                                    context,
                                    heightRatio,
                                    'assets/button_faces/Portfolio icon.png',
                                    'png',
                                    'List',
                                    0),
                                wg_button(
                                    context,
                                    heightRatio,
                                    'assets/button_faces/Watch icon.png',
                                    'png',
                                    'Watch',
                                    0),
                                wg_button(
                                    context,
                                    heightRatio,
                                    'assets/button_faces/Hide icon.png',
                                    'png',
                                    'Remove',
                                    0),
                              ],
                            ),
                            //        SizedBox(height: 10 * heightRatio),
                          ],
                        )),
                      ),
                    ),

                    // ###### Finance stocks
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20 * widthRatio,
                          right: 20 * widthRatio,
                          top: 12 * heightRatio),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: containerColor,
                          elevation: 5,
                          //fixedSize:
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        onPressed: () {},
                        child: Container(
                            child: Column(
                          children: [
                            SizedBox(height: 10 * widthRatio),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40 * heightRatio,
                                  width: 120 * widthRatio,
                                  child: Image.asset(
                                      'assets/bank_logos/HF_logo_long.png',
                                      fit: BoxFit.contain),
                                ),
                                Text('€4.750,91', style: plateText)
                              ],
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Finance stocks', style: plateText),
                                  Text(
                                    '1M -4.55%',
                                    style: TextStyle(
                                        color: negativeAmount,
                                        fontSize: 20 * heightRatio,
                                        fontFamily: 'Inter-regular',
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                            SizedBox(height: 10 * heightRatio),
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              wg_bottom_bar(context, heightRatio),
            ],
          ),
        ),
      ),
    );
  }
}
