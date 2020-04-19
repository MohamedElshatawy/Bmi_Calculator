import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final IconData icon ;
  final Function onPressed;


  RoundButton({@required this.icon,@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 40.0,
        width: 40.0,
      ),
      shape: CircleBorder(),
      fillColor:  Color(0xFF4C4F5E),
    );
  }
}
