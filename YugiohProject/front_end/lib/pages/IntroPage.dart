import 'package:flutter/material.dart';


class IntroPage extends StatelessWidget{

  const IntroPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          //logo 
            Center(
              child: Image.asset('lib/images/man.png')
              ),
               Stack(
                children: [
                  Image.asset('libs/images/Tooltip.png'),
                  const Text(
                    'Hello, this is my first flutter app',
                    style: TextStyle(
                      fontSize: 40
                    ),)
                ],
              )

          // text introducing


          // get started button
        ],
      )
    );
  }
}