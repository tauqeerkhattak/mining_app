import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Tracking.dart';

class Userrrr extends StatefulWidget {
  final String address;
  final String totalTrucks;
  final String loading;
  final String dumping;
  final String waiting;
  final String returning;
  final String id;
// String weight;
  final DocumentSnapshot documentSnapshot;
  const Userrrr(
      {Key key,
      this.address,
      this.totalTrucks,
      this.loading,
      this.dumping,
      this.waiting,
      this.returning,
      this.id,
      this.documentSnapshot})
      : super(key: key);

  @override
  _UserrrrState createState() => _UserrrrState();
}

class _UserrrrState extends State<Userrrr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(70)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Total Trucks',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 5,
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: Text(
                        widget.address,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      child: Text(
                        widget.totalTrucks,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 5,
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Loading',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Dumping',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Waiting',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Returning',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Divider(
                  thickness: 5,
                  height: 6,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.loading,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.dumping,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.waiting,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.returning,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Tracking()));
          },
        ),
      ),
    );
  }
}

class Companies extends StatefulWidget {
  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Stations"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection("Companies").snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data.docs[index];
                        return GestureDetector(
                          onTap: () async {
                            User i = await FirebaseAuth.instance.currentUser;
                            var vrr = await FirebaseFirestore.instance
                                .collection("Companies")
                                .doc(data.id)
                                .get();

                            var load = vrr.data()['loading'];
                            var to = vrr.data()['trucks_count'];

                            getDetailsDialog(
                                context, snapshot.data.docs[index], data.id);

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
                          onLongPress: () {},
                          child: ProductItem(
                            documentSnapshot: data,
                            id: data.id,
                            address: data['address'],
                            totalTrucks: data['trucks_count'],
                            loading: data['loading'].toString(),
                            dumping: data['dumping'].toString(),
                            waiting: data['waiting'].toString(),
                            returning: data['returning'].toString(),
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }

  var lo;
  var du;
  var w;
  var r;
  Future<void> getDetailsDialog(BuildContext context, selectedDoc, id) {
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
                    Container(
                      child: InkWell(
                        onTap: () async {
                          User currentUser = FirebaseAuth.instance.currentUser;
                          var companyDocument = await FirebaseFirestore.instance
                              .collection("Companies")
                              .doc(id)
                              .get();
                          var currentlyLoading =
                              companyDocument.data()['loading'];
                          var totalExcavators = companyDocument.data()['exa'];
                          print('Total Truck Loading: $currentlyLoading');
                          print('Total Excavators: $totalExcavators');
                          if (currentlyLoading == totalExcavators) {
                            Fluttertoast.showToast(
                                msg:
                                    "All the excavators are full, please wait for your turn!");
                          } else {
                            currentlyLoading = int.parse(currentlyLoading);
                            currentlyLoading = currentlyLoading + 1;
                            currentlyLoading = currentlyLoading.toString();
                            print(currentlyLoading);
                            FirebaseFirestore.instance
                                .collection("User")
                                .doc(currentUser.uid)
                                .update({
                              'loading': "1",
                            });
                            FirebaseFirestore.instance
                                .collection("Companies")
                                .doc(id)
                                .update({
                              'loading': currentlyLoading.toString(),
                            });
                          }
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(90)),
                                child: Icon(
                                  Icons.directions_bus,
                                  size: 60,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Loading',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(90)),
                          child: Icon(
                            Icons.directions_bus,
                            size: 60,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () async {
                        User i = FirebaseAuth.instance.currentUser;
                        var v = await FirebaseFirestore.instance
                            .collection("User")
                            .doc(i.uid)
                            .get();
                        var l = v.data()['dumping'];
                        var g = v.data()['loading'];
                        var vrr = await FirebaseFirestore.instance
                            .collection("Companies")
                            .doc(id)
                            .get();
                        var load = vrr.data()['dumping'];
                        var loadM = vrr.data()['loading'];

                        print(load);
                        if (loadM == "0") {
                          loadM = int.parse(loadM);
                          loadM = loadM - 1;
                          loadM = loadM.toString();
                          load = int.parse(load);
                          load = load + 1;

                          load = load.toString();

                          FirebaseFirestore.instance
                              .collection("User")
                              .doc(i.uid)
                              .update({
                            'dumping': "1",
                          });
                          FirebaseFirestore.instance
                              .collection("Companies")
                              .doc(id)
                              .update({
                            'dumping': load,
                          });
                        } else {
                          loadM = int.parse(loadM);
                          loadM = loadM - 1;
                          loadM = loadM.toString();
                          load = int.parse(load);
                          load = load + 1;

                          load = load.toString();

                          FirebaseFirestore.instance
                              .collection("User")
                              .doc(i.uid)
                              .update({
                            'dumping': "1",
                          });
                          FirebaseFirestore.instance
                              .collection("Companies")
                              .doc(id)
                              .update({
                            'dumping': load,
                            'loading': loadM,
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Dumping',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(90)),
                          child: Icon(
                            Icons.directions_bus,
                            size: 60,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () async {
                        User i = FirebaseAuth.instance.currentUser;
                        var v = await FirebaseFirestore.instance
                            .collection("User")
                            .doc(i.uid)
                            .get();
                        var l = v.data()['waiting'];
                        var b = v.data()['dumping'];

                        var vrr = await FirebaseFirestore.instance
                            .collection("Companies")
                            .doc(id)
                            .get();
                        var load = vrr.data()['waiting'];
                        var loadM = vrr.data()['dumping'];

                        if (loadM == "0") {
                          print(loadM);
                          print("eeeeeee");
                          loadM = int.parse(loadM);
                          print(loadM);

                          print("eeeee2edsdee");
                          print(loadM);

                          loadM = loadM - 1;
                          print("eeeee4523ee");
                          print(loadM);

                          loadM.toString();
                          print("eee5454354eeee");
                          print(loadM);

                          load = int.parse(load);
                          load = load + 1;
                          load = load.toString();
                          print(load);

                          FirebaseFirestore.instance
                              .collection("User")
                              .doc(i.uid)
                              .update({
                            'waiting': "1",
                          });
                          FirebaseFirestore.instance
                              .collection("Companies")
                              .doc(id)
                              .update({
                            'waiting': load,
                          });
                        } else {
                          print(loadM);
                          print("eeeeeee");
                          loadM = int.parse(loadM);
                          print(loadM);

                          print("eeeee2edsdee");
                          print(loadM);

                          loadM = loadM - 1;
                          print("eeeee4523ee");
                          print(loadM);

                          loadM.toString();
                          print("eee5454354eeee");
                          print(loadM);

                          load = int.parse(load);
                          load = load + 1;
                          load = load.toString();
                          print(load);

                          FirebaseFirestore.instance
                              .collection("User")
                              .doc(i.uid)
                              .update({
                            'waiting': "1",
                          });
                          FirebaseFirestore.instance
                              .collection("Companies")
                              .doc(id)
                              .update({
                            'waiting': load,
                            'dumping': loadM.toString(),
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Waiting',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(90)),
                          child: Icon(
                            Icons.directions_bus,
                            size: 60,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () async {
                        User i = FirebaseAuth.instance.currentUser;
                        var v = await FirebaseFirestore.instance
                            .collection("User")
                            .doc(i.uid)
                            .get();
                        var l = v.data()['returning'];
                        var b = v.data()['waiting'];
                        var vrr = await FirebaseFirestore.instance
                            .collection("Companies")
                            .doc(id)
                            .get();
                        var load = vrr.data()['returning'];
                        var loadM = vrr.data()['waiting'];

                        if (loadM == "0") {
                          loadM = int.parse(loadM);
                          loadM = loadM - 1;
                          loadM.toString();
                          load = int.parse(load);
                          load = load + 1;
                          load = load.toString();

                          FirebaseFirestore.instance
                              .collection("User")
                              .doc(i.uid)
                              .update({
                            'returning': "0",
                            'waiting': "0",
                            'dumping': "0",
                            "loading": "0",
                          });
                          FirebaseFirestore.instance
                              .collection("Companies")
                              .doc(id)
                              .update({
                            'returning': load,
                          });
                        } else {
                          loadM = int.parse(loadM);
                          loadM = loadM - 1;
                          loadM.toString();
                          load = int.parse(load);
                          load = load + 1;
                          load = load.toString();
                          print(load);

                          FirebaseFirestore.instance
                              .collection("User")
                              .doc(i.uid)
                              .update({
                            'returning': "0",
                            'waiting': "0",
                            'dumping': "0",
                            "loading": "0",
                          });
                          FirebaseFirestore.instance
                              .collection("Companies")
                              .doc(id)
                              .update({
                            'returning': load,
                            'waiting': loadM.toString(),
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Returning',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
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
  // String weight;
  final DocumentSnapshot documentSnapshot;
  ProductItem({
    //   @required this.imageUrl,
    @required this.documentSnapshot,
    @required this.id,
    this.address,
    this.totalTrucks,
    this.loading,
    this.dumping,
    this.waiting,
    this.returning,
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
        width: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(70)),
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
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total Trucks',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 5,
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Text(
                    widget.address,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  height: 150,
                  width: 100,
                  child: Text(
                    widget.totalTrucks,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 5,
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Loading',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Dumping',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Waiting',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Returning',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              thickness: 5,
              height: 6,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.loading,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.dumping,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.waiting,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.returning,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  )
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
