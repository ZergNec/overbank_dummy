import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:badges/badges.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget wg_4buttons(BuildContext context, double heightRatio) {
  return Padding(
    padding: EdgeInsets.only(
        left: 20 * heightRatio, right: 20 * heightRatio, top: 20 * heightRatio),
    child: Container(
      height: 75 * heightRatio,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          wg_button(context, heightRatio, 'assets/button_faces/Pay icon.png',
              'png', 'Pay', 2,
              route: '/scr_cardsPayFromCard'),
          // route: 'pay page'),
          wg_button(context, heightRatio, 'assets/button_faces/Buy icon.png',
              'png', 'Request', 0,
              route: '/scr_cardsRequestToCard'),
          wg_button(context, heightRatio,
              'assets/button_faces/History icon.png', 'png', 'History', 3),
          wg_button(context, heightRatio,
              'assets/button_faces/Add new icon.svg', 'svg', 'Add', 0),
        ],
      ),
    ),
  );
}

Widget wg_button(BuildContext context, double heightRatio, String asset,
    String assetType, label, int badgeCount,
    {String? route, Icon? icon}) {
  return TextButton(
    style: TextButton.styleFrom(
      primary: bgColor,
      elevation: 0,
      //fixedSize:
    ),
    onPressed: () {
      print('$label pressed');
      if (route != null) {
        Navigator.pushNamed(context, route);
      }
    },
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Badge(
            badgeContent: const Text(
              '',
              //badgeCount.toString(),
              style: TextStyle(
                  color: btnLightColor,
                  fontFamily: 'Inter-regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            badgeColor: negativeAmount,
            showBadge: badgeCount > 0,
            animationType: BadgeAnimationType.scale,
            position: BadgePosition.topEnd(top: -10, end: -10),
            child: assetByType(asset, assetType, 25 * heightRatio, icon: icon)),
        // assetType != 'svg'
        //     ? Image.asset(asset,
        //         height: 25 * heightRatio, width: 25 * heightRatio)
        //     : SvgPicture.asset(asset,
        //         height: 25 * heightRatio, width: 25 * heightRatio)),
        Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Inter-regular',
                fontWeight: FontWeight.w400,
                color: majorColor,
                fontSize: 20 * heightRatio))
      ],
    ),
  );
}

Widget assetByType(String asset, String assetType, double height,
    {Icon? icon}) {
  switch (assetType) {
    case 'svg':
      return SvgPicture.asset(asset, height: height, width: 25 * height);
    case 'icon':
      if (icon != null) {
        return icon;
      } else {
        return const Icon(Icons.error);
      }
    case 'svg':
      return SvgPicture.asset(asset, height: height, width: 25 * height);
    default:
      return Image.asset(asset, height: height, width: height);
  }
}
