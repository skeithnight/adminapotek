import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:adminapotek/utils/changeDate.dart';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';
import 'package:adminapotek/model/customer_model.dart';
import 'package:adminapotek/controller/login_controller.dart';

class EditAccountPage extends StatefulWidget {
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  bool isloading = false;

  var nameEditingController = new TextEditingController();
  var ttlEditingController = new TextEditingController();
  var jkEditingController = new TextEditingController();
  var emailEditingController = new TextEditingController();
  var noTelpEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialized();
  }

  void initialized() async {
    setState(() {
      this.nameEditingController.text = "Tono";
      this.ttlEditingController.text = convertMilistoDate(157741200000);
      this.jkEditingController.text = "Laki-Laki";
      this.emailEditingController.text = "Tono@gmail.com";
      this.noTelpEditingController.text = "085712123123";
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
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextField(
                    enabled: false,
                    controller: nameEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Nama Pengguna",
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextField(
                    enabled: false,
                    controller: ttlEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Tanggal Lahir Pengguna",
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextField(
                    enabled: false,
                    controller: jkEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextField(
                    enabled: false,
                    controller: emailEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Email Pengguna",
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                  child: TextField(
                    enabled: false,
                    controller: noTelpEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "No. Handphone",
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
