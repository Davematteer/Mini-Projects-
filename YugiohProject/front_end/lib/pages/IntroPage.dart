import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IntroPage extends StatelessWidget{

  const IntroPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          //logo 
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset('lib/images/man.png'),
              )
              ),
               Stack(
                children: [
                  Column(
                    children: [
    
                      Text(
                                  'Welcome\nto my first flutter \napp',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.notoSerif(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold
                                  ))
                    ],
                  ),
                   
                ],
              ),

          // text introducing

          const Spacer(),

          // get started button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              
              child: const DecoratedBox(
                decoration:  BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey,
                    blurRadius: 20,
                    spreadRadius: 5
                    )
                  ],
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child:  Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              ),
              )
            ),
          ),
          const Spacer()
        
        ],
      )
    );
  }
}