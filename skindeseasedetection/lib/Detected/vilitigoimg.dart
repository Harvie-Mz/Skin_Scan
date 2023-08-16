import 'package:flutter/material.dart';

class vitiligoimg extends StatefulWidget {
  const vitiligoimg({super.key});

  @override
  State<vitiligoimg> createState() => _vitiligoimgState();
}

class _vitiligoimgState extends State<vitiligoimg> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
           decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/4#vitiligoResult.PNG'),
                              ),
              ),
                         
      ),
    );
  }
}