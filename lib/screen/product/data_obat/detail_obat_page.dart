import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:adminapotek/data.dart' as data1;
import 'package:adminapotek/model/obat_model.dart';
import 'package:adminapotek/controller/product_controller.dart';
import 'package:adminapotek/screen/widget/maps_widget.dart';

class DetailObatPage extends StatefulWidget {
  String level = "detail";
  Obat _obat = new Obat();
  DetailObatPage(this.level, this._obat);
  _DetailObatPageState createState() => _DetailObatPageState();
}

class _DetailObatPageState extends State<DetailObatPage> {
  Obat obat = new Obat();
  bool isloading = false;

  var nameEditingController = new TextEditingController();
  var descriptionEditingController = new TextEditingController();
  var priceEditingController = new TextEditingController();

  void initState() {
    super.initState();
    if (widget.level != 'add') {
      setState(() {
        obat = widget._obat;
        nameEditingController.text = widget._obat.nama;
        priceEditingController.text = widget._obat.harga.toString();
      });
    }
  }

  Widget formContent() => Container(
        padding: EdgeInsets.all(10.0),
        height: 400.0,
        width: double.infinity,
        child: Card(
          elevation: 2.0,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                child: TextField(
                  controller: nameEditingController,
                  onChanged: (text) {
                    setState(() {
                      obat.nama = text;
                    });
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Enter your Medicine",
                    labelText: "Medicine Name",
                  ),
                ),
              ),
              
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                child: TextField(
                  controller: priceEditingController,
                  onChanged: (text) {
                    setState(() {
                      obat.harga = int.parse(text);
                    });
                  },
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Obat price",
                    labelText: "Price",
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget saveButton() => new Container(
        margin: EdgeInsets.all(10.0),
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            height: 50.0,
            child: isloading == false
                ? new RaisedButton(
                    color: Colors.lightGreen,
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      ProductController(context).sendDataObat(obat);
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: widget.level == 'add'
              ? Text("Add Obat")
              : Text("Detail Obat"),
          backgroundColor: Colors.lightGreen,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(child: formContent()),
            Expanded(
              child: widget.level == "add" ? saveButton() : Container(),
            ),
          ],
        ),
        // bottomNavigationBar: widget.level == "add" ? saveButton() : Container(),
      ),
    );
  }
}
