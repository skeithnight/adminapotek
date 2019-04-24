import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:userpet/screens/dashboard/dashboard_one.page.dart';

import 'package:adminapotek/screen/authentication/login_page.dart';
import 'package:adminapotek/data.dart' as data;
import 'package:adminapotek/controller/login_controller.dart';
import 'order/order_page.dart';
import 'profile/profile_page.dart';
import 'widget/appbar_widget.dart';
import 'package:adminapotek/model/apotek_model.dart';
import 'apotek/home_apotek_page.dart';
import 'pengguna/home_pengguna_page.dart';
import 'pengguna/about_page.dart';
import 'pengguna/account_page.dart';

import 'apotek/profil_page.dart';
import 'apotek/data_obat_page.dart';

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
          Tab(text: "Account"),
        ],
      );
  Widget pengguna() => new DefaultTabController(
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
  Widget apotek() => new Stack(
        children: <Widget>[
          new Center(
            child: Container(
              height: 300.0,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            new ExactAssetImage('assets/icon/logoapotek.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: RaisedButton(
                            padding: EdgeInsets.all(12.0),
                            shape: StadiumBorder(),
                            child: Text(
                              "Data Obat",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.green,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) => DataObatPage())));
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: RaisedButton(
                            padding: EdgeInsets.all(12.0),
                            shape: StadiumBorder(),
                            child: Text(
                              "Profil",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.green,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) => ProfilPage())));
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          new Positioned(
            child: new Align(
              alignment: FractionalOffset.bottomRight,
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.exit_to_app),
                  color: Colors.red,
                  onPressed: () {
                    LoginController(context).logout();
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: ((context) => MyApp())));
                  },
                ),
              ),
            ),
          ),
        ],
      );
  Widget content() => new FutureBuilder<String>(
        future: LoginController(context).checkSession(level),
        builder: ((context, snapshot) {
          // print(snapshot.data);
          if (snapshot.hasData) {
            if (level.contains("Apotek")) {
              return apotek();
            } else {
              return pengguna();
            }
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
