import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:userpet/screens/dashboard/dashboard_one.page.dart';

import 'package:adminapotek/screen/authentication/login_page.dart';
import 'package:adminapotek/data.dart' as data;
import 'package:adminapotek/controller/login_controller.dart';
import 'order/order_page.dart';
import 'package:adminapotek/screen/product/product_page.dart';
import 'profile/profile_page.dart';
import 'widget/appbar_widget.dart';
import 'package:adminapotek/model/apotek_model.dart';

class MainScreen extends StatefulWidget {
  static String tag = 'main-page';
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String token;
  SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginController(context).checkToken();
  }

  Widget bottomNavigator() => TabBar(
        labelColor: Colors.black,
        tabs: <Widget>[
          Tab(
            icon: new Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            text: "Order",
          ),
          Tab(
            icon: new Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
            text: "Product",
          ),
          Tab(
              icon: new Icon(
                Icons.store,
                color: Colors.black,
              ),
              text: "Profile"),
        ],
      );

  Widget content() => 
  new FutureBuilder<Apotek>(
        future: LoginController(context).checkSession(),
        builder: ((context, snapshot) {
          // print(snapshot.data);
          if (snapshot.hasData) {
            return DefaultTabController(
              length: 4,
              child: SafeArea(
                child: Scaffold(
                  body: TabBarView(
                    children: <Widget>[
                      new OrderPage(),
                      new ProductPage(),
                      new ProfilePage(),
                    ],
                  ),
                  bottomNavigationBar: bottomNavigator(),
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
