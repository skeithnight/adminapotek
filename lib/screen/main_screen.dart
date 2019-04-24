import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:userpet/screens/dashboard/dashboard_one.page.dart';

import 'package:adminapotek/screen/authentication/login_page.dart';
import 'package:adminapotek/data.dart' as data;
import 'package:adminapotek/controller/login_controller.dart';
import 'order/order_page.dart';
import 'package:adminapotek/screen/product/data_obat/data_obat_page.dart';
import 'profile/profile_page.dart';
import 'widget/appbar_widget.dart';
import 'package:adminapotek/model/apotek_model.dart';
import 'apotek/home_apotek_page.dart';
import 'pengguna/home_pengguna_page.dart';
import 'pengguna/about_page.dart';
import 'pengguna/account_page.dart';

class MainScreen extends StatefulWidget {
  static String tag = 'main-page';
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String level;
  SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialized();
  }

  void initialized() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      this.level = prefs.getString("level");
    });
    LoginController(context).checkToken(level);
  }

  Widget bottomNavigator() => TabBar(
        labelColor: Colors.black,
        tabs: <Widget>[
          Tab(
            text: "Home",
          ),
          Tab(
            text: "About",
          ),
          Tab(
              text: "Account"),
        ],
      );

  Widget content() => new FutureBuilder<String>(
        future: LoginController(context).checkSession(level),
        builder: ((context, snapshot) {
          // print(snapshot.data);
          if (snapshot.hasData) {
            return DefaultTabController(
              length: 4,
              child: SafeArea(
                child: Scaffold(
                  appBar: bottomNavigator(),
                  body: TabBarView(
                    children: <Widget>[
                      new HomePenggunaPage(),
                      new AboutPage(),
                      new AccountPage(),
                    ],
                  ),
                  // bottomNavigationBar: bottomNavigator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            // throw(snapshot.error);
            return new Center(
                child: Container(
              height: 500.0,
              child: Text("${snapshot.error}"),
            ));
          }

          return new Center(child: CircularProgressIndicator());
        }),
      );
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.yellow,
      home: Scaffold(
        body: content(),
      ),
    );
  }
}
