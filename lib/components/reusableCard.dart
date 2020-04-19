import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color color;
  final EdgeInsets padding;
  final Widget childCard;
  final Function onTap;
  ReusableCard({@required this.color,this.padding, this.childCard, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(16.0),
        color: color,
        padding: padding,
        child: childCard,
      ),
    );
  }
}
