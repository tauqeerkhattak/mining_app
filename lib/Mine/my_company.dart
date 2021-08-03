import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Mining.dart';
import 'tracking.dart';

class Companiess extends StatefulWidget {

  @override
  _CompaniessState createState() => _CompaniessState();
}

class _CompaniessState extends State<Companiess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Stations"),
        backgroundColor: Colors.orange,
      ),
      body:  Container(

        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Companies").where('uid',isEqualTo:ui).

              snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : SizedBox(
              height: MediaQuery.of(context).size.height,

              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data =
                  snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      getDetailsDialog(context,snapshot.data.docs[index],data.id);
                      print(data.id);
                      //   getDetailsDialog(context, snapshot.data.docs[index], data['title'], data['image'], data['description']);
                      // getCarouselWidget(data['uid']);
                      // getDetailsDialog(
                      //     context,
                      //     snapshot.data.docs[index],
                      //     data['image'],
                      //     data['Name'],
                      //     data['experience'],
                      //     data['type'],
                      //     data['price'],
                      //     data['description'],
                      //     data['uid']);

                      //    updateDialog(context, snapshot.data.docs[index].id);
                      // addOrder(
                      //   context,
                      //   snapshot.data.docs[index],
                      //   data.id
                      // );
                    },
                    onLongPress: () {
//deleteData(snapshot.data.docs[index].id);

},
                    child: ProductItem(
                      documentSnapshot: data,
                      id: data.id,
                      address: data['address'],
                      totalTrucks: data['trucks_count'],
                      loading: data['loading'],
                      dumping: data['dumping'],
                      waiting: data['waiting'],
                      returning: data['returning'],
                      idd: snapshot.data.docs[index].id,

                    ),);
                },
              ),
            );
          },
        ),
      ),
    );
  }
  Future<void> getDetailsDialog(BuildContext context, selectedDoc,id
      ) {
    return showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    InkWell(
                      onTap: ()async{
                        var vrr= await FirebaseFirestore.instance.collection("Companies").doc(id).get();
                        var load=vrr.data()['loading'];
                        load=int.parse(load);
                        load= load+1;
                        load=load.toString();
                        print(load);
                        FirebaseFirestore.instance.collection("Companies").doc(id).update({
                          'loading':load,
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('Loading',style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
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
                    InkWell(
                      onTap:()async{
                        var vrr= await FirebaseFirestore.instance.collection("Companies").doc(id).get();
                        var load=vrr.data()['dumping'];
                        load=int.parse(load);
                        load= load+1;
                        load=load.toString();
                        print(load);
                        FirebaseFirestore.instance.collection("Companies").doc(id).update({
                          'dumping':load,
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('Dumping',style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
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
                    InkWell(
                      onTap:()async{
                        var vrr= await FirebaseFirestore.instance.collection("Companies").doc(id).get();
                        var load=vrr.data()['waiting'];
                        load=int.parse(load);
                        load= load+1;
                        load=load.toString();
                        print(load);
                        FirebaseFirestore.instance.collection("Companies").doc(id).update({
                          'waiting':load,
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('Waiting',style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
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
                    InkWell(
                      onTap:()async{
                        var vrr= await FirebaseFirestore.instance.collection("Companies").doc(id).get();
                        var load=vrr.data()['returning'];
                        load=int.parse(load);
                        load= load+1;
                        load=load.toString();
                        print(load);
                        FirebaseFirestore.instance.collection("Companies").doc(id).update({
                          'returning':load,
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('Returning',style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}
class ProductItem extends StatefulWidget {

  //final String imageUrl;
  final String id;
  final String address;
  final String totalTrucks;
  final String loading;
  final String dumping;
  final String waiting;
  final String returning;
  final String idd;
  // String weight;
  final DocumentSnapshot documentSnapshot;
  ProductItem({
    //   @required this.imageUrl,
    @required this.documentSnapshot,
    @required this.id,
    this.idd,
    this.address, this.totalTrucks, this.loading, this.dumping, this.waiting, this.returning,
    // this.weight
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
      child: Container(

        width: MediaQuery
            .of(context)
            .size
            .width*0.6,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius:BorderRadius.circular(70)
        ),
        child: Column(
          children: <Widget>[
            // // Container(
            // //   height: MediaQuery
            // //       .of(context)
            // //       .size
            // //       .height * 0.2,
            // //   width: MediaQuery
            // //       .of(context)
            // //       .size
            // //       .width * 0.9,
            // //   child: ClipRRect(
            // //     borderRadius: BorderRadius.circular(10),
            // //     child: Image.network(
            // //       widget.imageUrl,
            // //       fit: BoxFit.cover,
            // //     ),
            // //   ),
            // ),
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
            IconButton(icon: Icon(Icons.delete), onPressed: (){
              deleteData(widget.idd);
              Fluttertoast.showToast(msg: "Deleted");

            }),
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
        padding: EdgeInsets.all(5),

      ),
    );
  }

}
void deleteData(docId){
  FirebaseFirestore.instance.collection("Companies").doc(docId).delete().catchError((e){
    print(e);
  });

}

