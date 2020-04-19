import 'package:flutter/material.dart';
import 'package:calculator/constant.dart';
class IconContent extends StatelessWidget {
  final IconData icon;
  final String name;


  IconContent({@required this.icon, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 40.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(name,style: kTextStyle,),
      ],
    );
  }
}
