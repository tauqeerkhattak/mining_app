import 'package:flutter/material.dart';
class Tracking extends StatefulWidget {

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Stack(
        children: [

          Center(
            child: Column(

              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(

                      color: Colors.orangeAccent,
                        borderRadius:BorderRadius.circular(90)
                    ),

                    child: Icon(Icons.directions_bus,size: 60,)
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius:BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Loading',style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(

                          color: Colors.orangeAccent,
                          borderRadius:BorderRadius.circular(90)
                      ),
                      child: Icon(Icons.directions_bus,size: 60,)
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius:BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Dumping',style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(

                          color: Colors.orangeAccent,
                          borderRadius:BorderRadius.circular(90)
                      ),
                      child: Icon(Icons.directions_bus,size: 60,)
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius:BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Waiting',style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(

                          color: Colors.orangeAccent,
                          borderRadius:BorderRadius.circular(90)
                      ),
                      child: Icon(Icons.directions_bus,size: 60,)
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius:BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Returning',style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
