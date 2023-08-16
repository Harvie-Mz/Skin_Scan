import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:skindeseasedetection/Detected/eczemaimg.dart';
import 'package:skindeseasedetection/Detected/vilitigoimg.dart';
import 'dart:convert';

import './GetImage/GetImageFromCamera.dart';
import './GetImage/GetImageFromGallary.dart';
import 'GetImage/imagefileWidgit.dart';
import 'http/Post.dart';

final GetImageFromCamera y = GetImageFromCamera();
final Imagefile o = Imagefile();
final postmage p = postmage();

// final Imagefile Im = Imagefile();
class Detection extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Detection> {
  Uint8List? imageFile;
  bool imageAvailable = false;
  File? pImage;
getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      pImage = File(image!.path);
      imageFile = pImage!.readAsBytesSync();
      imageAvailable = true;
      print(imageAvailable);
    });
  }
getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      pImage = File(image!.path);
      imageFile = pImage!.readAsBytesSync();
      imageAvailable = true;
      print(imageAvailable);
    });
  }

  
  var URL = 'http://192.168.1.101:443/';
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
    if (output=='Eczema'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => eczemaimg()),
      );
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => vitiligoimg()),
      );
    }
    setState(() {
      
    });
  }

  // var URL = 'http://192.168.1.161:443/';

  // bool IsPressed = false;
  // Future postImage(File image) async {
  //   // String base64Image = base64Encode(image!);
  //   String base64Image = base64Encode(image.readAsBytesSync());
  //   var rawData = Uri.parse(URL);
  //   final response = await http.post(
  //     rawData,
  //     body: jsonEncode(
  //       {
  //         'image': base64Image,
  //       },
  //     ),
  //     headers: {'Content-Type': "application/json"},
  //   );
  //   print('Image StatusCode : ${response.statusCode}');
  //   print(response.statusCode);
  // }

  // String output = '';
  // getAPi() async {
  //   //  String url ='http://7a4e-102-187-36-172.ngrok.io/predict';
  //   var rawData = Uri.parse(URL);
  //   http.Response response = await http.get(rawData);
  //   var data = response.body;
  //   // to Print INDEX USE jsondecode
  //   var array = jsonDecode(data);
  //   print("Done");
  //   print('Prediction StatusCode : ${response.statusCode}');
  //   setState(() {
  //     IsPressed = true;
  //     output = array['output'];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    // var ic = Provider.of<GetImageFromCamera>(context);
    // var ig = Provider.of<GetImageFromGallery>(context);
    var p = Provider.of<postmage>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 82, 99, 255),
          title: Text('Skin Disease Detector'),
        ),
        body: Container(
            height: h,
            width: w,
            child: Center(
                child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(10),
                ),
                // Imagefile(),
                Container(
                    height: 200,
                    width: 200,
                    color: Color.fromARGB(255, 247, 247, 247),
                    child: imageAvailable ? Image.memory(imageFile!) : const SizedBox(),
                  ),
 
                SizedBox(height: 10),
                Container(
                  child: IsPressed
                      ? Text("Diagnosis : " + output)
                      : SizedBox(),
                ),
                SizedBox(height: 30),
                Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // ic.getImageFromCamera();
                          getImageFromCamera();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          color: Colors.orange,
                          child: const Center(
                            child: Text("Camera"),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          // ig.getImageFromGallery();
                          getImageFromGallery();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          color: Colors.orange,
                          child: const Center(
                            child: Text("Gallery"),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          // p.postImage(pImage!);
                          postImage(pImage!);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          color: Colors.orange,
                          child: const Center(
                            child: Text("Result"),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))));
  }
}
