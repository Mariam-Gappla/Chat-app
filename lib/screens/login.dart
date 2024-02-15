import 'package:chat_app/screens/chatPage.dart';
import 'package:chat_app/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../widgets/textField.dart';

class login extends StatefulWidget {
   login() ;

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
   String? email;

   String? password;

   GlobalKey<FormState> state=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:state,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xff2A465E),
          child: ListView(
            children: [
              SizedBox(height: 50,),
              Image.asset('assets/images/scholar.png',width: 20,height: 120,),
             Center(child: Text("Scholar Chat",style: TextStyle(
               fontSize: 20,
               color: Colors.white,
               fontWeight: FontWeight.bold,
             ),)),
              SizedBox(height: 60,),
             Padding(
               padding: const EdgeInsets.only(left: 12,bottom: 10),
               child: Text("Sign In",style: TextStyle(
                 color: Colors.white,
                 fontSize: 20,
               ),),
             ),
              CustomFormfield("Email", (data){
                email=data;
              }),
              CustomFormfield("Password", (data){
                password=data;
              }),
              SizedBox(height: 10,),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 6,right: 6),
                child: MaterialButton(
                    onPressed: ()async{
                      if(state.currentState!.validate())
                        {
                          try {
                            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: email!,
                                password: password!,
                            );
                            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ChatPage()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('No user found for that email.')));
                              setState(() {
                              });
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content:Text('No user found for that email.')));
                              setState(() {
                              });
                            }
                          }
                        }
                    },
                  shape:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ) ,
                  color: Colors.white,
                  child: Text("Sign In"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("do not have an account",style: TextStyle(
                    color: Colors.white,
                  ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SignUP()));
                    },
                    child: Text(" Sign Up",style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
