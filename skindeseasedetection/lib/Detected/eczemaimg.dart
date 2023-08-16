import 'package:flutter/material.dart';

class eczemaimg extends StatefulWidget {
  const eczemaimg({super.key});

  @override
  State<eczemaimg> createState() => _eczemaimgState();
}

class _eczemaimgState extends State<eczemaimg> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/5#eczemaResult.PNG'),
          ),
        ),
      ),
    );
  }
}