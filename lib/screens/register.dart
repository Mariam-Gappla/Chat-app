import 'package:chat_app/screens/chatPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../widgets/textField.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUP extends StatefulWidget {
  SignUP({Key? key}) : super(key: key);
  bool isLoading=false;

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  String? email;
  String? password;
  bool isLoading=false;
  GlobalKey<FormState> state =new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: state,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xff2A465E),
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/scholar.png',
                width: 20,
                height: 120,
              ),
              Center(
                  child: Text(
                "Scholar Chat",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 10),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              CustomFormfield("Email", (data) {
                email = data;
              }),
              CustomFormfield("Password", (data) {
                password = data;
              }),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  if (state.currentState!.validate()) {
                    try{
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("you have account")));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatPage()));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("password weak")));
                        setState(() {
                        });
                      }
                      else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'The account already exists for that email.')));
                        setState(() {
                        });
                      }
                    }
                  }
                },
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: Text("Sign Up"),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  ),
                  ),
                    ],
          ),
        ),
      ),
    );
  }
}