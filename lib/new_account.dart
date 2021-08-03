import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Sign.dart';
class NewAccount extends StatefulWidget {

  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('images/sign.jpg'),fit: BoxFit.cover
              ),
            ),
          ),
          ListView(

            children: [

              Column(

                children: [
                  SizedBox(height: 100,),
                  Text('Sign Up',
                    style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
                  SizedBox(height: 40,),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                      controller: nameController,
                        style: TextStyle(color: Colors.white),
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orangeAccent),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            prefixIcon: Icon(Icons.person_outline,color: Colors.white,),
                            hintText: 'Name'
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                      controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orangeAccent),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            prefixIcon: Icon(Icons.email_outlined,color: Colors.white,),
                            hintText: 'Email'
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                      controller: passController,
                        style: TextStyle(color: Colors.white),
                        obscureText: false,
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orangeAccent),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            prefixIcon: Icon(Icons.vpn_key_outlined,color: Colors.white,),
                            hintText: 'Password'
                        )
                    ),
                  ),

                  SizedBox(height: 20,),

                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 12,left: 20),

                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius:BorderRadius.circular(70)
                      ),
                      child: Text('Sign Up',
                        style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                    onTap: (){
                  signUp();
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
  Future signUp()async {

    String name, email, lname, cit, password, empIDIn;
    if (passController.text.length < 8) {
      Fluttertoast.showToast(msg: "PAssword must be 8 digit");
    } if(!emailController.text.contains("@")){

      Fluttertoast.showToast(msg: "Email must be correct");

    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Transform.scale(
                scale: 0.1,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,

                ));
          });
      email = emailController.text;
      name = nameController.text;
      password = passController.text;

      FirebaseAuth _auth =await  FirebaseAuth.instance;
      final User user = _auth.currentUser;

      _auth
          .createUserWithEmailAndPassword(
          email: email, password: password)
          .then((signedInUser) {
        FirebaseFirestore.instance.collection("User")
            .doc(signedInUser.user.uid)
            .set({
          'email': email,
          'name': name,

          'uid': signedInUser.user.uid,
          'loading':"0",
          'dumping':"0",
          'waiting':"0",
          'returning':"0",

        })
            .then((value) {
          if (signedInUser != null) {

            Navigator
                .of(context)
                .pushReplacement(
                new MaterialPageRoute(builder: (BuildContext context) {
                  return SignIn();
                }));
          }
        }).catchError((e) {
          Fluttertoast.showToast(msg: "Some Details are not correct");
          print(e);
        });
      }).catchError((e) {
        print(e);
      });
    }
  }

}
