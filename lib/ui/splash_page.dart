import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clean_slate/ui/home_page.dart';

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
          return HomePage();
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
        child: Text("Icon Here"),
      ),
      backgroundColor: Colors.green,
    );
  }
}