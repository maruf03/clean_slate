import 'dart:io';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:clean_slate/utils/theme.dart' as CustomTheme;
import 'package:clean_slate/ui/loading_page.dart';

class SelectionPage extends StatefulWidget {
  final int pageIndex;
  final File symptomImage;

  SelectionPage({Key key, @required this.pageIndex, @required this.symptomImage}) : super(key: key);
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool modelOne = true;
  bool modelTwo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 64,
              child: Text("Running Test", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'MontserratAlternates-Bold', color: CustomTheme.themeColor, fontSize: 36),),
            ),
            Align(
              //top: 100,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: modelOne ? Icon(Icons.check_circle, color: CustomTheme.themeColor,) : Icon(Icons.check_circle_outline, color: CustomTheme.themeColor,),
                          onPressed: () {
                            setState(() {
                              if(modelOne){
                                modelOne = false;
                                modelTwo = true;
                              }
                              else {
                                modelOne = true;
                                modelTwo = false;
                              }
                            });
                          },
                        ),
                        Text("X-ray", style: TextStyle(fontFamily: 'MontserratAlternates-Regular', color: CustomTheme.themeColor, fontSize: 24),),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: modelTwo ? Icon(Icons.check_circle, color: CustomTheme.themeColor,) : Icon(Icons.check_circle_outline, color: CustomTheme.themeColor,),
                          onPressed: () {
                            setState(() {
                              if(modelTwo){
                                modelOne = true;
                                modelTwo = false;
                              }
                              else {
                                modelOne = false;
                                modelTwo = true;
                              }
                            });
                          },
                        ),
                        Text("OCT scan", style: TextStyle(fontFamily: 'MontserratAlternates-Regular', color: CustomTheme.themeColor, fontSize: 24),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: <Widget>[
                  DotsIndicator(
                    dotsCount: 3,
                    position: widget.pageIndex.toDouble(),
                    decorator: DotsDecorator(
                      color: Colors.black12,
                      activeColor: CustomTheme.themeColor.shade900,
                      size: Size.fromRadius(8.0),
                      activeSize: Size.fromRadius(8.0),
                    ),
                  ),
                  RaisedButton(
                    color: CustomTheme.themeColor,
                    disabledColor: CustomTheme.themeColor.shade400,
                    padding: EdgeInsets.only(left: 32.0, right: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: CustomTheme.themeColor),
                    ),
                    child: Text("Run Test", style: TextStyle(fontFamily: 'MontserratAlternates-Regular', color: Colors.white, fontSize: 18),),
                    onPressed: (modelOne || modelTwo) ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            var page = (modelOne) ? LoadingPage(symptomImage: widget.symptomImage, model: 1) : LoadingPage(symptomImage: widget.symptomImage, model: 2);
                            return page;
                          },
                        ),
                      );
                    } : null,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}