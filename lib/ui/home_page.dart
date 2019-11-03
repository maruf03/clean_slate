import 'package:clean_slate/ui/selection_page.dart';
import 'package:clean_slate/utils/theme.dart' as CustomTheme;
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dotted_border/dotted_border.dart';
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
  bool _isImageLoaded = false;
  
  Widget _getImage() {
    return IconButton(
      icon: Icon(Icons.add, color: CustomTheme.themeColor,),
      onPressed: () async {
        var image = await ImagePicker.pickImage(source: ImageSource.gallery);
        setState(() {
          _image = image;
          _isImageLoaded = true;
        });
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: CustomTheme.themeColor);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Sample Collection", textAlign: TextAlign.center, style: textStyle,),
            DottedBorder(
              borderType: BorderType.RRect,
              color: CustomTheme.themeColor,
              radius: Radius.circular(16),
              padding: EdgeInsets.all(6),
              child: Center(
                child: (_image == null) ? _getImage() : Image.file(_image),
              ),
            ),
            Text("Please add specific picture of your symptom", textAlign: TextAlign.center, style: textStyle, ),
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
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: CustomTheme.themeColor),
              ),
              child: Text("Proceed"),
              onPressed: _isImageLoaded ? () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) {
                          return SelectionPage(pageIndex: 1, symptomImage: _image,);
                        }
                    )
                );
              } : null,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}



