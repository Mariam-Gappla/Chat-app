import 'package:chat_app/models/messege.dart';
import 'package:chat_app/widgets/ChatBubble.dart';
import 'package:chat_app/widgets/Chat_Bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
   ChatPage();
TextEditingController _controller=TextEditingController();
   CollectionReference users = FirebaseFirestore.instance.collection('messeges');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: users.orderBy("date").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
    List<messeges> messege=[];
    if(snapshot.hasData)
    {
    for(int i=0;i<snapshot.data!.docs.length;i++)
    {
    messege.add(messeges.fromjson(snapshot.data!.docs[i]));
    }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2A465E),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/scholar.png",height: 60,),
            Text("Chat",style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder:(context,index)=>Chat_Bubble(messege[index]),
              itemCount: messege.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller:_controller ,
              onSubmitted: (data){
                users.add({
                  "messeege":data,
                  "date": DateTime.now()
                });
                _controller.clear();
              },
              decoration: InputDecoration(
                hintText: 'send message',
                suffixIcon: IconButton(
                    onPressed:(){},
                    icon: Icon(Icons.send,color: Colors.indigoAccent,)),
                isDense: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigoAccent),
                    borderRadius: BorderRadius.circular(10)
                ),
                enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigoAccent),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
          )
        ],
      ),
    );

      }
    );
  }
}

