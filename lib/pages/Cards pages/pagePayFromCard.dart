import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:overbank/pages/pageDCardsList.dart';
import '/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/screens-n-widgets/wg_recents_on_cards.dart';
import '/screens-n-widgets/wg_cards_4buttons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class dbItem {
  String path, name, currencyCode;
  double amount;
  int value;

  dbItem(this.path, this.name, this.currencyCode, this.amount, this.value);
}

class PagePayFromCard extends StatefulWidget {
  @override
  State<PagePayFromCard> createState() => _PagePayFromCard_State();
}

class _PagePayFromCard_State extends State<PagePayFromCard> {
  final _textController = TextEditingController();
  int _dbSelected = 1;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  List<dbItem> payToo() {
    dbItem item;
    List<dbItem> result = [];

    for (int i = 0; i < BankCards.length; i++) {
      item = dbItem(BankCards[i].imgPath, BankCards[i].cardNumber,
          BankCards[i].currencyCode, BankCards[i].amount, result.length + 1);
      result.add(item);
    }

    for (int i = 0; i < BankAccounts.length; i++) {
      item = dbItem(
          BankAccounts[i].bankLogoPath,
          BankAccounts[i].accountNumber,
          BankAccounts[i].currencyCode,
          BankAccounts[i].amount,
          result.length + 1);
      result.add(item);
    }

    for (int i = 0; i < CryptoAssets.length; i++) {
      item = dbItem(
          CryptoAssets[i].path,
          CryptoAssets[i].code,
          CryptoAssets[i].code,
          CryptoAssets[i].rate * CryptoAssets[i].amount,
          result.length + 1);
      result.add(item);
    }

    return result;
  }

  List<double> _getCustomItemsHeights(int itemsLength) {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (itemsLength * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(65);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(2);
      }
    }
    return _itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;

    final TextStyle txt15 = TextStyle(
        fontFamily: 'Inter-regular',
        color: btnBgColor,
        fontSize: 15 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txt20mj = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txt20low = TextStyle(
        fontFamily: 'Inter-regular',
        color: btnBgColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    List<DropdownMenuItem<int>> _addDividersAfterItems(List<dbItem> items) {
      List<DropdownMenuItem<int>> _menuItems = [];
      for (var item in items) {
        _menuItems.addAll(
          [
            DropdownMenuItem<int>(
                value: item.value,
                child: SizedBox(
                    //height: 70 * heightRatio,

                    width: deviceWidth * 0.8,
                    child: ListTile(
                        leading:
                            (item.path.substring(item.path.length - 3) == 'svg')
                                ? SizedBox(
                                    height: 45 * heightRatio,
                                    width: 45 * widthRatio,
                                    child: SvgPicture.asset(
                                      item.path,
                                      // height: 45 * heightRatio,
                                      // width: 20 * widthRatio,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : SizedBox(
                                    height: 45 * heightRatio,
                                    width: 45 * widthRatio,
                                    child: Image.asset(
                                      item.path,
                                      height: 45 * heightRatio,
                                      //  width: 45 * widthRatio,
                                    ),
                                  ),
                        title: Text(item.name, style: txt20mj),
                        subtitle: Text(
                            //item.amount.toString(),

                            '€${NumberFormat.currency(locale: "eu", symbol: '').format(item.amount)}',
                            style: txt15)))),
            //If it's last item, we will not add Divider after it.
            if (item != items.last)
              const DropdownMenuItem<int>(
                enabled: false,
                child: Divider(),
              ),
          ],
        );
      }
      return _menuItems;
    }

    String _search = '';

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 20 * heightRatio),
            Row(children: [
              SizedBox(width: 20 * heightRatio),
              IconButton(
                //padding: EdgeInsets.zero,
                onPressed: () {
                  //print('Go back');
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/button_faces/Close page icon.png',
                    height: 20 * heightRatio),
              )
            ]),
            Container(
                height: min(deviceHeight * .2, deviceWidth * 0.45),
                width: min(deviceHeight * .2, deviceWidth * 0.45),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(136, 196, 196, 196),
                        offset: Offset.fromDirection(1.5, 5),
                        blurRadius: 3,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/button_faces/Scan QR.svg'),
                    SizedBox(height: 10 * heightRatio),
                    Text('Tap to scan QR code', style: txt15)
                  ],
                )),
            SizedBox(height: 10 * heightRatio),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 28 * widthRatio, top: 10 * heightRatio),
                child: Text(
                  textAlign: TextAlign.left,
                  'Payment options',
                  style: txt20mj,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                wg_button(context, heightRatio,
                    'assets/button_faces/Cards icon.svg', 'svg', 'Card', 0),
                wg_button(context, heightRatio,
                    'assets/button_faces/Bank icon.svg', 'svg', 'Bank', 0),
                wg_button(context, heightRatio, '', 'icon', 'Phone', 0,
                    icon: Icon(
                      Icons.phone_enabled_outlined,
                      color: majorColor,
                      size: 25 * heightRatio,
                    )),
                wg_button(context, heightRatio,
                    'assets/button_faces/Crypto icon.svg', 'svg', 'Crypto', 0),
                wg_button(context, heightRatio,
                    'assets/button_faces/Swap icon.svg', 'svg', 'Own', 0),
              ],
            ),

// Add selector
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 28 * widthRatio, top: 10 * heightRatio),
                child: Text(
                  textAlign: TextAlign.left,
                  'Pay from account',
                  style: txt20mj,
                ),
              ),
            ),
