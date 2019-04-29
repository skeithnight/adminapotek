import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adminapotek/model/order_model.dart';

import 'package:adminapotek/data.dart' as data1;
import 'package:adminapotek/screen/widget/dialog_widget.dart';
import 'package:adminapotek/main.dart';
import 'package:adminapotek/model/apotek_model.dart';

class ApotekController {
  SharedPreferences prefs;

  BuildContext context;
  ApotekController(this.context);

  Dio dio = new Dio();
  // Get Data
  Future<List<Apotek>> getListDataApotek() async {
    prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "Authorization": "Bearer " + prefs.getString('token') ?? ''
    };
    dio.options.baseUrl = data1.urlApotek;

    var response = await dio.get('');
    List<dynamic> map = response.data;
    print(map[0]['id']);
    List<Apotek> listApotek = new List();
    for (var i = 0; i < map.length; i++) {
      listApotek.add(
          Apotek.fromSnapshot(map[i]));
    }
    return listApotek;
  }
}
