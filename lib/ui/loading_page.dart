import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clean_slate/utils/theme.dart' as CustomTheme;
import 'package:clean_slate/controller/VisionKit.dart';
import 'package:clean_slate/ui/result_page.dart';

class LoadingPage extends StatefulWidget {
  final File symptomImage;
  final int model;
  final List<String> models = ["xray", "oct"];

  LoadingPage({Key key, @required this.symptomImage, @required this.model}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

//  Future<List<dynamic>> _getResult() async {
//    var result = await checkImage(model: widget.models[widget.model], image: widget.symptomImage);
//    return result;
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: Center(
                child: SpinKitWanderingCubes(
                  color: Colors.white30,
                  size: 75.0,
                  duration: Duration(milliseconds: 1800),
                ),
              ),
              backgroundColor: CustomTheme.themeColor,
            );
//    return FutureBuilder<List>(
//      future: _getResult(),
//      builder: (context, snapshot) {
//        switch(snapshot.connectionState) {
//          case ConnectionState.none:
//          case ConnectionState.active:
//          case ConnectionState.waiting:
//            return Scaffold(
//              body: Center(
//                child: SpinKitWanderingCubes(
//                  color: Colors.white30,
//                  size: 75.0,
//                  duration: Duration(milliseconds: 1800),
//                ),
//              ),
//              backgroundColor: CustomTheme.themeColor,
//            );
//          case ConnectionState.done:
//            if(snapshot.hasError) {
//              return Scaffold(
//                body: Center(
//                  child: Text("There has been an internal error.", style: TextStyle(color: Colors.red),),
//                ),
//                backgroundColor: CustomTheme.themeColor,
//              );
//            } else {
//              return ResultPage();
//            }
//        }
//      },
//    );
  }
}