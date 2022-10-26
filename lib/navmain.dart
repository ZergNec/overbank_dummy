import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';
import '/screens-n-widgets/wg_app_bar.dart';
import '/pages/pageCards.dart';
import '/pages/pageBanks.dart';
import '/pages/pagePortfolio.dart';
import '/pages/pageCrypto.dart';
import '/pages/pageButtons.dart';
import '/pages/pageNFT.dart';
import '/pages/pageDiscounts.dart';
//int globalPageIndex = 3;

class navmain extends StatefulWidget {
  @override
  State<navmain> createState() => navmain_State();
}

class navmain_State extends State<navmain> {
  int currentIndex = 3;
  callback(varIndex) {
    setState(() {
      currentIndex = varIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      scr_cardsPage(),
      scr_banksPage(),
      scr_portfolioPage(),
      Buttons(tabIndex: 1, callbackFunction: callback),
      scr_cryptoPage(),
      PageNFT(),
      PageDiscounts(),
    ];

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;

    final double iconSize = 25 * heightRatio;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        appBar: globalAppBar(context, 1, heightRatio, currentIndex),
        body: SafeArea(
            child: IndexedStack(
          index: currentIndex,
          children: screens,
          key: ObjectKey(screens[0].hashCode),
        )),
        bottomNavigationBar: SizedBox(
          height: 85 * heightRatio,
          child: BottomNavigationBar(
              //    key: keyTab,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: bgColor,
              enableFeedback: true,
              //selectedIconTheme: IconThemeData(color: Colors.black),
              selectedFontSize: 0,
              unselectedFontSize: 0,
              elevation: 5,
              // selectedItemColor: Colors.blue,
              //  unselectedItemColor: Colors.deepOrangeAccent,
              showSelectedLabels: false,
              //iconSize: 20,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  // icon: Image.asset('assets/button_faces/Cards icon.png',
                  //     height: iconSize),
                  icon: SvgPicture.asset('assets/button_faces/Cards icon.svg',
                      height: iconSize),

                  activeIcon: Image.asset(
                    'assets/button_faces/Cards icon selected.png',
                    height: iconSize,
                  ),
                  label: 'Cards',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/button_faces/Bank icon.png',
                      height: iconSize),
                  activeIcon: Image.asset(
                      'assets/button_faces/Bank icon selected.png',
                      height: iconSize),
                  label: 'Banks',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/button_faces/List icon.svg',
                      height: iconSize),
                  activeIcon: SvgPicture.asset(
                      'assets/button_faces/Portfolio icon selected.svg',
                      height: iconSize),
                  label: 'Portfolio',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Center(
                    child: SvgPicture.asset('assets/button_faces/Logo.svg',
                        height: iconSize * 1.8),
                  ),
                  label: 'Home',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/button_faces/Crypto icon.png',
                      height: iconSize),
                  activeIcon: Image.asset(
                      'assets/button_faces/Crypto icon selected.png',
                      height: iconSize),
                  label: 'Crypto',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/button_faces/NFT icon.png',
                      height: iconSize),
                  activeIcon: Image.asset(
                      'assets/button_faces/NFT icon selected.png',
                      height: iconSize),
                  label: 'NFT',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/button_faces/Discounts.svg',
                      height: iconSize),
                  activeIcon: Image.asset(
                      'assets/button_faces/Discounts selected.png',
                      height: iconSize),
                  label: 'Discounts',
                  // activeIcon: Image.asset('assets/button_faces/NFT icon.png',
                  //     height: 25),
                  backgroundColor: Colors.blue,
                ),
              ]),
        ),
      ),
    );
  }
}
