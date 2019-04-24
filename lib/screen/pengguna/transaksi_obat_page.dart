import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';
import 'package:adminapotek/model/customer_model.dart';
import 'package:adminapotek/controller/login_controller.dart';
import 'edit_acc_page.dart';

class TransaksiObatPage extends StatefulWidget {
  _TransaksiObatPageState createState() => _TransaksiObatPageState();
}

class _TransaksiObatPageState extends State<TransaksiObatPage> {
  

  Widget content() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold( body: content());
  }
}
