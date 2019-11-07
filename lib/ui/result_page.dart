import 'package:clean_slate/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:clean_slate/utils/theme.dart' as CustomTheme;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultPage extends StatefulWidget {
  final int pageIndex;
  final List<Map<String, dynamic>> result;

  ResultPage({this.result, this.pageIndex});
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 64,
                child: Text("Result", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'MontserratAlternates-Bold', color: CustomTheme.themeColor, fontSize: 36),),
              ),
              Positioned(
                top: 110,
                child: CircularPercentIndicator(
                  radius: 100.0,
                  animation: true,
                  animationDuration: 1200,
                  percent: double.parse(widget.result[0]['confidence'].toString()),
                  backgroundColor: CustomTheme.themeColor.shade300,
                  progressColor: CustomTheme.themeColor.shade700,
                  center: Text("${double.parse(widget.result[0]['confidence'].toString())*100}", style: TextStyle(fontFamily: 'MontserratAlternates-Bold', color: CustomTheme.themeColor, fontSize: 18)),
                  footer: Text("${widget.result[0]['label']}", style: TextStyle(fontFamily: 'MontserratAlternates-Bold', color: CustomTheme.themeColor, fontSize: 18)),
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
                      child: Text("Run another Test", style: TextStyle(fontFamily: 'MontserratAlternates-Regular', color: Colors.white, fontSize: 18),),
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context){
                            return HomePage(pageIndex: 0,);
                          },
                        ));
                      },
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