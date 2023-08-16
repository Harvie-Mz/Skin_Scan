import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skindeseasedetection/GetImage/imagefileWidgit.dart';

final Imagefile Im = Imagefile() ; 
// var s = Im.pImage;
class postmage extends ChangeNotifier {
  // const postimage({super.key});

  var URL = 'http://YourIPv4address:443/';
  bool IsPressed = false;
  String output = '';

  postImage(File image) async {
    // String base64Image = base64Encode(image!);
    String base64Image = base64Encode(image.readAsBytesSync());
    var rawData = Uri.parse(URL);
    final response = await http.post(
      rawData,
      body: jsonEncode(
        {
          'image': base64Image,
        },
      ),
      headers: {'Content-Type': "application/json"},
    );
    print('Image StatusCode : ${response.statusCode}');
    print(response.statusCode);
// get code
    http.Response responseGet = await http.get(rawData);
    var data = responseGet.body;
    var array = jsonDecode(data);
    print('Prediction StatusCode : ${response.statusCode}');
      IsPressed = true;
    output = array['output'];
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
