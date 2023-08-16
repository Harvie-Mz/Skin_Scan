

import 'dart:math';

import 'package:flutter/material.dart';

class vitiligo extends StatefulWidget {
  const vitiligo({super.key});

  @override
  State<vitiligo> createState() => _vitiligoState();
}

class _vitiligoState extends State<vitiligo> {
  @override


var dir = '../../assets/eczemapage.png';
  Widget build(BuildContext context) {
    final degrees = 90;
    final angle = degrees * pi / 180;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    String pp = ''; 
    bool isprrint=false ;
    getwh(){
    pp = (w).toString(); 

    isprrint=true ;
    setState(() {
          print(w);
        print(h);
    });
    }
    return Scaffold(
        body: Container(
            height: h,
            width: w,
                child: Column(
              children: [
       
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: w*.0001),
                    Align(
                      alignment: Alignment.topLeft,
                      // child:
                      child: Container(
                        height: h * .25,
                        width: w * .25,
                        child:  Text("Skin Scan Detected",
                                      style: TextStyle(fontSize: w * 1/18,
                                      fontWeight: FontWeight.bold,
                                      ),
                                    ),
                        // child: print(w),
                        
                        // color: Color.fromARGB(255, 4, 255, 87),
                        ),
                    ),
                    // Spacer(),
                    Align(
                      alignment: Alignment.topRight,
                      child: Transform.rotate(angle: angle,
                    child: Container(
                      height: h*.5,
                      width: w*.5,
                               child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xff7c94b6),
                                      image: const DecorationImage(
                                        image:  AssetImage('assets/vitilagopage.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  )
                      // child: Container(
                      //       decoration: const BoxDecoration(
                      //         image: DecorationImage(
                      //           image: AssetImage('assets/vitilagopage.png'),
                      //         ),
                      //       ),
                      //     ),
                      


                      // color: Color.fromARGB(255, 209, 211, 231),
                    ),),),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  child:Align(
                    alignment: Alignment.topLeft,
                    child: Text("Vitiligo"),
                  )
                ),
                //         GestureDetector(
                //   onTap: () async {
                //       getwh();
                //   },
                //   child: Container(
                //     height: 50,
                //     width: 150,
                //     color: Colors.orange,
                //     child: const Center(
                //       child: Text("print hight and width"),
                //     ),
                //   ),
                // ),
              ],
            )));
  }
}