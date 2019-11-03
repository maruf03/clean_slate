import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_slate/ui/home_page.dart';
import 'package:clean_slate/utils/theme.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  Future<Timer> _start() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return HomePage(pageIndex: 0,);
        },
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _start();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png", scale: 2.5,),
      ),
      backgroundColor: themeColor,
    );
  }
}