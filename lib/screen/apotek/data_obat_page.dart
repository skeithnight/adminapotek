import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:adminapotek/utils/changeDate.dart';
import 'package:flutter/cupertino.dart';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';
import 'package:adminapotek/model/customer_model.dart';
import 'package:adminapotek/controller/login_controller.dart';
import 'edit_profil_page.dart';
import 'detail_data_obat_page.dart';

class DataObatPage extends StatefulWidget {
  _DataObatPageState createState() => _DataObatPageState();
}

class _DataObatPageState extends State<DataObatPage> {
  // Apotek apotek = new Apotek();
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialized();
  }

  void initialized() async {}

  Widget item() => new Card(
        child: ListTile(
            title: new Align(
              alignment: FractionalOffset.centerLeft,
              child: Container(
                child: Column(
                  children: <Widget>[Text("Id Obat"), Text("Nama Obat")],
                ),
              ),
            ),
            subtitle: new Align(
              alignment: FractionalOffset.centerLeft,
              child: Container(
                child: Column(
                  children: <Widget>[Text("jumlah"), Text("harga")],
                ),
              ),
            ),
            trailing: Container(
              width: 100.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        child: Icon(Icons.edit),
                        color: Colors.green,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DetailDataObatPage(
                                        levelscreen: "Edit",
                                      ))));
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        child: Icon(Icons.remove_circle),
                        color: Colors.red,
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            child: new CupertinoAlertDialog(
                              title: Text("Alert"),
                              content: new Text(
                                  "Apakah Anda Yakin Menghapus data ini?"),
                              actions: <Widget>[
                                new FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: new Text("OK")),
                                new FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: new Text("Tidak"))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )),
      );

  Widget content() => new Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: Card(
            elevation: 2.0,
            child: Column(
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new ExactAssetImage('assets/icon/logoapotek.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(icon: Icon(Icons.search)),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      item(),
                      item(),
                      item(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: content(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => DetailDataObatPage(
                          levelscreen: "Tambah",
                        ))));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          foregroundColor: Colors.pink,
        ),
      ),
    );
    // return FutureBuilder<Customer>(
    //   future: LoginController(context).checkSessionCst(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       nameEditingController.text = snapshot.data.name;
    //       addressEditingController.text = snapshot.data.address;
    //       return SafeArea(
    //         child: Scaffold(
    //           appBar: AppBarWidget(context).appBar("Profile"),
    //           body: content(),
    //         ),
    //       );
    //     }
    //     return Center(child: CircularProgressIndicator());
    //   },
    // );
  }
}
