import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageController {
  static final ImageController instance = ImageController._();

  ImageController._();

  Future<ImageProvider> getImage({ImageSource source, int maxWidth, int maxHeight}) async {
    var image = await ImagePicker.pickImage(source: source);
    if(image != null) {
      var u8list = await _compressFile(file: image, maxHeight: maxHeight, maxWidth: maxWidth);
      var provider = MemoryImage(Uint8List.fromList(u8list));
      return provider;
    }
    else {
      return Future<Null>.value();
    }
  }

  Future<List<int>> _compressFile({File file, int maxWidth, int maxHeight}) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: maxWidth,
      minHeight: maxHeight,
    );
    return Uint8List.fromList(result);
  }
}