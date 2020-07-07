import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ung_ssru/models/product_model.dart';
import 'package:ung_ssru/screens/show_detail.dart';

class ShowProduct extends StatefulWidget {
  @override
  _ShowProductState createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
//Ex
  Firestore firestore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  List<ProductModel> productmodels = [];

//Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference = firestore.collection('Project');
    subscription = await collectionReference.snapshots().listen((dataSnapshot) {
      snapshots = dataSnapshot.documents;

      for (var snapshot in snapshots) {
        String nameProduct = snapshot.data['Name'];
        print('nameProduct = $nameProduct ');

        String urlProduct = snapshot.data['Url'];
        String humProduct = snapshot.data['Humidity'];
        String temProduct = snapshot.data['Temperature'];

        ProductModel productmodel =
            ProductModel(nameProduct, urlProduct, humProduct, temProduct);

        setState(() {
          productmodels.add(productmodel);
        });
      }
    });
  }

  // Future<Null> showAddUserDialogBox(
  //   BuildContext context,
  // ) {
  //   TextEditingController namePlant = TextEditingController();
  //   TextEditingController humidityPlant = TextEditingController();
  //   TextEditingController temperaturePlant = TextEditingController();

  //   return showDialog<Null>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text("Add Plant info"),
  //           content: Container(
  //             height: 200.0,
  //             width: 150.0,
  //             child: ListView(
  //               children: <Widget>[
  //                 TextField(
  //                   controller: namePlant,
  //                   keyboardType: TextInputType.text,
  //                   decoration: const InputDecoration(labelText: "Name: "),
  //                 ),
  //                 TextField(
  //                   controller: humidityPlant,
  //                   keyboardType: TextInputType.number,
  //                   decoration: const InputDecoration(labelText: "Humidity: "),
  //                 ),
  //                 TextField(
  //                   controller: temperaturePlant,
  //                   keyboardType: TextInputType.number,
  //                   decoration:
  //                       const InputDecoration(labelText: "Temperature: "),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           actions: <Widget>[
  //             new FlatButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text("Cancel")),
  //             // This button results in adding the contact to the database
  //             new FlatButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text("Confirm"))
  //           ],
  //         );
  //       });
  // }

  Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      height: 100.0,
      width: 150.0,
      child: Image.network(
        productmodels[index].url,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        showName(index),
      ],
    );
  }

  Widget showName(int index) {
    return Text(
      productmodels[index].name,
      style: TextStyle(fontSize: 24.0),
    );
  }

  Widget image() {
    return GridTile(
        footer: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Strawberry',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        child: Image.asset(
          'images/stb.png',
          fit: BoxFit.contain,
        ));
  }

  Widget image2() {
    return GridTile(
        footer: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Carrot',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        child: Image.asset(
          'images/carrot.png',
          fit: BoxFit.contain,
        ));
  }

  Widget image3() {
    return GridTile(
        footer: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Broccoli',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        child: Image.asset(
          'images/broccoli.png',
          fit: BoxFit.contain,
        ));
  }

  Widget image4() {
    return GridTile(
        footer: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Cauliflower',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        child: Image.asset(
          'images/cauliflower.png',
          fit: BoxFit.contain,
        ));
  }

  Widget image5() {
    return GridTile(
        footer: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Kale',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        child: Image.asset(
          'images/kale.png',
          fit: BoxFit.contain,
        ));
  }

  Widget image6() {
    return GridTile(
        footer: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Lettuce',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        child: Image.asset(
          'images/lettuce.png',
          fit: BoxFit.contain,
        ));
  }

  Widget showtime() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlue[50],
          child: image(),
        ),
        Container(
            padding: const EdgeInsets.all(8),
            color: Colors.lightBlue[100],
            child:image2()
            ),
        Container(
            padding: const EdgeInsets.all(8),
            color: Colors.lightBlue[200],
            child:image3(),
            ),
        Container(
            padding: const EdgeInsets.all(8),
            color: Colors.lightBlue[300],
            child: image4()
            ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlue,
          child: image5(),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue[200],
          child: image6(),
        ),
      ],
    );
  }

  // Widget showListProduct() {
  //   return Container(
  //     child: ListView.builder(
  //       itemCount: productmodels.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return GestureDetector(
  //           child: Container(
  //             decoration: index % 2 == 0
  //                 ? BoxDecoration(color: Colors.blue[50])
  //                 : BoxDecoration(color: Colors.blue[200]),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: <Widget>[
  //                 showImage(index),
  //                 SizedBox(
  //                   width: 8.0,
  //                 ),
  //                 showText(index),
  //               ],
  //             ),
  //           ),
  //           onTap: () {
  //             print('you click index = $index');

  //             var showDetailRoute = MaterialPageRoute(
  //                 builder: (BuildContext context) => ShowDetail(
  //                       productModel: productmodels[index],
  //                     ));
  //             Navigator.of(context).push(showDetailRoute);
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(appBar: AppBar(title: Text('List'),backgroundColor: Colors.transparent,elevation: 0,),
        body: showtime(),backgroundColor: Colors.blueAccent[100],
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => showAddUserDialogBox(context),
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.blue,
        // ),
      ),
    );
  }
}
