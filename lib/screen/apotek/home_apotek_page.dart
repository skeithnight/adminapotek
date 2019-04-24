import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';

class HomeApotekPage extends StatefulWidget {
  _HomeApotekPageState createState() => _HomeApotekPageState();
}

class _HomeApotekPageState extends State<HomeApotekPage> {
  Widget content() {
    return new Center(
        child: Container(
      height: 300.0,
      child: Column(
        children: <Widget>[
          ButtonTheme(
            minWidth: 200.0,
            height: 100.0,
            child: RaisedButton(
              padding: EdgeInsets.all(12.0),
              shape: StadiumBorder(),
              child: Text(
                "Cari Obat",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {
                // LoginController(context).sendData(apotek, _currentJenisUser);
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: ((context) => MyApp())));
              },
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          ButtonTheme(
            minWidth: 200.0,
            height: 100.0,
            child: RaisedButton(
              padding: EdgeInsets.all(12.0),
              shape: StadiumBorder(),
              child: Text(
                "Transaksi",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {
                // LoginController(context).sendData(apotek, _currentJenisUser);
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: ((context) => MyApp())));
              },
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(context).appBar("Order"),
      body: content(),
    );
  }
}
