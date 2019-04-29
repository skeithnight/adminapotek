import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:adminapotek/data.dart' as data1;
import 'package:adminapotek/model/apotek_model.dart';
import 'package:adminapotek/model/customer_model.dart';
import 'package:adminapotek/screen/widget/dialog_widget.dart';
import 'package:adminapotek/screen/main_screen.dart';
import 'package:adminapotek/screen/authentication/login_page.dart';

class LoginController {
  BuildContext context;
  LoginController(this.context);
  Dio dio = new Dio();
  void sendData(Apotek apotek, String level) async {
    try {
      if (checkData(apotek)) {
        try {
          print(level);
          if (level.contains("Apotek")) {
            dio.options.baseUrl = data1.urlApotekLogin;
          } else {
            dio.options.baseUrl = data1.urlCustomerLogin;
          }
          var response = await dio.post('', data: apotek.toJsonLogin());
          // If server returns an OK response, parse the JSON
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          _prefs.setString('token', response.data['token']);
          _prefs.setString('level', level);
          _prefs.commit();
          DialogWidget(context: context, dismiss: true)
              .tampilDialog("Success", "Success login..", MainScreen());
        } on DioError catch (e) {
          // The request was made and the server responded with a status code
          // that falls out of the range of 2xx and is also not 304.
          DialogWidget(context: context, dismiss: false)
              .tampilDialog("Failed", e.message, () {});
        }
      } else {
        DialogWidget(context: context, dismiss: false)
            .tampilDialog("Failed", "The Data cannot empty!", () {});
      }
    } catch (e) {
      DialogWidget(context: context, dismiss: false)
          .tampilDialog("Failed", "The Data cannot empty!", () {});
    }
  }

  bool checkData(Apotek apotek) {
    if (apotek.email == null || apotek.password == null) {
      return false;
    }
    return true;
  }

  void logout() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.clear();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => LoginPage())));
    } catch (e) {
      throw (e);
    }
  }

  Future<String> checkToken(String level) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      checkSession(level);
      if (prefs.getString('token') == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => LoginPage())));
      }
    } catch (e) {
      DialogWidget(context: context, dismiss: false)
          .tampilDialog("Failed", "The Data cannot empty!", () {});
    }
    return prefs.getString('token');
  }

  Future<String> checkSession(String level) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "Authorization": "Bearer " + prefs.getString('token') ?? ''
    };
    if (level.contains('Apotek')) {
      dio.options.baseUrl = data1.urlApotekCheckSession;
    } else {
      dio.options.baseUrl = data1.urlCustomerCheckSession;
    }
    Response response;
    try {
      response = await dio.get('');
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      print(e.message);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => LoginPage())));
    }
    return response.data.toString();
  }

  Future<Apotek> checkSessionApt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "Authorization": "Bearer " + prefs.getString('token') ?? ''
    };
    dio.options.baseUrl = data1.urlApotekCheckSession;
    Response response;
    try {
      response = await dio.get('');
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      print(e.message);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => LoginPage())));
    }
    // print(response.data);
    Apotek apotek = Apotek.fromSnapshot(response.data);
    prefs.setString("idApotek", apotek.id);
    prefs.commit();
    return apotek;
  }

  Future<Customer> checkSessionCst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      "Authorization": "Bearer " + prefs.getString('token') ?? ''
    };
    dio.options.baseUrl = data1.urlCustomerCheckSession;
    Response response;
    try {
      response = await dio.get('');
      print(response.data.toString());
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      print(e.message);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => LoginPage())));
    }
    // print(response.data);
    Customer customer = Customer.fromSnapshot(response.data);
    prefs.setString("idCst", customer.id);
    prefs.commit();
    return customer;
  }
}
