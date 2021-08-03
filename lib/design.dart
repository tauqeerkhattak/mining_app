import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Mine/tracking.dart';
class User extends StatefulWidget {
  final String address;
  final String totalTrucks;
  final String loading;
  final String dumping;
  final String waiting;
  final String returning;
  final String id;
// String weight;
  final DocumentSnapshot documentSnapshot;
  const User({Key key, this.address, this.totalTrucks, this.loading, this.dumping, this.waiting, this.returning, this.id, this.documentSnapshot}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.4,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius:BorderRadius.circular(70)
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(left: 10,top: 20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Location',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text('Total Trucks',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                    ],
                  ),

                ),
                Divider(thickness: 5,height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: Text(widget.address,style: TextStyle(fontSize: 20),),
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      child: Text(widget.totalTrucks,style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 5,height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Loading',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('Dumping',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('Waiting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('Returning',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
                ),
                Divider(thickness: 5,height: 6,),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(widget.loading,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                      Text(widget.dumping,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                      Text(widget.waiting,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                      Text(widget.returning,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)
                    ],
                  ),
                )
              ],

            ),
          ),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder:(context)=>Tracking()));
          },
        ),
      ),
    );
  }
}