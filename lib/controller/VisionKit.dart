import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';

// TODO: update string according to model name
const String _xray = "";
const String _oct = "";
String _model;

/// This is function is called with the model
/// name i.e: xray or oct to determine which
/// kind of model is intended to run on the
/// image.
/// It throws Null exception if model or
/// image is null.
Future<List> checkImage({
  @required String model,
  @required File image,
  }) async {
  if(model == null || image == null)
    throw NullThrownError();

  // model is stored if recognize function needs
  // it in future.
  _model = model;

  // Close previous Tflite model
  if (Tflite != null) {
    Tflite.close();
  }

  try {
    String res;
    switch (_model) {
      case _xray:
        res = await Tflite.loadModel(
          // TODO: update model and label text names
          model: "",
          labels: "",
        );
        break;
      case _oct:
        res = await Tflite.loadModel(
          // TODO: update model and label text names
          model: "",
          labels: "",
        );
        break;
      default:
        break;
    }
    print(res);
  } on PlatformException {
    print('Failed to load models');
  }
  return _recognizeImage(image);
}

/// Model is run on an image and returns the
/// result list from the function.
/// It is currently set to return one result.
Future<List> _recognizeImage(File image) async {
  List recognition = await Tflite.runModelOnImage(
    path: image.path,
    numResults: 1,
  );
  return recognition;
}