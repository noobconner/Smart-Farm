import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
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
    CollectionReference collectionReference = firestore.collection('Product');
    subscription = await collectionReference.snapshots().listen((dataSnapshot) {
      snapshots = dataSnapshot.documents;

      for (var snapshot in snapshots) {
        String nameProduct = snapshot.data['Name'];
        print('nameProduct = $nameProduct ');

        String detailProduct = snapshot.data['Detail'];
        String urlProduct = snapshot.data['Url'];

        ProductModel productmodel =
            ProductModel(nameProduct, detailProduct, urlProduct);

        setState(() {
          productmodels.add(productmodel);
        });
      }
    });
  }

  Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(30.0)),
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
        showDetailShort(index),
      ],
    );
  }

  Widget showName(int index) {
    return Text(
      productmodels[index].name,
      style: TextStyle(fontSize: 24.0),
    );
  }

  Widget showDetailShort(int index) {
    String detailShort = (productmodels[index].detail).substring(1, 70);
    return Container(
      width: 180.0,
      child: Text('$detailShort ...'),
    );
  }

  Widget showListProduct() {
    return Container(
      child: ListView.builder(
        itemCount: productmodels.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              decoration: index % 2 == 0
                  ? BoxDecoration(color: Colors.blue[100])
                  : BoxDecoration(color: Colors.blue[50]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  showImage(index),
                  SizedBox(
                    width: 8.0,
                  ),
                  showText(index),
                ],
              ),
            ),
            onTap: () {
              print('You Click index = $index');

              var showdetailRout = MaterialPageRoute(
                  builder: (BuildContext context) => ShowDetail(
                        productModel: productmodels[index],
                      ));
              Navigator.of(context).push(showdetailRout);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: showListProduct());
  }
}
