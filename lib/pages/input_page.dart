import 'package:calculator/components/button_bottom.dart';
import 'package:calculator/components/iconcontent.dart';
import 'package:calculator/components/reusableCard.dart';
import 'package:calculator/components/round_button.dart';
import 'package:calculator/pages/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/calculateFunction.dart';

enum Gander { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gander select;
  int height = 180;
  int weight = 70;
  int age = 23;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        select = Gander.male;
                      });
                    },
                    padding: EdgeInsets.only(top: 10.0),
                    color:
                        select == Gander.male ? kActiveColor : kInActiveColor,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.mars,
                      name: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        select = Gander.female;
                      });
                    },
                    padding: EdgeInsets.only(top: 10.0),
                    color:
                        select == Gander.female ? kActiveColor : kInActiveColor,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.venus,
                      name: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              padding: EdgeInsets.only(top: 10.0),
              color: kActiveColor,
              childCard: Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xfd2E3041),
                      thumbColor: Colors.pink,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayColor: Color(0xff311330),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 150,
                      max: 220,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    padding: EdgeInsets.only(top: 10.0),
                    color: kActiveColor,
                    childCard: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RoundButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ),
                            Expanded(
                              child: RoundButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    padding: EdgeInsets.only(top: 10.0),
                    color: kActiveColor,
                    childCard: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RoundButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ),
                            Expanded(
                              child: RoundButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ButtonBottom(
              onTap: () {
                BmiCalculate calculate =
                    BmiCalculate(height: height, weight: weight);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            calculate: calculate.bmiCalculateResult(),
                            result: calculate.result(),
                            feedback: calculate.feedback(),
                          )),
                  (Route<dynamic> route) => false,
                );
              },
              name: 'CALCULATE',
              padding: EdgeInsets.only(
                top: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
