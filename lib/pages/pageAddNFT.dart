import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/constants.dart';

class PageAddNFT extends StatefulWidget {
  @override
  State<PageAddNFT> createState() => _PageAddNFT_State();
}

class _PageAddNFT_State extends State<PageAddNFT> {
  String _provHash = '';
  bool isNFTfound = false;

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

    final TextStyle txt15mj = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 18 * heightRatio,
        fontWeight: FontWeight.w400);

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Column(children: [
          SizedBox(height: 20 * heightRatio),
          Stack(children: [
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text('Add NFT to library',
                    textAlign: TextAlign.center, style: txt24),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.all(20 * heightRatio),
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
                  style: txt15mj,
                  onSubmitted: (value) {
                    _provHash = value;
                    if (value == 'split') {
                      isNFTfound = true;
                      print('show Charlie = $isNFTfound');
                      setState(() {
                        isNFTfound = true;
                      });
                    } else {
                      //isNFTfound = false;
                      print('unknown hash');
                      //  ScaffoldMessenger.of(context).showSnackbar(SnackBar(content: Text('No NFT found with provenance hash submitted. Try another hash.'))),
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'No NFT found with provenance hash submitted. Try another hash.')));
                      if (isNFTfound == true) {
                        isNFTfound = false;
                        setState(() {
                          isNFTfound = false;
                        });
                      }
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10 * heightRatio),
                    hintText: 'Paste provenance hash here // type "split"',
                    hintStyle: txt15,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    //errorBorder: InputBorder.none,
                    //focusedErrorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  )),
            ),
          ),
          isNFTfound
              ? NFTItem(context, heightRatio, deviceWidth, 3)
              : SizedBox(),
        ])));
  }

  Widget NFTItem(
      BuildContext context, double heightRatio, double deviceWidth, int index) {
    final TextStyle plateText = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
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

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: 20 * heightRatio,
                right: 20 * heightRatio,
                bottom: 12 * heightRatio),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    right: 5 * heightRatio, left: 5 * heightRatio),
                //minimumSize: Size.fromHeight(100),
                primary: containerColor,
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10 * heightRatio),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(NFTAssets[index].path,
                          width: 0.39 * deviceWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              NFTAssets[index].title,
                              style: plateText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              //softWrap: false,
                            ),
                            Text('Aquired ${NFTAssets[index].acquired}',
                                style: style15),
                            SizedBox(child: Text('', style: style15)),
                            Text(
                                '${NFTAssets[index].amount} ${NFTAssets[index].currencyName}',
                                style: plateText),
                            Text(
                                '€${NumberFormat.currency(locale: "eu", symbol: '').format(NFTAssets[index].inUSD)}',
                                style: style15),
                            SizedBox(height: 10 * heightRatio),
                            Text('Provenance hash', style: plateText),
                            SizedBox(
                              width: deviceWidth / 2.5,
                              child: Text(
                                  'f056aca1a9bd62f1e5ca1a9bd62f1e5a37fa7edfbc7952',
                                  style: style10,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.visible),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10 * heightRatio),
                ],
              ),
            )),
        SizedBox(height: 30 * heightRatio),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            print('${NFTAssets[index].title} add pressed');
            Navigator.pop(context);
          },
          child: Column(children: [
            Image.asset('assets/button_faces/Buy icon.png',
                height: 40 * heightRatio),
            Text('Add to library', style: style30)
          ]),
        ),
      ],
    );
  }
}
