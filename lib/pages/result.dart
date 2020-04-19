import 'package:calculator/components/button_bottom.dart';
import 'package:calculator/components/reusableCard.dart';
import 'package:calculator/constant.dart';
import 'package:calculator/pages/input_page.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  String calculate, result, feedback;
  Result({this.calculate, this.result, this.feedback});
  @override
  _ResultState createState() =>
      _ResultState(calculate: calculate, result: result, feedback: feedback);
}

class _ResultState extends State<Result> {
  String result, feedback, calculate;

  _ResultState({this.calculate, this.result, this.feedback});
  void back() {
    if (Navigator.of(context).canPop()) {
      Navigator.canPop(context);
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => InputPage()),
            (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Your Result',
                  style: kNumberStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              padding: EdgeInsets.only(top: 40.0),
              color: kActiveColor,
              childCard: Column(
                children: <Widget>[
                  Text(
                    result,
                    style: kTextTitleStyle,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    calculate,
                    style: kTextResultStyle,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
                    child: Text(
                      feedback,
                      textAlign: TextAlign.center,
                      style: kFeedBackStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ButtonBottom(
              name: 'RE-CALCULATE',
              padding: EdgeInsets.only(
                top: 18.0,
              ),
              onTap: () {
                back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
