import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mining_app/previous_calculations.dart';

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  TextEditingController idController = TextEditingController();
  TextEditingController exaController = TextEditingController();
  TextEditingController tCycleController = TextEditingController();
  TextEditingController lCycleController = TextEditingController();
  TextEditingController nTrucksController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showProgressCircle = false;
  bool autoValidate = false;
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculation',
        ),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Efficiency Calculation',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        controller: idController,
                        autovalidateMode: (autoValidate)?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Excavator must have an ID!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          hintText: 'Enter Excavator ID:',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Calculation:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        controller: exaController,
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a number!';
                          }
                          return null;
                        },
                        autovalidateMode: (autoValidate)?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintText: 'Number of Excavator',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        controller: tCycleController,
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a number!';
                          }
                          return null;
                        },
                        autovalidateMode: (autoValidate)?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintText: 'Avg. Truck Cycle Time (Sec)',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        controller: lCycleController,
                        autovalidateMode: (autoValidate)?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a number!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          hintText: 'Avg. Loading Cycle Time (Sec)',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        controller: nTrucksController,
                        autovalidateMode: (autoValidate)?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a number!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          hintText: 'Number of Trucks',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40,right: 40),
                      child: Row(
                        children: [
                          Checkbox(
                            value: checkValue,
                            onChanged: (value) {
                              setState(() {
                                checkValue = !checkValue;
                              });
                            },
                            activeColor: Colors.orange,
                          ),
                          Text(
                            'multiply by 100',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        uploadingData();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                      child: Container(
                        color: Colors.orange,
                        width: 120,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Enter',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return PreviousCalc();
                          }
                        ),);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'View all previous calculations.',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          (showProgressCircle)?Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.7),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation(Colors.orange,),
              ),
            ),
          ):Container(),
        ],
      ),
    );
  }

  void uploadingData() async {
    setState(() {
      autoValidate = true;
    });
    if (_formKey.currentState.validate()) {
      setState(() {
        showProgressCircle = true;
      });
      double noOfExcavators, noOfTrucks, truckCycleTime, loadingCycleTime;
      String excavatorID = idController.text;

      noOfExcavators = double.parse(exaController.text.toString());
      noOfTrucks = double.parse(nTrucksController.text.toString());
      truckCycleTime = double.parse(tCycleController.text.toString());
      loadingCycleTime = double.parse(lCycleController.text.toString());

      double numerator = loadingCycleTime * noOfTrucks;
      double denominator = noOfExcavators * truckCycleTime;
      double result = numerator / denominator;

      setState(() {
        showProgressCircle = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Efficiency: ',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
            content: Container(
              height: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Excavator ID: $excavatorID',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (checkValue)?'Result: ${result*100}':'Result: $result',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    autoValidate = false;
                    idController.text = '';
                    exaController.text = '';
                    lCycleController.text = '';
                    tCycleController.text = '';
                    nTrucksController.text = '';
                  });
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(
                  'Save to Database',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    autoValidate = false;
                    showProgressCircle = true;
                  });
                  Navigator.pop(context);
                  saveToFirebase(excavatorID, result).then((value) async{
                    setState(() {
                      idController.text = '';
                      exaController.text = '';
                      lCycleController.text = '';
                      tCycleController.text = '';
                      nTrucksController.text = '';
                      showProgressCircle = false;
                    });
                  });
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> saveToFirebase(String excavatorID, double result) async {
    await FirebaseFirestore.instance
        .collection('Excavator Efficiency')
        .doc(excavatorID)
        .set({
      'Excavator ID': excavatorID,
      'Efficiency': result,
    }).catchError((onError) {
      setState(() {
        showProgressCircle = false;
      });
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
              content: Text(
                'Error uploading results to database, please try again.',
              ),
              actions: [
                TextButton(
                  child: Text(
                    'Error',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            );
          });
    });
  }
}
