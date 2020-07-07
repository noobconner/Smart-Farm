import 'package:flutter/material.dart';
import 'package:ung_ssru/models/product_model.dart';

class ShowDetail extends StatefulWidget {
  final ProductModel productModel;
  ShowDetail({Key key, this.productModel}) : super(key: key);

  @override
  _ShowDetailState createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
  // ex

  ProductModel productModel;
  String name = '', url = '', humidity = '', temperature = '';

  // method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      productModel = widget.productModel;
      name = productModel.name;
      url = productModel.url;
      humidity = productModel.humidity;
      temperature = productModel.temperature;

      print('name = $name');
    });
  }

  Widget showName() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        productModel.name,
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }

  Widget showHum() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Text(
            'humidity = ',
            style: TextStyle(fontSize: 30.0),
          ),
          Text(
            productModel.humidity,
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }

  Widget showTem() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Text(
            'Temperature = ',
            style: TextStyle(fontSize: 30.0),
          ),
          Text(
            productModel.temperature,
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }

  Widget showImage() {
    return Container(
      height: 200.0,
      child: Image.network(
        productModel.url,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แสดงรายละเอียด'),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            showName(),
            //showImage(),
            showHum(),
            showTem(),
          ],
        ),
      ),
    );
  }
}
