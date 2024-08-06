// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  // final VoidCallback signUpPage;
  // const login({Key?key, required this.signUpPage}) : super(key: key);
  const Signup({Key? key}) : super(key: key);
  
  @override
  State<Signup> createState() => SignupState();
}

class SignupState extends State<Signup>{
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  
  Future signUpUser() async{
    try{
      if(_passwordController.text == _confirmController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text.trim(), 
        password: _passwordController.text.trim()
        );
      }
    } on FirebaseAuthException catch (e) {
      //show error message
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/loginScreen.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 60,),
                  Text(
                    "Tami",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 225, 181, 153),)
                  ),
                  SizedBox(height: 50,),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                        //color: const Color.fromARGB(150, 213,152,113),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Icon(Icons.person_outlined,
                              color: Colors.black),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 18,
                            ),
                            child: TextField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                hintStyle:
                                  TextStyle(color: Colors.black45),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      //color: const Color.fromARGB(150, 213,152,113),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Icon(Icons.lock_open_outlined, color: Colors.black),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 18,
                            ),
                            child: TextField(
                              obscureText: true,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.black45),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      //color: const Color.fromARGB(150, 213,152,113),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Icon(Icons.lock, color: Colors.black),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 18,
                            ),
                            child: TextField(
                              obscureText: true,
                              controller: _confirmController,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.black45),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      signUpUser();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 225, 181, 153),
                        borderRadius: BorderRadius.circular(25)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 235),
                  const Text(
                    "or Sign Up with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      //color: Color.fromARGB(255,213,152,113)
                      color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          //color: Color.fromARGB(255,213,152,113)
                          color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: () {
                          signUpUser();
                        },
                        child: Text(
                        " Login Now!",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                        ),
                        )
                      ),
                    ]
                  ),
                ],
              )))
          ],
      )
    );
  }
}