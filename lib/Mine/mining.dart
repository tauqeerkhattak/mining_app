import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'company.dart';
import 'user.dart';
var ui;

class Mining extends StatefulWidget {
  @override
  _MiningState createState() => _MiningState();
}

class _MiningState extends State<Mining> {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 50,
                      top: 10,
                    ),
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Company / کمپنی',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    User user = FirebaseAuth.instance.currentUser;
                    if (user == null) {
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Company(),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 80,
                      top: 10,
                    ),
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'User/ صارف',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Companies()));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
