import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens-n-widgets/scr_start_graph.dart';

class ToggleButtons3 extends StatefulWidget {
  @override
  _ToggleButtons3State createState() => _ToggleButtons3State();
}

class _ToggleButtons3State extends State<ToggleButtons3> {
  List<bool> isSelected = [true, false, false, false, false];
  List<String> periods = ['All', 'Day', 'Week', 'Month', 'Year'];
  int _selected = 0;

  Widget dropDownResut(String value, double heightRatio) {
    String percentage = '25%';
    Color arrowColor = increaseColor;
    IconData arrowType = Icons.arrow_drop_up_sharp;

    switch (value) {
      case 'All':
        percentage = '25%';
        arrowColor = increaseColor;
        arrowType = Icons.arrow_drop_up_sharp;
        break;
      case 'Year':
        percentage = '7%';
        arrowColor = increaseColor;
        arrowType = Icons.arrow_drop_up_sharp;
        break;
      case 'Month':
        percentage = '-7%';
        arrowColor = negativeAmount;
        arrowType = Icons.arrow_drop_down_sharp;
        break;
      case 'Week':
        percentage = '47%';
        arrowColor = increaseColor;
        arrowType = Icons.arrow_drop_up_sharp;
        break;
      case 'Day':
        percentage = '47%';
        arrowColor = increaseColor;
        arrowType = Icons.arrow_drop_up_sharp;
        break;
    }

    return Row(
      children: [
        Text(percentage,
            style: TextStyle(
                fontFamily: 'Inter-regular',
                color: arrowColor,
                fontSize: 20 * heightRatio,
                fontWeight: FontWeight.w400)),
        Icon(arrowType, color: arrowColor, size: 25 * heightRatio),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double heightRatio = MediaQuery.of(context).size.height / 926;
    final double widthRatio = MediaQuery.of(context).size.width / 428;

    final TextStyle txtInactive = TextStyle(
        fontFamily: 'Inter-regular',
        fontSize: 14 * heightRatio,
        fontWeight: FontWeight.w400);

    final TextStyle txtActive = TextStyle(
        fontFamily: 'Inter-regular',
        color: majorColor,
        fontSize: 14 * heightRatio,
        fontWeight: FontWeight.w500);

    return Column(
      children: [
        SizedBox(
          height: 40 * heightRatio,
          child: ToggleButtons(
            textStyle: txtInactive,
            isSelected: isSelected,
            constraints: BoxConstraints.expand(
                height: 30 * heightRatio,
                width:
                    (MediaQuery.of(context).size.width - 40 * heightRatio) / 5),
            fillColor: bgColor,
            selectedColor: majorColor,
            color: btnBgColor,
            // borderRadius: BorderRadius.circular(8),
            borderWidth: 0,
            renderBorder: false,

            children: [
              tgSingleButton(context, widthRatio, heightRatio, 'All',
                  _selected == 0, txtActive, txtInactive),
              tgSingleButton(context, widthRatio, heightRatio, 'Day',
                  _selected == 1, txtActive, txtInactive),
              tgSingleButton(context, widthRatio, heightRatio, 'Week',
                  _selected == 2, txtActive, txtInactive),
              tgSingleButton(context, widthRatio, heightRatio, 'Month',
                  _selected == 3, txtActive, txtInactive),
              tgSingleButton(context, widthRatio, heightRatio, 'Year',
                  _selected == 4, txtActive, txtInactive),
            ],
            onPressed: (int newIndex) {
              setState(() {
                _selected = newIndex;
                for (int index = 0; index < isSelected.length; index++) {
                  if (index == newIndex) {
                    isSelected[index] = true;
                  } else {
                    isSelected[index] = false;
                  }
                }
              });
            },
          ),
        ),
        Stack(
          children: [
            scr_start_graph(context, heightRatio, widthRatio),
            Padding(
                padding: EdgeInsets.only(left: 30 * heightRatio),
                child: dropDownResut(periods[_selected], heightRatio))
          ],
        )
      ],
    );
  }

  Widget tgSingleButton(
      BuildContext context,
      double widthRatio,
      double heightRatio,
      String label,
      bool active,
      TextStyle txtActive,
      TextStyle txtInactive) {
    return Container(
        width: 60 * widthRatio,
        height: 40 * heightRatio,
        decoration: BoxDecoration(
            border: active
                ? Border.all(color: majorColor, width: 2)
                : Border.all(color: btnBgColor),
            borderRadius: BorderRadius.circular(4),
            color: containerColor),
        child: Center(
            child: Text(label,
                textAlign: TextAlign.center,
                style: active ? txtActive : txtInactive)));
  }
}
