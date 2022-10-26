import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/constants.dart';
import 'wg_app_bar.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeader_State();
}

class _HomeHeader_State extends State<HomeHeader> {
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

    return Center(
      child: Column(
        children: [
          Text(
            'Mr. Bobby Axelrod',
            style: TextStyle(
                fontFamily: 'Inter-regular',
                fontWeight: FontWeight.w400,
                color: Color(0xFF25706E),
                fontSize: 24 * heightRatio),
          ),
          Text(
            'your financial assets total:',
            style: TextStyle(
                fontFamily: 'Inter-regular',
                fontWeight: FontWeight.w400,
                color: Color(0xFF25706E),
                fontSize: 18 * heightRatio),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 55 * heightRatio,
              ),
              Text(
                '€94.750,91',
                style: TextStyle(
                    fontFamily: 'Inter-regular',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF25706E),
                    fontSize: 40 * heightRatio),
              ),
              IconButton(
                onPressed: () {
                  print(
                      'heightratio=$heightRatio, fontsize=${40 * heightRatio}');
                },
                icon: Icon(Icons.more_vert,
                    color: Color(0xFF52706E), size: 35 * heightRatio),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
