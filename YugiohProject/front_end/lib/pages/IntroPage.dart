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
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset('lib/images/man.png'),
              )
              ),
               Stack(
                children: [
                  Image.asset('lib/images/Tooltip.png'),
                  const Column(
                    children: [
    
                      Padding(
                        padding: EdgeInsets.only(left: 20,
                          bottom: 20
                          ),
                        child: Text(
                                            'Hello, this is my \nfirst flutter app',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40
                                            ),),
                      )
                    ],
                  ),
                   
                ],
              ),

          // text introducing
          const Text(
            'New Apps Every month, hopefully ;-)'
            )

          // get started button
        ],
      )
    );
  }
}