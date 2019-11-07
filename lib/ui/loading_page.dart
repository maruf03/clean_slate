import 'dart:io';

import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  final File symptomImage;
  final int model;

  LoadingPage({Key key, @required this.symptomImage, @required this.model}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.symptomImage.path),
    );
  }
}