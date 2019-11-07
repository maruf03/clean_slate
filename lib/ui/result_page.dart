import 'package:flutter/material.dart';
import 'package:clean_slate/utils/theme.dart' as CustomTheme;

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Text("Data Here"),
      backgroundColor: CustomTheme.themeColor,
    );
  }
}