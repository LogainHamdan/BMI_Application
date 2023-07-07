import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/components/CalculateButton.dart';
import 'package:flutter_bmi_calculator/components/SingleIcon.dart';
import 'package:flutter_bmi_calculator/components/SingleCard.dart';
import 'package:flutter_bmi_calculator/components/ActionOnButton.dart';
import 'package:flutter_bmi_calculator/constants.dart';
import 'package:flutter_bmi_calculator/utils/BmiCalculation.dart';
import 'Screen_2.dart';

enum Gender {
  //متغير بيرجع اوبشنز
  male,
  female,
}

class Screen_1 extends StatefulWidget {
  @override
  Screen_1_State createState() => Screen_1_State();
}

class Screen_1_State extends State<Screen_1> {
  Gender UserGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, //stretched to occupy the full extent of the cross axis of the layout container.
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: SingleCard(
                  onPress: () {
                    setState(() {
                      UserGender = Gender.male;
                    });
                  },
                  color: UserGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: SingleIcon(
                    icon: Icons.male,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: SingleCard(
                  onPress: () {
                    setState(() {
                      UserGender = Gender.female;
                    });
                  },
                  color: UserGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: SingleIcon(
                    icon: Icons.female,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: SingleCard(
              color: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SingleCard(
                    color: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ActionOnButton(
                                icon: Icons.exposure_minus_1,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            ActionOnButton(
                              icon: Icons.plus_one,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleCard(
                    color: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ActionOnButton(
                              icon: Icons.exposure_minus_1,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ActionOnButton(
                                icon: Icons.plus_one,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            CalculateText: 'CALCULATE',
            onTap: () {
              BmiCalculation calc =
                  BmiCalculation(height: height, weight: weight);

              Navigator.push(
                context, //ثابتة
                MaterialPageRoute(
                  builder: (context) => Screen_2(
                    ResultNum: calc.calculate(),
                    ResultText: calc.getResult(),
                    message: calc.getMessage(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
