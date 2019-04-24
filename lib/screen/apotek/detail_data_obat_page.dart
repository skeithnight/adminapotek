import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:adminapotek/utils/changeDate.dart';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';
import 'package:adminapotek/model/customer_model.dart';
import 'package:adminapotek/controller/login_controller.dart';

class DetailDataObatPage extends StatefulWidget {
  final String levelscreen;
  DetailDataObatPage({Key key, @required this.levelscreen}) : super(key: key);
  _DetailDataObatPageState createState() => _DetailDataObatPageState();
}

class _DetailDataObatPageState extends State<DetailDataObatPage> {
  bool isloading = false;

  var nameEditingController = new TextEditingController();
  var jumlahEditingController = new TextEditingController();
  var hargaEditingController = new TextEditingController();
  var kdlEditingController = new TextEditingController();
  var noTelpEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialized();
  }

  void initialized() async {
    setState(() {
      this.nameEditingController.text = "Paracetamol";
      this.jumlahEditingController.text = "10";
      this.hargaEditingController.text = "10000";
      this.kdlEditingController.text = convertMilistoDate(1605805200000);
    });
  }

  Widget content() => new Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: Card(
            elevation: 2.0,
            child: Column(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                    child: Text(
                      '${widget.levelscreen} Obat',
                      textAlign: TextAlign.left,
                    )),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextField(
                    enabled: false,
                    controller: nameEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Nama Obat",
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextField(
                    enabled: false,
                    controller: jumlahEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Jumlah",
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextField(
                    controller: hargaEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Harga",
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextField(
                    controller: kdlEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Tanggal Kadaluarsa",
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            padding: EdgeInsets.all(12.0),
                            shape: StadiumBorder(),
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.green,
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            padding: EdgeInsets.all(12.0),
                            shape: StadiumBorder(),
                            child: Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: content(),
      ),
    );
  }
}
