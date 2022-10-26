import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/screens-n-widgets/wg_cards_4buttons.dart';
import '/constants.dart';
import '/scr_start_graph_stacktool.dart';
import 'package:flutter_svg/flutter_svg.dart';

int selectedStock = 0;

class scr_portfolioPage extends StatefulWidget {
  @override
  State<scr_portfolioPage> createState() => _scr_portfolioPage_State();
}

class _scr_portfolioPage_State extends State<scr_portfolioPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;

    final TextStyle txt20mj = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txt40mj = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 40 * heightRatio,
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
          Text('Your portfolio total', style: txt20mj),
          Text('€94.750,91', style: txt40mj),
          ToggleButtons3(),
          SizedBox(height: 10 * heightRatio),
          Row(
            children: [
              SizedBox(width: 35 * widthRatio),
              Text('Portfolio', style: txt20mj),
              SizedBox(width: 10 * widthRatio),
            ],
          ),
          Expanded(
            child: ListView(children: [
              stockPlate(widthRatio, heightRatio, 0),
              stockPlate(widthRatio, heightRatio, 1),
              stockPlate(widthRatio, heightRatio, 2),
              stockPlate(widthRatio, heightRatio, 3),
              stockPlate(widthRatio, heightRatio, 4),
            ]),
          ),
        ],
      ),
    );
  }

  Widget stockPlate(double widthRatio, double heightRatio, int index) {
    final TextStyle txt20mj = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txt20inactive = TextStyle(
        fontFamily: 'Inter-regular',
        color: btnBgColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txt20negative = TextStyle(
        color: negativeAmount,
        fontSize: 20 * heightRatio,
        fontFamily: 'Inter-regular',
        fontWeight: FontWeight.w400);

    final TextStyle txt20positive = TextStyle(
        color: increaseColor,
        fontSize: 20 * heightRatio,
        fontFamily: 'Inter-regular',
        fontWeight: FontWeight.w400);

    if (selectedStock == index) {
      print('2');
    }

    return Padding(
      padding: EdgeInsets.only(
          left: 20 * widthRatio, right: 20 * widthRatio, top: 10 * heightRatio),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: containerColor,
          elevation: 5,
          //fixedSize:
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        onPressed: () {
          print(
              'index=$selectedStock. This is: ${Stocks[index].name},  ${Stocks[index].amount},  ${Stocks[index].delta}, ${Stocks[index].viewed}');
          if (selectedStock != index) {
            setState(() {
              selectedStock = index;
            });
          }
        },
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
                  child: Image.asset('assets/bank_logos/HF_logo_long.png',
                      fit: BoxFit.contain),
                ),
                Stocks[index].amount != 0
                    ? Text(
                        '€${NumberFormat.currency(locale: "eu", symbol: '').format(Stocks[index].amount)}',
                        style: index == selectedStock ? txt20mj : txt20inactive)
                    : !Stocks[index].viewed & (index != selectedStock)
                        ? SvgPicture.asset(
                            'assets/button_faces/Watch icon inactive.svg')
                        : SizedBox(width: 1),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(Stocks[index].name,
                  style: index == selectedStock ? txt20mj : txt20inactive),
              Text(
                '1W ${Stocks[index].delta > 0 ? '+' : ''}${Stocks[index].delta}%',
                style:
                    (Stocks[index].delta > 0 ? txt20positive : txt20negative),
              )
            ]),
            index != selectedStock
                ? SizedBox(height: 10 * heightRatio)
                : Stocks[index].amount != 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            wg_button(
                                context,
                                heightRatio,
                                'assets/button_faces/Deposit icon.svg',
                                'svg',
                                'Deposit',
                                0),
                            wg_button(
                                context,
                                heightRatio,
                                'assets/button_faces/Withdraw icon.svg',
                                'svg',
                                'Withdraw',
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
                                'assets/button_faces/List icon.svg',
                                'svg',
                                'List',
                                0),
                          ])
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                'assets/button_faces/List icon.svg',
                                'svg',
                                'List',
                                0),
                            Stocks[index].viewed
                                ? wg_button(
                                    context,
                                    heightRatio,
                                    'assets/button_faces/Hide icon.svg',
                                    'svg',
                                    'Remove',
                                    0)
                                : wg_button(
                                    context,
                                    heightRatio,
                                    'assets/button_faces/Watch icon.svg',
                                    'svg',
                                    'Watch',
                                    0),
                          ]),
          ],
        )),
      ),
    );
  }
}
