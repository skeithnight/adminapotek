import 'package:flutter/material.dart';
import 'package:adminapotek/screen/main_screen.dart';
import 'package:adminapotek/screen/authentication/login_page.dart';

final routes = {
  '/main':         (BuildContext context) => new MainScreen(),
  '/login':         (BuildContext context) => new LoginPage(),
  '/' :          (BuildContext context) => new MainScreen(),
};