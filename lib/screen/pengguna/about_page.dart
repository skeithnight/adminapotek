import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';

String text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mattis justo mi, sit amet vehicula orci pharetra eget. Mauris ac sagittis nunc. Sed blandit justo arcu, at faucibus metus porttitor nec. Nam ac nulla sed purus gravida placerat vel in felis. Morbi nec tellus venenatis, consequat tellus a, dapibus diam. Quisque non consequat ligula. Morbi sit amet urna nec mauris pharetra dignissim. Donec eget justo vitae nibh consequat aliquet. Suspendisse ac placerat felis. Pellentesque non nibh eget orci maximus dignissim. Donec ultrices ante lectus, fringilla imperdiet libero condimentum non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo lacinia enim eget ultricies. Phasellus ac odio at dolor auctor suscipit ac sed magna.";

class AboutPage extends StatefulWidget {
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Widget content() {
    return new Center(
      child: Container(
        width: 300.0,
        height: 200.0,
        child: Text(text)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(context).appBar("Order"),
      body: content(),
    );
  }
}
