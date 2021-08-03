import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mining_app/Sign.dart';

import 'calculation.dart';
import 'Mine/mining.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/Mine.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Maximine',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Welcome to online Calculation & Mining',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Calculation / حساب کتاب',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Calculation(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Mining / کان کنی',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (user == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Error',
                              style: TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                            content:
                                Text('For mining, you have to login first!',),
                            actions: [
                              TextButton(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.orange,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.orange,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return SignIn();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                    else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Mining();
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  if (user == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SignIn();
                        },
                      ),
                    );
                  }
                  else {
                    FirebaseAuth.instance.signOut().then((value) {
                      setState(() {
                        user = FirebaseAuth.instance.currentUser;
                      });
                    });
                  }
                },
                child: Text((user == null)?'Login':'Logout',),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
