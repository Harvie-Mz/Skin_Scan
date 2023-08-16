import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Detection.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> screen = [
    HomePage(),
    Detection(),
    // HistoryScreen(),
    // RefrencesScreen()
  ];
  List<String> titles = [
    'Main',
    'Detection',
    'History',
    'Refrences',
  ];

  // late Uint8List imagepickeddddd;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 82, 99, 255),
        centerTitle: true,
        // title: const Text("Home"),
        title:Text(titles[currentIndex]),
      ),
      body:
      ListView(
        padding: const EdgeInsets.all(50.0),
        children: [
          Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detection()),
                  );
                },
                child: const Text(
                  "Detection",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.document_scanner_outlined),
                label: 'detection'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined), label: 'history'),
            BottomNavigationBarItem(
                icon: Icon(Icons.border_color_outlined), label: 'refrences'),
          ]),
    );
  }
}
