import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:adminapotek/data.dart' as data1;
// import 'package:adminapotek/model/courier_model.dart';
import 'package:adminapotek/screen/widget/dialog_widget.dart';
import 'package:adminapotek/screen/main_screen.dart';
import 'package:adminapotek/model/obat_model.dart';
class ProductController {
  SharedPreferences prefs;
  BuildContext context;
  ProductController(this.context);
  Dio dio = new Dio();

  Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  // Obat
  Future<List<Obat>> getDataObat() async {
    prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "Authorization": "Bearer " + prefs.getString('token') ?? ''
    };
    dio.options.baseUrl = data1.urlObat;

    var response = await dio.get('/Apotek/${prefs.getString('idApotek')}');
    List<dynamic> map = response.data;
    List<Obat> listObat = new List();
    for (var i = 0; i < map.length; i++) {
      listObat.add(Obat.fromSnapshot(map[i]));
    }
    return listObat;
  }
  void sendDataObat(Obat Obat) async {
    if (checkDataObat(Obat)) {
      getToken().then((onValue) {
        insertDataObat(Obat, onValue);
      });
    } else {
      DialogWidget(context: context, dismiss: true)
          .tampilDialog("Failed", "The Data cannot empty!", () {});
    }
  }

  void insertDataObat(Obat Obat, String token) async {
    prefs = await SharedPreferences.getInstance();
    Obat.idApotek = prefs.getString("idApotek");
    // print(json.encode(courier.idApotek));
    dio.options.headers = {"Authorization": "Bearer " + token};
    dio.options.data = Obat.toJsonInsert();
    dio.options.baseUrl = data1.urlObat;

    var response = await dio.post('');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      DialogWidget(context: context, dismiss: true)
          .tampilDialog("Success", "Success on saving data...", MainScreen());
    } else {
      // If that response was not OK, throw an error.
      DialogWidget(context: context, dismiss: true)
          .tampilDialog("Failed", "Error on saving data", () {});
    }
  }

  bool checkDataObat(Obat Obat) {
    if (Obat.name == null ||
        Obat.descrition == null ||
        Obat.price == null) {
      return false;
    }
    return true;
  }

}
