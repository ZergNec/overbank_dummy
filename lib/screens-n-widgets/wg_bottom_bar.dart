//import 'dart:collection';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

Widget wg_bottom_bar(BuildContext context, double heightRatio) {
  final double setIconSize = 25 * heightRatio;
  double btmNavigationBarHeight =
      Platform.isAndroid ? kBottomNavigationBarHeight : 84;
  return Container(
    color: Colors.lightGreen,
    //height: 10 * heightRatio,
    //height: 40 * heightRatio,
    height: btmNavigationBarHeight, //65 * heightRatio,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/scr_cards');
          },
          //iconSize: 5 * heightRatio,
          icon: Image.asset('assets/button_faces/Cards icon.png',
              height: setIconSize),
        ),
        IconButton(
          onPressed: () {
            print('navigate to bank');
            print('$heightRatio');
            Navigator.pushNamed(context, '/scr_banks');
          },
          icon: Image.asset('assets/button_faces/Bank icon.png',
              height: setIconSize),
        ),
        IconButton(
          onPressed: () {
            print('navigate to scr_portfolio');
            Navigator.pushNamed(context, '/scr_portfolio');
          },
          icon: Image.asset('assets/button_faces/Portfolio icon.png',
              height: setIconSize),
        ),
        // Material(
        //   //color: Color(0xFF52706E),
        //   color: Color(0xFFFFFAF4),
        //   clipBehavior: Clip.antiAliasWithSaveLayer,

        //   //shape: ,
        //   borderRadius:
        //       BorderRadius.circular(MediaQuery.of(context).size.width * .064),
        //   child: InkWell(
        //     onTap: () {
        //       Navigator.pushNamed(context, '/');
        //     },
        //     child: Container(
        //       // color: Colors.greenAccent,
        //       child: Ink.image(
        //         image:
        //             //AssetImage('assets/button_faces/central_button_logo.png'),
        //             SvgPicture.asset('assets/button_faces/Logo.svg'),
        //         height: MediaQuery.of(context).size.width * .064 * 2,
        //         width: MediaQuery.of(context).size.width * .064 * 2,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),

        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: SvgPicture.asset('assets/button_faces/Logo.svg',
              height: setIconSize * 3),
          iconSize: setIconSize * 2,
          //         height: MediaQuery.of(context).size.width * .064 * 2,
          //         width: MediaQuery.of(context).size.width * .064 * 2,),
        ),

        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/scr_crypto');
          },
          icon: Image.asset('assets/button_faces/Crypto icon.png',
              height: setIconSize),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/scr_tokens');
          },
          icon: Image.asset('assets/button_faces/NFT icon.png',
              height: setIconSize),
        ),
        IconButton(
            onPressed: () {
              print('navigate to cards_screen');
            },
            // icon: Icon(Icons.store_mall_directory_outlined,
            //   color: Color(0xFF52706E), size: 30),

            icon: SvgPicture.asset('assets/button_faces/Discounts.svg',
                height: setIconSize)),
      ],
    ),
  );
}
