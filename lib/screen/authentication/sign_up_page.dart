import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:adminapotek/utils/uidata.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:adminapotek/utils/changeDate.dart';
import 'package:gplacespicker/gplacespicker.dart';

import 'package:adminapotek/model/apotek_model.dart';
import 'login_page.dart';
import 'package:adminapotek/controller/register_controller.dart';

class SignUpPage extends StatefulWidget {
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Apotek apotek = new Apotek();
  Size deviceSize;
  String latLng = "";

  TextEditingController _tanggalCTRL = new TextEditingController();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: signUpBody(context),
        ),
      ),
    );
  }

  List _jenisKelamin = ["Jenis Kelamin", "Laki-Laki", "Perempuan"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentJenisKelamin;
  void changedDropDownItem(String selectedJenisUser) {
    setState(() {
      _currentJenisKelamin = selectedJenisUser;
      this.apotek.jk = selectedJenisUser;
    });
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentJenisKelamin = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String jenisKelamin in _jenisKelamin) {
      items.add(new DropdownMenuItem(
          value: jenisKelamin, child: new Text(jenisKelamin)));
    }
    return items;
  }

  signUpBody(context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[signUpHeader(), signUpFields(context)],
        ),
      );

  signUpHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Untuk mendaftar, mohon lengkapi data diri anda di bawah ini :",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  signUpFields(context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    this.apotek.staffName = text;
                  });
                },
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Nama ...",
                  labelText: "Nama",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: TextField(
                      enabled: false,
                      controller: _tanggalCTRL,
                      maxLines: 1,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: "",
                        labelText: "Tanggal",
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FlatButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1940, 1, 1),
                              maxTime: DateTime(2018, 1, 1), onChanged: (date) {
                            _tanggalCTRL.text = changeDate(date);
                            this.apotek.ttl = date.millisecondsSinceEpoch;
                          }, onConfirm: (date) {
                            this.apotek.ttl = date.millisecondsSinceEpoch;
                            _tanggalCTRL.text = changeDate(date);
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Icon(Icons.date_range)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    value: _currentJenisKelamin,
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    this.apotek.password = text;
                  });
                },
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    this.apotek.password = text;
                  });
                },
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Konfirmasi Password",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                onChanged: (text) {
                  setState(() {
                    this.apotek.email = text;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  labelText: "Email Anda",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                onChanged: (text) {
                  setState(() {
                    this.apotek.noTelp = text;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  labelText: "No. Handphone",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                onChanged: (text) {
                  setState(() {
                    this.apotek.name = text;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter your apotek",
                  labelText: "Nama Apotek",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    this.apotek.noIjin = text;
                  });
                },
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "No Ijin ...",
                  labelText: "Nomor Ijin",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(latLng),
                  RaisedButton(
                    child: Text("Pick Location"),
                    onPressed: () async {
                      String latLng = await Gplacespicker.openPlacePicker();
                      setState(() {
                        this.latLng = latLng;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: isloading == false
                  ? RaisedButton(
                      padding: EdgeInsets.all(12.0),
                      shape: StadiumBorder(),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        List<String> koordinat = this.latLng.split(";");
                        setState(() {
                          this.isloading = true;
                          this.apotek.latitude = double.parse(koordinat[0]);
                          this.apotek.longitude = double.parse(koordinat[1]);
                        });
                        RegisterController(context).sendData(apotek);
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            SizedBox(
              height: 5.0,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => LoginPage())));
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      );
}
