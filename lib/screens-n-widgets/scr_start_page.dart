import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import '/screens-n-widgets/scr_start_graph.dart';
import 'wg_bottom_bar.dart';
import '/constants.dart';
import 'wg_six_buttons.dart';
import 'wg_app_bar.dart';

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

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFFFAF4),
        appBar: globalAppBar(context, 6, heightRatio, 1),
        /*
         AppBar(
          toolbarHeight: 60 * heightRatio,
          leading: IconButton(
            iconSize: 20 * heightRatio,
            icon: Icon(Icons.account_box_outlined, color: Color(0xFF52706E)),
            onPressed: () {
              print('Account pressed');
            },
          ),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                  onPressed: () {
                    print('Hide pressed');
                  },
                  iconSize: 20 * heightRatio,
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color(0xFF25706E),
                  )),
              Badge(
                badgeContent: Text(
                  '5',
                  style: TextStyle(
                      color: btnLightColor,
                      fontFamily: 'Inter-regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                badgeColor: Colors.red,
                animationType: BadgeAnimationType.scale,
                position: BadgePosition.topEnd(top: 5, end: 5),
                //borderRadius: BorderRadius.circular(1.0),
                //showBadge: _notifications_count > 0 ? true : false,
                child: IconButton(
                    onPressed: () {
                      print('Notification pressed');
                    },
                    iconSize: 20 * heightRatio,
                    icon: Icon(Icons.notifications_none,
                        color: Color(0xFF25706E))),
              ),
              SizedBox(
                width: 20 * widthRatio,
              ),
            ]),
          ],
          backgroundColor: Color(0xFFFFFAF4),
          elevation: 0,
        ),
        */

        body: SafeArea(
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
              wg_bottom_bar(context, heightRatio),
            ],
          ),
        ),
      ),
    );
  }
}
