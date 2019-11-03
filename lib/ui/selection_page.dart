import 'dart:io';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  final int pageIndex;
  final File symptomImage;

  SelectionPage({Key key, @required this.pageIndex, @required this.symptomImage}) : super(key: key);
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}