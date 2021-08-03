
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Mining.dart';
import 'my_company.dart';


class Company extends StatefulWidget {

  @override
  _CompanyState createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  TextEditingController nameController=TextEditingController();
  TextEditingController truckController=TextEditingController();
  TextEditingController  exaController=TextEditingController();
  TextEditingController addressController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Company"),
      actions: [
        IconButton(icon: Icon(Icons.category_rounded), onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Companiess()));
        })
      ],
      ),
      backgroundColor: Colors.white54,
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 80,),
                  Text('Company / کمپنی',
                    style:
                    TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 25),),
                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child: TextField(
                      controller: nameController,
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orangeAccent),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),

                            hintText: 'Enter Your Company Name'
                        )
                    ),
                  ),

                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child: TextField(
                      controller: truckController,
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orangeAccent),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),

                            hintText: 'Enter Number Of Trucks'
                        )
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child: TextField(
                      controller: exaController,
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orangeAccent),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),

                            hintText: 'Enter Number of Excavator'
                        )
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child: TextField(
                      controller: addressController,
                        decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orangeAccent),
                              borderRadius: BorderRadius.all(Radius.circular(20)
                              ),
                            ),

                            hintText: 'Enter Company Location'
                        )
                    ),
                  ),
                  SizedBox(height: 20,),

                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 12,left: 22),

                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius:BorderRadius.circular(10)
                      ),
                      child: Text('Register',
                        style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                    onTap: (){
uploadingData();
                    },
                  ),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
  Future<String> uploadingData() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Transform.scale(
              scale: 0.1,
              child: CircularProgressIndicator(
                backgroundColor: Colors.greenAccent,

              ));
        });
    String name,exa,trucks,address;
    name=nameController.text;
    exa=exaController.text;
    trucks=truckController.text;
    address=addressController.text;
    final User user = await FirebaseAuth.instance.currentUser;
    print(user.uid);
    ui=user.uid;


    if(nameController.text.isEmpty || exaController.text.isEmpty||truckController.text.isEmpty){
  Fluttertoast.showToast(msg: "Please Fill all fields");
  Navigator.of(context).pop();
}else{
      FirebaseFirestore.instance.collection("Companies").add({
        'name':name,
        'address':address,
        'exa':exa,
        'trucks_count':trucks,
        'loading':"0",
        'dumping':"0",
        'waiting':'0',
        'returning':"0",

        'uid':user.uid,
      }).catchError((e) {
        print(e);
      });
      setState(() {
        nameController.clear();
        addressController.clear();
        exaController.clear();
        truckController.clear();
      });
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Success");

      // imageUrl = null;
    }
}




}
