import 'package:chat_app/models/messege.dart';
import 'package:flutter/material.dart';
class Chat_Bubble extends StatelessWidget {
  messeges text;
   Chat_Bubble(this.text);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(right: 20,top: 10,left: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xff2A465E),
          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(40),
              topRight:Radius.circular(40),
              bottomRight:Radius.circular(40)
          )
              
        ),
        child: Text(text.messege!,
          textAlign: TextAlign.center,
          style: TextStyle(color:Colors.white),
        ),
      ),
    );
  }
}
