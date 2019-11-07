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
  Future<List<Map<String, dynamic>>> _result;

  _getResult() {
    _result = checkImage(model: widget.models[widget.model], image: widget.symptomImage);
    _result.then((value){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context){
          return ResultPage(result: value, pageIndex: 2,);
        },
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getResult();
    super.initState();
  }
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
  }
}