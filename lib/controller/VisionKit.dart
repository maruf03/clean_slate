import 'dart:io';

import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';

// TODO: update string according to model name
const String _xray = "xray";
const String _oct = "oct";
String _model;

/// This is function is called with the model
/// name i.e: xray or oct to determine which
/// kind of model is intended to run on the
/// image.
/// It throws Null exception if model or
/// image is null.

Future sleep1(int time) {
  return new Future.delayed(Duration(seconds: time), () => "1");
}

 Future<List<Map<String, dynamic>>> checkImage({
  @required String model,
  @required File image,
  }) async {
  Tflite.close();
  if(model == null || image == null)
    throw NullThrownError();

  // model is stored if recognize function needs
  // it in future.
  _model = model;

  // DEMO START
//    await sleep1(4);
//    if(model == _xray)
//      return [{
//        'index': 1,
//        'label': "pneumania",
//        'confidence': 0.879,
//      }];
//    else if(model == _oct)
//      return [{
//        'index': 0,
//        'label': "normal",
//        'confidence': 0.629,
//      }];
//    else
//      return null;
    // DEMO END

  // Close previous Tflite model

  try {
    String res;
    switch (_model) {
      case _xray:
        {
          print('xray load entered');
          res = await Tflite.loadModel(
            // TODO: update model and label text names
            model: "assets/models/xray_pneumonia.tflite",
            labels: "assets/models/xray_pneumonia.txt",
          );
          print('xray load exited');
        }
        break;
      case _oct:
        {
          res = await Tflite.loadModel(
            // TODO: update model and label text names
            model: "",
            labels: "",
          );
        }
        break;
    }
    print(res);
  } on PlatformException {
    print('Failed to load models');
  }
  var val = await _recognizeImage(image);
  List<Map<String, dynamic>> mapList = [];
  val.forEach((f){
    mapList.add(Map<String, dynamic>.from(f));
  });
  print(mapList);
  return mapList;
}

/// Model is run on an image and returns the
/// result list from the function.
/// It is currently set to return one result.
Future<List<dynamic>> _recognizeImage(File image) async {
  List recognition = await Tflite.runModelOnImage(
    path: image.path,
    numResults: 1,
  );
  print(recognition);
  return recognition;
}