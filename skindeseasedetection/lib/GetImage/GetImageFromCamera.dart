// library camera;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';




class GetImageFromCamera extends ChangeNotifier{
var globalVar = "Educative";
Uint8List? imageFile;
  bool imageAvailable = false;
  File? pImage; 
getImageFromCamera() async {
  final image = await ImagePicker().pickImage(source: ImageSource.camera);
  pImage = File(image!.path);
  imageFile = pImage!.readAsBytesSync();
  imageAvailable = true;
  print(imageAvailable);
  notifyListeners();
}
}

// class GetImageFromGallery extends ChangeNotifier {
//   // var globalVar = "Educative";
//   // Uint8List? imageFile;
//   // bool imageAvailable = false;
//   // File? pImage;
//   getImageFromGallery() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     pImage = File(image!.path);
//     imageFile = pImage!.readAsBytesSync();
//     imageAvailable = true;
//     print(imageAvailable);
//     notifyListeners();
//   }
// }

