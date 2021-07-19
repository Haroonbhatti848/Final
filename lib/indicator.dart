
import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  const Dots({Key? key,required this.isActive}) : super(key: key);
 final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        microseconds: 150,),
      margin: EdgeInsets.only(right: 2),
      height: 6,
      width: isActive? 20: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
          color: isActive? Colors.blueGrey:Colors.grey,
      ),
    );
  }
}
