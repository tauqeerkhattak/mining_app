import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation History'),
        backgroundColor: Colors.orange,
      ),
      body: PreviousCalcBody(),
    );
  }
}

class PreviousCalcBody extends StatefulWidget {
  const PreviousCalcBody({Key key}) : super(key: key);

  @override
  _PreviousCalcBodyState createState() => _PreviousCalcBodyState();
}

class _PreviousCalcBodyState extends State<PreviousCalcBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Excavator Efficiency').snapshots(),
          builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (BuildContext context,int index) {
                  return Card(
                    elevation: 10,
                    margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                    child: ListTile(
                      title: Text(
                          'Excavator ID: ${snapshot.data.docs[index].id}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                          'Efficiency: ${snapshot.data.docs[index].get('Efficiency')}',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          String id = snapshot.data.docs[index].id;
                          FirebaseFirestore.instance.collection('Excavator Efficiency').doc(id).delete();
                        },
                      ),
                    ),
                  );
                },
              );
            }
            else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation(Colors.orange),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
