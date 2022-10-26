import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/screens-n-widgets/wg_recents_on_cards.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class dbItem {
  String path, name, currencyCode;
  double amount;
  int value;

  dbItem(this.path, this.name, this.currencyCode, this.amount, this.value);
}

class PageRequestToCard extends StatefulWidget {
  // List<List<String>> items;
  // PageRequestToCard(this.items);

  @override
  State<PageRequestToCard> createState() => _PageRequestToCard_State();
}

class _PageRequestToCard_State extends State<PageRequestToCard> {
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

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;

    final TextStyle txt24 = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 24 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txt15 = TextStyle(
        fontFamily: 'Inter-regular',
        color: btnBgColor,
        fontSize: 15 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txt40 = TextStyle(
        fontFamily: 'Inter-regular',
        color: btnBgColor,
        fontSize: 40 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txt20mj = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    String _search = '';

    List<double> _getCustomItemsHeights(int itemsLength) {
      List<double> _itemsHeights = [];
      for (var i = 0; i < (itemsLength * 2) - 1; i++) {
        if (i.isEven) {
          _itemsHeights.add(70);
        }
        //Dividers indexes will be the odd indexes
        if (i.isOdd) {
          _itemsHeights.add(10);
        }
      }
      return _itemsHeights;
    }

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: SingleChildScrollView(
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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        //blurRadius: 4,

                        color: Color.fromARGB(136, 196, 196, 196),
                        offset: Offset.fromDirection(1.5, 5),
                        blurRadius: 3,
                      )
                    ]),
                child: QrImage(
                  padding: EdgeInsets.all(25),
                  //  backgroundColor: Colors.red,
                  data: "1234567890",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              SizedBox(height: 20 * heightRatio),
              Text('Scan to pay', style: txt15),
              Text('€25.90', style: txt40),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 28 * widthRatio, top: 10 * heightRatio),
                  child: Text(
                    textAlign: TextAlign.left,
                    'To account',
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
                        //  customItemsHeights: _getCustomItemsHeights(3),
                        enableFeedback: true,
                        itemPadding: EdgeInsets.zero,
                        isDense: true,
                        isExpanded: false,
                        value: _dbSelected,

                        itemHeight: heightRatio * 70,
                        iconSize: 40 * heightRatio,

                        items: payToo()
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
                    top: 20 * heightRatio,
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
                        //errorBorder: InputBorder.none,
                        //focusedErrorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      )),
                ),
              ),
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
                    SvgPicture.asset('assets/button_faces/Recipient book.svg',
                        height: 25 * heightRatio, width: 25 * heightRatio),
                  ],
                ),
              ),
              wgRecents(context, heightRatio),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 28 * widthRatio, bottom: 10 * heightRatio),
                      child: Text(
                        'Other options',
                        textAlign: TextAlign.left,
                        style: txt20mj,
                      ))),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 28 * widthRatio),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      // style: ,
                      child: Column(children: [
                        SvgPicture.asset('assets/button_faces/Link icon.svg'),
                        Text('Share link', style: txt20mj)
                      ])),
                  SizedBox(
                    width: 40 * widthRatio,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      // style: ,
                      child: Column(children: [
                        SvgPicture.asset('assets/button_faces/Split icon.svg'),
                        Text('Split bill', style: txt20mj)
                      ])),
                ],
              ),
              //Expanded(child: SizedBox(width: 1)),
            ],
          ),
        )));
  }
}
