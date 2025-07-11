import 'package:flutter/material.dart';
import 'package:clean_slate/ui/splash_page.dart';
import 'package:clean_slate/utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Slate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeColor,
      ),
      home: SplashPage(),
    );
  }
}

