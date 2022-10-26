import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageAddDCard extends StatefulWidget {
  @override
  State<PageAddDCard> createState() => _PageAddDCard();
}

class _PageAddDCard extends State<PageAddDCard> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    String _newTag = '';
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

    final TextStyle txt30 = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 30 * heightRatio,
        fontWeight: FontWeight.w300);

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Column(children: [
          SizedBox(height: 20 * heightRatio),
          Stack(children: [
            Row(children: [
              SizedBox(width: 20 * heightRatio),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/button_faces/Close page icon.png',
                    height: 20 * heightRatio),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text('', //'Add Discount Card',
                    textAlign: TextAlign.center,
                    style: txt24),
              ),
            ),
          ]),
          Padding(
            padding:
                EdgeInsets.only(left: 20 * widthRatio, right: 20 * widthRatio),
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
                    _newTag = value;
                    print('$_newTag ');
                    setState(() {});
                  },
                  onSubmitted: (value) {
                    _newTag = '';
                    setState(() {
                      _textController.clear();
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10 * heightRatio),
                    hintText:
                        'Add a tag to your card like groceries, name, city',
                    //alignLabelWithHint: true,
                    hintStyle: txt15,

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
          SizedBox(height: 10 * heightRatio),
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Tag('groceries', heightRatio),
              Tag('Tesco', heightRatio),
              Tag('Athens', heightRatio),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tag('wine', heightRatio),
                Tag('Kerkya street', heightRatio),
              ],
            )
          ]),
          Padding(
            padding: EdgeInsets.only(
                top: 10 * heightRatio, bottom: 10 * heightRatio),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(136, 196, 196, 196),
                    offset: Offset.fromDirection(1.5, 5),
                    blurRadius: 3,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              height: deviceHeight * 0.25,
              width: deviceWidth * 0.9,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/button_faces/Photo icon.svg',
                    height: deviceHeight * 0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10 * heightRatio),
                    child: Text('Tap to scan front', style: txt15),
                  ),
                ],
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10 * heightRatio, bottom: 10 * heightRatio),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(136, 196, 196, 196),
                    offset: Offset.fromDirection(1.5, 5),
                    blurRadius: 3,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              height: deviceHeight * 0.25,
              width: deviceWidth * 0.9,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/button_faces/Photo icon.svg',
                    height: deviceHeight * 0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10 * heightRatio),
                    child: Text('Tap to scan back', style: txt15),
                  ),
                ],
              )),
            ),
          ),
          SizedBox(height: 20 * heightRatio),
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              print(' add pressed');
              Navigator.pop(context);
            },
            child: Column(children: [
              SvgPicture.asset('assets/button_faces/Save icon.svg',
                  height: 40 * heightRatio),
              Text('Save', style: txt30)
            ]),
          ),
        ])));
  }

  Widget Tag(String title, double heightRatio) {
    return SizedBox(
      height: 35 * heightRatio,
      child: TextButton(
          onPressed: () {
            print('$title pressed');
          },
          child: Row(children: [
            Image.asset('assets/button_faces/Close page icon.png',
                height: 15 * heightRatio),
            Text('  $title',
                style: TextStyle(
                    fontFamily: 'Inter-regular',
                    color: btnBgColor,
                    fontSize: 14 * heightRatio,
                    fontWeight: FontWeight.w400))
          ])),
    );
  }
}
