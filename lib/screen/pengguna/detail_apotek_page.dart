import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';
import 'package:adminapotek/model/customer_model.dart';
import 'package:adminapotek/controller/login_controller.dart';
import 'edit_acc_page.dart';
import 'transaksi_obat_page.dart';

class DetailApotek extends StatefulWidget {
  _DetailApotekState createState() => _DetailApotekState();
}

class _DetailApotekState extends State<DetailApotek> {
  var gridView = new GridView.builder(
      itemCount: 20,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: new Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text('Nama Obat $index'),
                    Text('Harga Obat')
                  ],
                )),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => TransaksiObatPage())));
          },
        );
      });

  Widget content() {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 100.0,
              width: double.infinity,
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "Nama Apotek",
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: gridView,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: AppBar(), body: content());
  }
}
