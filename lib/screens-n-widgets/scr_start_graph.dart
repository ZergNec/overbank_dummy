import 'package:flutter/material.dart';

Widget scr_start_graph(
    BuildContext context, double heightRatio, double widthRatio) {
  final TextStyle textSetting = TextStyle(
      fontFamily: 'Inter-regular',
      color: Color(0xFF25706E),
      fontSize: 12 * heightRatio);

  return Container(
    height: 80 * heightRatio,
    child: Column(
      children: [
        Image.asset(
          'assets/button_faces/start_page_graph.png',
          height: 50 * heightRatio,
        ),
        SizedBox(height: 13 * heightRatio),
        Row(
          children: [
            SizedBox(width: 35 * widthRatio),
            Expanded(
                child: Image.asset(
                    'assets/button_faces/start_page_graph_line.png',
                    fit: BoxFit.cover)),
            SizedBox(width: 35 * widthRatio),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text('JAN', style: textSetting),
          Text('FEB', style: textSetting),
          Text('MAR', style: textSetting),
          Text('APR', style: textSetting),
          Text('MAY', style: textSetting),
          Text('JUN', style: textSetting),
        ])
      ],
    ),
  );
}
