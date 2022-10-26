import 'package:flutter/material.dart';

Widget logoBox(BuildContext context) {
  final double deviceWidth = MediaQuery.of(context).size.width;
  final double deviceHeight = MediaQuery.of(context).size.height;

  return Container(
    //height: 60,
    width: .6 * deviceWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: .2 * deviceWidth,
            width: .2 * deviceWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(255, 205, 0, 212), Colors.blue],
                )),
            child: Center(
                child: const Text(
              'logo',
              style: TextStyle(color: Colors.white),
            ))),
        SizedBox(
          width: .05 * deviceWidth,
        ),
        const Flexible(
          fit: FlexFit.loose,
          child: Text(
            textAlign: TextAlign.center,
            'Welcome to MetaBank',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