// 'DropBox of accounts',
            Padding(
              padding: EdgeInsets.only(
                  // top: 10 * heightRatio,
                  left: 20 * widthRatio,
                  // bottom: 20 * heightRatio,
                  right: 20 * widthRatio),
              child: Container(
                height: 70 * heightRatio,
                width: deviceWidth * 0.95,
                decoration: BoxDecoration(
                  color: containerColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(136, 196, 196, 196),
                      offset: Offset.fromDirection(1.5, 5),
                      blurRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 0 * heightRatio),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      dropdownMaxHeight: deviceHeight * 0.4,
                      scrollbarAlwaysShow: true,
                      customItemsHeights:
                          _getCustomItemsHeights(payToo().length),
                      enableFeedback: true,
                      itemPadding: EdgeInsets.zero,
                      isDense: true,
                      isExpanded: false,
                      value: _dbSelected,
                      itemHeight: heightRatio * 70,
                      iconSize: 40 * heightRatio,
                      items: _addDividersAfterItems(payToo()),

                      /* payToo()
                          .map((item) => DropdownMenuItem<int>(
                              value: item.value,
                              child: SizedBox(
                                  //height: 70 * heightRatio,

                                  width: deviceWidth * 0.8,
                                  child: ListTile(
                                      leading: (item.path.substring(
                                                  item.path.length - 3) ==
                                              'svg')
                                          ? SizedBox(
                                              height: 45 * heightRatio,
                                              width: 45 * widthRatio,
                                              child: SvgPicture.asset(
                                                item.path,
                                                // height: 45 * heightRatio,
                                                // width: 20 * widthRatio,
                                                fit: BoxFit.contain,
                                              ),
                                            )
                                          : SizedBox(
                                              height: 45 * heightRatio,
                                              width: 45 * widthRatio,
                                              child: Image.asset(
                                                item.path,
                                                height: 45 * heightRatio,
                                                //  width: 45 * widthRatio,
                                              ),
                                            ),
                                      title: Text(item.name, style: txt20mj),
                                      subtitle: Text(
                                          //item.amount.toString(),

                                          '€${NumberFormat.currency(locale: "eu", symbol: '').format(item.amount)}',
                                          style: txt15)))))
                          .toList(),
                          */

                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _dbSelected = value as int;
                          print('_dbSelected = $_dbSelected');
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: 10 * heightRatio,
                  left: 20 * widthRatio,
                  right: 20 * widthRatio,
                  bottom: 20 * heightRatio),
              child: Container(
                decoration: BoxDecoration(
                  color: containerColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(136, 196, 196, 196),
                      offset: Offset.fromDirection(1.5, 5),
                      blurRadius: 3,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                    controller: _textController,
                    style: txt15,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {
                      _search = value;
                      print('$_search ');
                      setState(() {});
                    },
                    onSubmitted: (value) {
                      _search = '';
                      setState(() {
                        _textController.clear();
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10 * heightRatio),
                      hintText: 'search name, phone, email',
                      //alignLabelWithHint: true,
                      hintStyle: txt15,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Icon(Icons.search,
                            size: 30 * heightRatio, color: btnBgColor),
                      ),

                      suffixIcon: IconButton(
                          color: _textController.text.length > 0
                              ? btnBgColor
                              : bgColor,
                          onPressed: () {
                            setState(() {
                              _textController.clear();
                            });
                          },
                          icon: Icon(Icons.clear)),

                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,

                      disabledBorder: InputBorder.none,
                    )),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 28.0 * heightRatio, right: 28.0 * heightRatio),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recents',
                            style: TextStyle(
                                fontFamily: 'Inter-regular',
                                color: majorColor,
                                fontSize: 20 * heightRatio,
                                fontWeight: FontWeight.w400)),
                        SvgPicture.asset(
                            'assets/button_faces/Recipient book.svg',
                            height: 25 * heightRatio,
                            width: 25 * heightRatio),
                      ],
                    ),
                  ),
                  wgRecents(context, heightRatio),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 28 * widthRatio, bottom: 10 * heightRatio),
                          child: Text('Pending requests',
                              textAlign: TextAlign.left, style: txt20mj))),
                  Padding(
                    padding: EdgeInsets.only(
                        //   top: 10 * heightRatio,
                        left: 20 * widthRatio,
                        right: 20 * widthRatio),
                    child: Container(
                      //    width: deviceWidth * 0.8,
                      decoration: BoxDecoration(
                          color: containerColor,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(136, 196, 196, 196),
                                offset: Offset.fromDirection(1.5, 5),
                                blurRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset('assets/people_avatars/Amy.png',
                            height: 50 * heightRatio),
                        title: Text('€50,00 request from Amy', style: txt20low),
                        subtitle: Text('Bobby please add for new shoes',
                            style: txt15),
                        trailing: Column(
                          children: [
                            Icon(
                              Icons.circle,
                              color: negativeAmount,
                              size: 20 * heightRatio,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        //   top: 10 * heightRatio,
                        left: 20 * widthRatio,
                        right: 20 * widthRatio),
                    child: Container(
                      //    width: deviceWidth * 0.8,
                      decoration: BoxDecoration(
                          color: containerColor,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(136, 196, 196, 196),
                                offset: Offset.fromDirection(1.5, 5),
                                blurRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset(
                            'assets/people_avatars/Andrew avatar.png',
                            height: 50 * heightRatio),
                        title: Text('€75,00 request from Andrew Berger',
                            style: txt20low),
                        subtitle:
                            Text('Please pay for plumbing works', style: txt15),
                        trailing: Column(
                          children: [
                            Icon(
                              Icons.circle,
                              color: negativeAmount,
                              size: 20 * heightRatio,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
