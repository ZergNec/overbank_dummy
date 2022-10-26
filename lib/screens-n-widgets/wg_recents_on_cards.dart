import 'dart:math';

import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget wgRecents(BuildContext context, double heightRatio) {
  return Container(
    height: 100 * heightRatio,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return wgButton(recents[index], heightRatio);
      },
      itemCount: recents.length,
    ),
  );
}

Widget wgButton(Clients contact, double heightRatio) {
  return TextButton(
      style: TextButton.styleFrom(
        primary: bgColor,
        elevation: 0,
      ),
      onPressed: () {
        print('${contact.name} pressed');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            foregroundImage: AssetImage(contact.avatarPath),
            radius: 25 * heightRatio,
            backgroundColor: bgColor,
          ),
          Container(
            //alignment: Ali,
            width: 67 * heightRatio,
            //height: 40 * heightRatio,
            child: Text(contact.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, //contact.name,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontFamily: 'Inter-regular',
                    fontWeight: FontWeight.w400,
                    color: btnBgColor,
                    fontSize: 16 * heightRatio)),
          ),
        ],
      ));
}
