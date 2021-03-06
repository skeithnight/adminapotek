import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:adminapotek/data.dart' as data;
import 'package:adminapotek/model/apotek_model.dart';
import 'package:adminapotek/screen/widget/dialog_widget.dart';
import 'package:adminapotek/screen/authentication/login_page.dart';
import 'package:adminapotek/screen/authentication/sign_up_page.dart';

class RegisterController {
  BuildContext context;
  RegisterController(this.context);
  Dio dio = new Dio();
  Apotek apotek = new Apotek();
  void sendData(Apotek _apotek) async {
    apotek = _apotek;

    if (checkData() && checkData() != null) {
      // print(apotek.toJsonRegister());
      var response =
          await dio.post(data.urlApotekRegister, data: apotek.toJsonRegister());
      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        DialogWidget(context: context, dismiss: true)
            .tampilDialog("Success", "Success to save data..", LoginPage());
      } else {
        // If that response was not OK, throw an error.
      DialogWidget(context: context, dismiss: true)
          .tampilDialog("Failed", "Server data error", (){});
      }
    } else {
      DialogWidget(context: context, dismiss: true)
          .tampilDialog("Failed", "The Data cannot empty!", (){});
    }
  }

  bool checkData() {
    bool result = false;
    if (apotek != null) {
      if (apotek.email != null ||
          apotek.name != null ||
          apotek.password != null ||
          apotek.latitude != null ||
          apotek.longitude != null ||
          apotek.address != null) {
        result = true;
      }
    }
    return result;
  }
}
