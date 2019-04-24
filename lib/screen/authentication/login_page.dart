import 'package:flutter/material.dart';
import 'package:adminapotek/utils/uidata.dart';

import 'package:adminapotek/main.dart';
import 'package:adminapotek/model/apotek_model.dart';
import 'sign_up_page.dart';
import 'sign_up_cst_page.dart';
import 'forgot_pass_page.dart';
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

  List _jenisUser = ["Pengguna", "Apoteker"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentJenisUser;
  void changedDropDownItem(String selectedJenisUser) {
    setState(() {
      _currentJenisUser = selectedJenisUser;
    });
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentJenisUser = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String jenisUser in _jenisUser) {
      items.add(
          new DropdownMenuItem(value: jenisUser, child: new Text(jenisUser)));
    }
    return items;
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
                image: new ExactAssetImage('assets/icon/logoapotek.png'),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
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
                    this.apotek.email = text;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  labelText: "Email",
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
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    value: _currentJenisUser,
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ForgotPassPage())));
              },
              child: Text(
                "Lupa Password ?",
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
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
                  LoginController(context).sendData(apotek, _currentJenisUser);
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: ((context) => MyApp())));
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            FlatButton(
              onPressed: () {
                if (_currentJenisUser.contains("Apoteker")) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => SignUpPage())));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SignUpCstPage())));
                }
              },
              child: Text(
                "Belum punya akun? SIGN UP",
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
