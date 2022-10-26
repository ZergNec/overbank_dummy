import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget wgCardTransactions(BuildContext context, double heightRatio) {
  return Expanded(
    child: ListView.builder(
      //scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return wgTButton(BankTransactions[index], 1, heightRatio);
      },
      itemCount: recents.length,
    ),
  );
}

Widget wgTButton(BankTransaction BT, int indexx, double heightRatio) {
  Color colorAmount;
  if (BT.Amount < 0) {
    colorAmount = negativeAmount;
  } else {
    colorAmount = btnBgColor;
  }

  return TextButton(
    style: TextButton.styleFrom(
      primary: bgColor,
      elevation: 0,
    ),
    onPressed: () {
      print('${BT.Purpose} pressed');
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10 * heightRatio),
        CircleAvatar(
          foregroundImage: AssetImage(BT.logo),
          minRadius: 20 * heightRatio,
          maxRadius: 25 * heightRatio,
          //radius: 15 * heightRatio,
          backgroundColor: bgColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(BT.From,
                style: TextStyle(
                    color: majorColor,
                    fontSize: 16 * heightRatio,
                    fontFamily: 'Inter-regular',
                    fontWeight: FontWeight.w400)),
            Text(BT.Purpose,
                style: TextStyle(
                    color: btnBgColor,
                    fontSize: 12 * heightRatio,
                    fontFamily: 'Inter-regular',
                    fontWeight: FontWeight.w400))
          ],
        ),
        Expanded(child: Text('')),
        BT.arrow
            ? SvgPicture.asset('assets/button_faces/Vector.svg')
            : SizedBox(height: 1),
        SizedBox(width: 20 * heightRatio),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //+ €2500.95
            Text(
                NumberFormat.simpleCurrency(locale: 'eu', decimalDigits: 2)
                    .format(BT.Amount),

                //Text('${BT.currency} ${BT.Amount.toString()}',
                style: TextStyle(
                    color: colorAmount,
                    fontSize: 16 * heightRatio,
                    fontFamily: 'Inter-regular',
                    fontWeight: FontWeight.w400)),
            Text(DateFormat.yMMMMd('en_US').format(BT.dateTrans),
                style: TextStyle(
                    color: btnBgColor,
                    fontSize: 12 * heightRatio,
                    fontFamily: 'Inter-regular',
                    fontWeight: FontWeight.w400))
          ],
        ),
        SizedBox(width: 10 * heightRatio),
      ],
    ),
  );
}

Widget wgTBanksButton(
    BankPageTransaction BT, int indexx, double heightRatio, double widthRatio) {
  Color colorAmount;
  if (BT.amount < 0) {
    colorAmount = negativeAmount;
  } else {
    colorAmount = btnBgColor;
  }

  return SizedBox(
    height: 45 * heightRatio,
    child: TextButton(
      style: TextButton.styleFrom(
        // maximumSize:2,
        padding: EdgeInsets.zero,
        primary: bgColor,
        elevation: 0,
      ),
      onPressed: () {
        print('${BT.purpose} pressed');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20 * widthRatio),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(BT.whoToPay,
                  style: TextStyle(
                      color: majorColor,
                      fontSize: 16 * heightRatio,
                      fontFamily: 'Inter-regular',
                      fontWeight: FontWeight.w400)),
              Text(BT.purpose,
                  style: TextStyle(
                      color: btnBgColor,
                      fontSize: 12 * heightRatio,
                      fontFamily: 'Inter-regular',
                      fontWeight: FontWeight.w400))
            ],
          ),
          Expanded(child: Text('')),
          BT.arrow
              ? SvgPicture.asset('assets/button_faces/Vector.svg')
              : SizedBox(height: 1),
          SizedBox(width: 20 * heightRatio),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //+ €2500.95
              Text(
                  NumberFormat.simpleCurrency(locale: 'eu', decimalDigits: 2)
                      .format(BT.amount),

                  //Text('${BT.currency} ${BT.Amount.toString()}',
                  style: TextStyle(
                      color: colorAmount,
                      fontSize: 16 * heightRatio,
                      fontFamily: 'Inter-regular',
                      fontWeight: FontWeight.w400)),
              Text(DateFormat.yMMMMd('en_US').format(BT.dateTransaction),
                  style: TextStyle(
                      color: btnBgColor,
                      fontSize: 12 * heightRatio,
                      fontFamily: 'Inter-regular',
                      fontWeight: FontWeight.w400))
            ],
          ),
          SizedBox(width: 20 * heightRatio),
        ],
      ),
    ),
  );
}
