import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/constant.dart';
class ButtonBottom extends StatelessWidget {
  final String name;
  final Function onTap;
  final EdgeInsets padding;
  ButtonBottom({@required this.name, @required this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        color: Colors.pink,
        child: Text(name,style: kButtonStyle,textAlign: TextAlign.center,),
      ),
    );
  }
}
