import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skindeseasedetection/Detected/vitiligo.dart';
import 'package:skindeseasedetection/GetImage/GetImageFromGallary.dart';
import 'package:skindeseasedetection/http/Post.dart';
import 'Detected/vilitigoimg.dart';
import 'home.dart';
import './GetImage/GetImageFromCamera.dart';
// import 'navbar.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetImageFromCamera()),
        ChangeNotifierProvider(create: (context) => GetImageFromGallery()),
        ChangeNotifierProvider(create: (context) => postmage()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: vitiligoimg(),
      // home: HomeLayout(),
    )
    );
    
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     brightness: Brightness.dark,
    //   ),
    //   home: HomePage(),
    // );
  }
}