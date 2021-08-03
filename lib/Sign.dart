import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'new_account.dart';
import 'home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/sign.jpg'), fit: BoxFit.cover),
            ),
          ),
          ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          hintText: 'Email',
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                        controller: passController,
                        style: TextStyle(color: Colors.white),
                        obscureText: false,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orangeAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            hintText: 'Password')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 12, left: 20),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(70)),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Transform.scale(
                                scale: 0.1, child: CircularProgressIndicator());
                          });

                      String _email = emailController.text;
                      String _password = passController.text;
                      if (emailController.text == null) {
                        Fluttertoast.showToast(msg: "Please fill all fields");
                      } else if (passController.text == null) {
                        Fluttertoast.showToast(msg: "Please fill all fields");
                      } else {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _email, password: _password)
                              .then((value) {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Home();
                              }
                            ), (route) => false);
                          });
                        } on PlatformException {
                          Fluttertoast.showToast(msg: "Something went wrong");
                          Navigator.of(context).pop();

                          //   retVal = e.message;
                        } catch (e) {
                          Fluttertoast.showToast(msg: "Something went wrong");
                          Navigator.of(context).pop();

                          print(e);
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 12, left: 20),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(70)),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewAccount()));
                    },
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
