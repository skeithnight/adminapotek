import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';
import 'cari_obat_page.dart';

class HomePenggunaPage extends StatefulWidget {
  _HomePenggunaPageState createState() => _HomePenggunaPageState();
}

class _HomePenggunaPageState extends State<HomePenggunaPage> {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => CariObatPage())));
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
