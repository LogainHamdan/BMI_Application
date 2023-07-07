import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({this.onTap, this.CalculateText});

  final Function onTap;
  final String CalculateText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            CalculateText,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
