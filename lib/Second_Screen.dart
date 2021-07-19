import 'package:flutter/material.dart';
import 'package:ui_final/First_Screen.dart';
import 'package:ui_final/View_Screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only( top: 100),
        child: Column(

          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/1.png',
                ),
                radius: 90,
              ),
            ),

            SizedBox(
              height: 60,
            ),



                    Text(
                      'Follow Along At'
                        ,

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
            SizedBox(height: 5),
            Text('Your Own Pace',

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Swipe in any direction to \n go to the next step ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),




          ],
        ),
      ),
    );
  }
}
