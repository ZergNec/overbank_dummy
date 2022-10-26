import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/constants.dart';

class PageNFT extends StatefulWidget {
  @override
  State<PageNFT> createState() => _PageNFT_State();
}

class _PageNFT_State extends State<PageNFT> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double heightRatio = deviceHeight / 926;
    final double widthRatio = deviceWidth / 428;

    final TextStyle txt20 = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 20 * heightRatio,
        fontWeight: FontWeight.w400);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Your NFT\'s total', style: txt20),
        Text('€94.750,91',
            style: TextStyle(
                fontFamily: 'Inter-regular',
                color: majorColor,
                fontSize: 40 * heightRatio,
                fontWeight: FontWeight.w400)),
        //  SizedBox(height: 10 * heightRatio),
        Row(
          children: [
            SizedBox(width: 20 * heightRatio),
            TextButton(
              // style: TextButton.styleFrom(
              //     padding:
              //         EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0)),
              onPressed: () {
                print('Add new NFT pressed');
                Navigator.pushNamed(context, '/addNFT');
              },
              child: Row(children: [
                Text('Add new', style: txt20),
                SizedBox(width: 10 * heightRatio),
                Image.asset('assets/button_faces/Add new icon.png',
                    height: 30 * heightRatio, width: 30 * heightRatio)
              ]),
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
          itemCount: NFTAssets.length - 1,
          itemBuilder: (BuildContext context, int index) {
            //return Text(index.toString(), style: plateText);
            return NFTItem(context, heightRatio, deviceWidth, index);
          },
        )),
      ],
    );
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

    return Padding(
        padding: EdgeInsets.only(
            left: 20 * heightRatio,
            right: 20 * heightRatio,
            bottom: 12 * heightRatio),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding:
                EdgeInsets.only(right: 5 * heightRatio, left: 5 * heightRatio),
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
                  Image.asset(NFTAssets[index].path, width: 0.39 * deviceWidth),
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
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            print('${NFTAssets[index].title} Sell pressed');
                          },
                          child: Column(children: [
                            Image.asset('assets/button_faces/Withdraw icon.png',
                                height: 30 * heightRatio,
                                width: 30 * heightRatio),
                            Text('Sell', style: plateText)
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10 * heightRatio),
            ],
          ),
        ));
  }
}
