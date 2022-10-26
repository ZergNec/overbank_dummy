import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import '/screens-n-widgets/scr_start_graph.dart';
import '/constants.dart';
import '/screens-n-widgets/wg_six_buttons.dart';
import 'package:provider/provider.dart';

class scr_startPage extends StatefulWidget {
  @override
  State<scr_startPage> createState() => _home_screen_State();
}

class _home_screen_State extends State<scr_startPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;

    return SafeArea(
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
                width: 50,
              ),
              Text(
                '€94.750,91',
                style: TextStyle(
                    fontFamily: 'Inter-regular',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF25706E),
                    fontSize: 40 * heightRatio),
              ),
              // SizedBox(width: 20),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert,
                    color: Color(0xFF52706E), size: 35 * heightRatio),
              ),
            ],
          ),
          scr_start_graph(context, heightRatio, widthRatio),
          //SizedBox(height: deviceHeight * .015),
          Expanded(
            child: wg_six_buttons(context, heightRatio, widthRatio),
          ),
        ],
      ),
    );
  }
}
