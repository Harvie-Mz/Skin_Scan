import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skindeseasedetection/GetImage/GetImageFromCamera.dart';
import 'package:skindeseasedetection/GetImage/GetImageFromGallary.dart';

// final GetImageFromGallery g = GetImageFromGallery();

   
class Imagefile extends StatelessWidget {
  // const Imagefile({super.key});
  Uint8List? imageFile;
    bool imageAvailable = false;
    File? pImage;

String str = '';
  @override
  Widget build(BuildContext context) {

    var ic = Provider.of<GetImageFromCamera>(context);
    var ig = Provider.of<GetImageFromGallery>(context);
  


     if (ig.imageAvailable == true) {
     imageAvailable = ig.imageAvailable;
     imageFile = ig.imageFile;
     pImage=ic.pImage;
     ig.imageAvailable= false; 
    }else {  
      imageAvailable = ic.imageAvailable;
      imageFile = ic.imageFile;
      pImage = ig.pImage;
      ic.imageAvailable=false;
      }

    return Container(
      height: 120,
      width: 120,
      color: Color.fromARGB(255, 247, 247, 247),
      child: imageAvailable ? Image.memory(imageFile!) : const SizedBox(),
    );
  }
}