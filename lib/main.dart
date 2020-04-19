import 'package:flutter/material.dart';
import 'package:calculator/pages/input_page.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff090C22),
        scaffoldBackgroundColor: Color(0xff090C22),
      ),
      home: InputPage(),
    );
  }
}
