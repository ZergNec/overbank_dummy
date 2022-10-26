import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:badges/badges.dart';

Widget HideButton(BuildContext context, double heightRatio) {
  return IconButton(
      onPressed: () {
        print(
            'MediaQuery.of(context).size.width ${MediaQuery.of(context).size.width}');
        print('height ${MediaQuery.of(context).size.height}');
        print('recents.length: ${recents.length}');
      },
      icon: Image.asset(
        'assets/button_faces/Hide icon.png',
        height: 25 * heightRatio,
      ));
}

Widget AddButton(BuildContext context, double heightRatio) {
  return IconButton(
      onPressed: () {
        print('add button pressed');
        Navigator.pushNamed(context, '/addDCard');
      },
      icon: Image.asset(
        'assets/button_faces/Add new icon.png',
        height: 25 * heightRatio,
      ));
}

AppBar globalAppBar(BuildContext context, int notificationsCount,
    double heightRatio, int tabIndex) {
  return AppBar(
    toolbarHeight: 60 * heightRatio,
    leading: IconButton(
      icon: Image.asset(
        'assets/button_faces/Profile icon.png',
        height: 25 * heightRatio,
      ),
      iconSize: 30 * heightRatio,
      onPressed: () {
        print('Account pressed');
      },
    ),
    actions: [
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        tabIndex == 6
            ? AddButton(context, heightRatio)
            : HideButton(context, heightRatio),
        // IconButton(
        //     onPressed: () {
        //       print(
        //           'MediaQuery.of(context).size.width ${MediaQuery.of(context).size.width}');
        //       print('height ${MediaQuery.of(context).size.height}');
        //       print('recents.length: ${recents.length}');
        //       print(recents[3].avatarPath);
        //     },
        //     icon: Image.asset(
        //       'assets/button_faces/Hide icon.png',
        //       height: 25 * heightRatio,
        //     )),
        Badge(
          elevation: 0,
          badgeContent: const Text(
            '',
            //notificationsCount.toString(),
            style: TextStyle(
                color: btnLightColor,
                fontFamily: 'Inter-regular',
                fontWeight: FontWeight.w400,
                fontSize: 12),
          ),
          badgeColor: negativeAmount,
          animationType: BadgeAnimationType.scale,
          position: BadgePosition.topEnd(top: 0, end: 10),
          showBadge: false, //notificationsCount > 0,
          //borderRadius: BorderRadius.circular(1.0),
          //showBadge: _notifications_count > 0 ? true : false,
          child: IconButton(
            onPressed: () {
              print('Notification pressed');
            },
            icon: Image.asset(
              'assets/button_faces/Notifications.png',
              height: 25 * heightRatio,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ]),
    ],
    backgroundColor: Color(0xFFFFFAF4),
    elevation: 0,
  );
}
