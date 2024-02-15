import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
  ChatBubble();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(right: 5,top: 10,left: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xff2A465E),
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(40),
                topRight:Radius.circular(40),
                bottomLeft:Radius.circular(40)
            )

        ),
        child: Text("mariam nmcnmv",
          textAlign: TextAlign.center,
          style: TextStyle(color:Colors.white),
        ),
      ),
    );
  }
}
