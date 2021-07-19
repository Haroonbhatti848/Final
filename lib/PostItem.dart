import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  final String dp;
  final String name;
  final String text;
  final String img;
  final Icon icon;
  const PostItem({Key? key,
    required this.dp,
    required this.name,
    required this.text,
    required this.img,
  required this.icon}) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 5),
    child: InkWell(
child: Column(
  children: [


         ListTile(

          leading: CircleAvatar(
            
            backgroundImage: AssetImage(
              "${widget.dp}", 
            ),
          ),
           contentPadding: EdgeInsets.all(0),
           trailing: widget.icon,




          title: Text("${widget.name}",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("${widget.text}",style: TextStyle(
            color: Colors.grey
          ),),

        ),


    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset("${widget.img}",fit: BoxFit.cover,
      height: 180,
      
      width: MediaQuery.of(context).size.width,),
    )

  ],
),
    ),);

  }
}
