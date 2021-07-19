import 'package:flutter/material.dart';
import 'package:ui_final/Second_Screen.dart';


class FirstScreen extends StatefulWidget {

  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    body:
     Padding(

      padding: const EdgeInsets.only(top: 100),
       child:
      Column(



    children: [


    Center(
      child: CircleAvatar(backgroundImage: AssetImage(
      'assets/2.png',

      ),
      radius: 90,),
    ),

    SizedBox(
    height: 60,
    ),


    Text('No More Junk Drawers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, ),),

    SizedBox(
    height: 5,
    ),
    Text('Filled With Paper',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
    SizedBox(height: 10,),
    Text('Easily Store Product Instructions\n for the future ',textAlign:TextAlign.center, style: TextStyle(
    color: Colors.blueGrey,
    ),),






    ],
    ),
     ),

    );

  }

  }

