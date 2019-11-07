import 'package:clean_slate/ui/selection_page.dart';
import 'package:clean_slate/utils/theme.dart' as CustomTheme;
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  final int pageIndex;
  HomePage({Key key, this.title, @required this.pageIndex}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  Widget _getImageStack() {
    return Stack(

      alignment: Alignment.center,
      children: <Widget>[
        Image.file(_image, height: 512, width: 256,),
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Align(
            alignment: Alignment.bottomCenter,
//            bottom: 16,
            child: _getImage(),
          ),
        ),
      ],
    );
  }
  Widget _getImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          padding: EdgeInsets.all(0.0),
          icon: Icon(Icons.camera_alt, color: Colors.white, size: 64, ),
          onPressed: () async {
            var image = await ImagePicker.pickImage(source: ImageSource.camera);
            setState(() {
              _image = image;
            });
          },
        ),
//        SizedBox(width: 56),
        IconButton(
          padding: EdgeInsets.all(0.0),
          icon: Icon(Icons.image, color: Colors.white, size: 64,),
          onPressed: () async {
            var image = await ImagePicker.pickImage(source: ImageSource.gallery);
            setState(() {
              _image = image;
            });
          },
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 64,
              child: Text("Add Image", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'MontserratAlternates-Bold',color: CustomTheme.themeColor, fontSize: 36),),
            ),
            Positioned(
              top: 110,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 320,
                    width: 256,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: CustomTheme.themeColor,
                        shape: BoxShape.rectangle,

                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Center(
                        child: _image == null ? _getImage() : _getImageStack(),
                      ), //Image.file(_image, height: 512, width: 256,)
                    ),
                  ),
                ],
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

                      side: BorderSide(color: CustomTheme.themeColor,),
                    ),
                    child: Text("Proceed", style: TextStyle(fontFamily: 'MontserratAlternates-Regular', color: Colors.white, fontSize: 18),),
                    onPressed: _image != null ? () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) {
                                return SelectionPage(pageIndex: 1, symptomImage: _image,);
                              }
                          )
                      );
                    } : null,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}



