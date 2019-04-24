import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:adminapotek/utils/changeDate.dart';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';
import 'package:adminapotek/model/customer_model.dart';
import 'package:adminapotek/controller/login_controller.dart';

class EditProfilPage extends StatefulWidget {
  _EditProfilPageState createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  bool isloading = false;

  var nameEditingController = new TextEditingController();
  var ttlEditingController = new TextEditingController();
  var jkEditingController = new TextEditingController();
  var emailEditingController = new TextEditingController();
  var noTelpEditingController = new TextEditingController();
  var namaApotekEditingController = new TextEditingController();

  List _jenisKelamin = ["Jenis Kelamin", "Laki-Laki", "Perempuan"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentJenisKelamin;
  void changedDropDownItem(String selectedJenisUser) {
    setState(() {
      _currentJenisKelamin = selectedJenisUser;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String jenisKelamin in _jenisKelamin) {
      items.add(new DropdownMenuItem(
          value: jenisKelamin, child: new Text(jenisKelamin)));
    }
    return items;
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentJenisKelamin = _dropDownMenuItems[0].value;
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
      this.namaApotekEditingController.text = "Apotek Ating";
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
                      'Profil',
                      textAlign: TextAlign.left,
                    )),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30.0),
                        child: TextField(
                          enabled: false,
                          controller: nameEditingController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: "Nama",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30.0),
                        child: TextField(
                          enabled: false,
                          controller: ttlEditingController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: "Tanggal Lahir",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 0.0),
                        width: double.infinity,
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: _currentJenisKelamin,
                              items: _dropDownMenuItems,
                              onChanged: changedDropDownItem,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30.0),
                        child: TextField(
                          controller: emailEditingController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: "Email",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30.0),
                        child: TextField(
                          controller: noTelpEditingController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: "No. Handphone",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30.0),
                        child: TextField(
                          controller: namaApotekEditingController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: "Nama Apotek",
                          ),
                        ),
                      ),
                    )
                  ],
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
                  ),
                ),
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
