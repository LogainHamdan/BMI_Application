import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/components/SingleCard.dart';
import 'package:flutter_bmi_calculator/components/CalculateButton.dart';
import 'package:flutter_bmi_calculator/constants.dart';

class Screen_2 extends StatelessWidget {
  Screen_2({this.message, this.ResultNum, this.ResultText});

  final String ResultNum;
  final String ResultText;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleCard(
              color: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ResultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    ResultNum,
                    style: kBMITextStyle,
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            CalculateText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
