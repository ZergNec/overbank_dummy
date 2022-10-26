import 'package:flutter/material.dart';
import '/screens-n-widgets/wg_home_header.dart';
import '/constants.dart';
import '/screens-n-widgets/wg_six_buttons.dart';
import '/screens-n-widgets/wg_MainButtonTemplate.dart';

class Buttons extends StatelessWidget {
  final int tabIndex;
  final Function callbackFunction;
  const Buttons(
      {Key? key, required this.tabIndex, required this.callbackFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;

    final double spacer = 20 * widthRatio;

//706.56

    // final double bh =
    //     (706.56 * heightRatio - 2 * 30 * heightRatio - 2 * spacer) / 3;

    //final double boxHeight = 155 * heightRatio;
    final double boxHeight =
        ((706.56 - 100) * heightRatio - 2 * 30 * heightRatio - 2 * spacer) / 3;

    final boxWidth = (deviceWidth - 3 * spacer) / 2;
    //final boxWidth = 175 * widthRatio;

    return Center(
      child: Column(
        children: [
          HomeHeader(),
          //  SizedBox(height: heightRatio * 30),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: boxHeight,
                      width: boxWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: btnBgColor,
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        onPressed: () {
                          callbackFunction(0);
                        },
                        child: buttonChild(
                          context,
                          'Cards',
                          '€2.750,01',
                          '1M +15%',
                          'Received €1.549,14',
                          'Spent €1.014,22',
                          heightRatio,
                          widthRatio,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: boxHeight,
                      width: boxWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: btnBgColor,
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        onPressed: () {
                          callbackFunction(1);
                        },
                        child: buttonChild(
                          context,
                          'Bank accounts',
                          '€56.906,63',
                          '1W +42%',
                          'Received €40K',
                          'Sent €3.200,24',
                          heightRatio,
                          widthRatio,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacer),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: boxHeight,
                      width: boxWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: btnBgColor,
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        onPressed: () {
                          callbackFunction(2);
                        },
                        child: buttonChild(
                          context,
                          'Portfolio',
                          '€20.860,00',
                          '1Y +4,3% ',
                          'Invested €20.000,00',
                          'Revenue €860,00',
                          heightRatio,
                          widthRatio,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: boxHeight,
                      width: boxWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: btnBgColor,
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        onPressed: () {
                          callbackFunction(4);
                        },
                        child: buttonChild(
                          context,
                          'Crypto',
                          '€14.234,27',
                          '6M -18%',
                          'Invested €20.000,00',
                          'Revenue -€5.765,73',
                          heightRatio,
                          widthRatio,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacer),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: boxHeight,
                      width: boxWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: btnBgColor,
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        onPressed: () {
                          callbackFunction(5);
                        },
                        child: buttonChild(
                          context,
                          'NFT',
                          '€915,42',
                          '3M -8%',
                          'Bought €1.000,00',
                          'Sold €84,58',
                          heightRatio,
                          widthRatio,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: boxHeight,
                      width: boxWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: btnBgColor,
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                        onPressed: () {
                          callbackFunction(6);
                        },
                        child: buttonChild(
                          context,
                          'Discounts',
                          ' ',
                          ' ',
                          'Cards added 33',
                          'Available nearby 47',
                          heightRatio,
                          widthRatio,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
