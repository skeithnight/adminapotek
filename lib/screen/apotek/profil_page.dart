import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:adminapotek/utils/changeDate.dart';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';
import 'package:adminapotek/model/customer_model.dart';
import 'package:adminapotek/controller/login_controller.dart';
import 'edit_profil_page.dart';

class ProfilPage extends StatefulWidget {
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  // Apotek apotek = new Apotek();
  bool isloading = false;

  var nameEditingController = new TextEditingController();
  var ttlEditingController = new TextEditingController();
  var jkEditingController = new TextEditingController();
  var emailEditingController = new TextEditingController();
  var noTelpEditingController = new TextEditingController();
  var namaApotekEditingController = new TextEditingController();

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
                            vertical: 16.0, horizontal: 30.0),
                        child: TextField(
                          enabled: false,
                          controller: jkEditingController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: "Jenis Kelamin",
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
                          enabled: false,
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
                          enabled: false,
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
                  child: RaisedButton(
                    padding: EdgeInsets.all(12.0),
                    shape: StadiumBorder(),
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => EditProfilPage())));
                    },
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
        appBar: AppBar(),
        body: content(),
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
