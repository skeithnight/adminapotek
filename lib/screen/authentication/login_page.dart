import 'package:flutter/material.dart';
import 'package:adminapotek/utils/uidata.dart';

import 'package:adminapotek/main.dart';
import 'package:adminapotek/model/apotek_model.dart';
import 'sign_up_page.dart';
import 'package:adminapotek/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Apotek apotek = new Apotek();
  Size deviceSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(context),
      ),
    );
  }

  loginBody(context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[loginHeader(), loginFields(context)],
        ),
      );

  loginHeader() => Column(
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
          Text(
            "Welcome to ${UIData.appName}",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign in to continue",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  loginFields(context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                onChanged: (text) {
                  setState(() {
                    this.apotek.username = text;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter your username",
                  labelText: "Username",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                onChanged: (text) {
                  setState(() {
                    this.apotek.password = text;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  LoginController(context).sendData(apotek);
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: ((context) => MyApp())));
                },
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SignUpPage())));
              },
              child: Text(
                "SIGN UP FOR AN ACCOUNT",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      );
}
