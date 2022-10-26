import 'package:flutter/material.dart';
import '/constants.dart';
import '/pages/discount_stack/contact_list_page.dart';
import '/pages/pageSwipeCards.dart';
import '/pages/discount_stack/contact.dart';
import '/pages/pageDCardsList.dart';
import '/pages/pageSwipeCards.dart';

List<String> items = [
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  'ten'
];
int _pageIndex = 0;

class PageDiscounts extends StatefulWidget {
  @override
  State<PageDiscounts> createState() => _PageDiscounts_State();
}

class _PageDiscounts_State extends State<PageDiscounts> {
  final pageController = PageController(initialPage: 0);
  final _textController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    String _cardTag = '';
    String _newTag = '';

    bool isTagFound = false;
    List<Contact> contacts;

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

    final TextStyle txt15mj = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 18 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txt20 = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w500);

    final TextStyle plateText = TextStyle(
        fontFamily: 'Inter-regular',
        color: btnBgColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle style15 = TextStyle(
        fontFamily: 'Inter-regular',
        color: btnBgColor,
        fontSize: 15 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle style10 = TextStyle(
        fontFamily: 'Inter-regular',
        color: btnBgColor,
        fontSize: 10 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle style30 = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 30 * heightRatio,
        fontWeight: FontWeight.w300);

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.only(left: 20 * widthRatio, right: 20 * widthRatio),
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
              style: txt15mj,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) {
                _cardTag = value;
                print('$_cardTag ');
                setState(() {});
              },
              onSubmitted: (value) {
                _cardTag = value;
                if (value == 'split') {
                  isTagFound = true;
                  print('s = $isTagFound');
                  setState(() {
                    isTagFound = true;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'No card with supplied tags found. Try other tags.')));
                  if (isTagFound == true) {
                    isTagFound = false;
                  }
                }
                _cardTag = '';
                setState(() {
                  _textController.clear();
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10 * heightRatio),
                hintText: 'search name, address, product type',
                //alignLabelWithHint: true,
                hintStyle: txt15,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Icon(Icons.search,
                      size: 30 * heightRatio, color: btnBgColor),
                ),

                suffixIcon: IconButton(
                    color:
                        _textController.text.length > 0 ? btnBgColor : bgColor,
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
      SizedBox(height: 10 * heightRatio),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
          width: deviceWidth * 0.43,
          child: TextButton(
            style: TextButton.styleFrom(
                side: BorderSide(
                    color: _pageIndex == 1 ? btnBgColor : majorColor,
                    width: _pageIndex == 1 ? 1 : 2),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0)),
            onPressed: () {
              print('Your location');
              print('_pageIndex=$_pageIndex');
              // if (items.length > 4) items.removeAt(4);
              // setState(() {});
              pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut);
              // Navigator.pushNamed(context, '/addNFT');
            },
            child: Center(
                child: Text('Your location',
                    style: _pageIndex == 1 ? plateText : txt20)),
          ),
        ),
        SizedBox(
          width: deviceWidth * 0.43,
          child: TextButton(
            style: TextButton.styleFrom(
                side: BorderSide(
                    color: _pageIndex == 0 ? btnBgColor : majorColor,
                    width: _pageIndex == 0 ? 1 : 2),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0)),
            onPressed: () {
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut);
            },
            child: Center(
                child: Text('All list',
                    style: _pageIndex == 0 ? plateText : txt20)),
          ),
        ),
      ]),
      Expanded(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (value) {
            print('pageIndex=$value');
            _pageIndex = value;
            setState(() {});
          },
          children: [
            SwipeCards(items),
            ListDCards(),
            // Center(
            //     child: Text('All cards list', style: TextStyle(fontSize: 40)))
          ],
        ),
      )
    ]);
  }
}
