import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:adminapotek/utils/uidata.dart';

import 'package:adminapotek/model/apotek_model.dart';
import 'login_page.dart';
import 'package:adminapotek/controller/register_controller.dart';

class SignUpPage extends StatefulWidget {
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Apotek apotek = new Apotek();
  Size deviceSize;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: signUpBody(context),
      ),
    );
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
          Container(
            width: 80.0,
            height: 80.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://pngimage.net/wp-content/uploads/2018/05/apotek-icon-png-8.png")),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign Up",
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
                    this.apotek.name = text;
                  });
                },
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter your apotek name",
                  labelText: "Apotek Name",
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
                  hintText: "Enter your apotek permission",
                  labelText: "Apotek Permission",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    this.apotek.username = text;
                  });
                },
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter your username",
                  labelText: "Username",
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
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 3,
                onChanged: (text) {
                  setState(() {
                    this.apotek.address = text;
                  });
                },
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Enter your address",
                  labelText: "Address",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                onChanged: (text) {
                  setState(() {
                    this.apotek.latitude = double.parse(text);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your latitude",
                  labelText: "Laitude",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                onChanged: (text) {
                  setState(() {
                    this.apotek.longitude = double.parse(text);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your longitude",
                  labelText: "Longitude",
                ),
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
                        "SIGN UP",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          this.isloading = true;
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
                "Already have an account",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      );
}
