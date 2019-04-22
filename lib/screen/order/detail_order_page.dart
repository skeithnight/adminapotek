import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:adminapotek/data.dart' as data1;
import 'package:adminapotek/model/order_model.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/screen/widget/maps_widget.dart';
import 'package:adminapotek/model/detail_transaksi_model.dart';

class DetailOrderPage extends StatefulWidget {
  String level = "detail";
  Order _order = new Order();
  DetailOrderPage(this.level, this._order);
  _DetailOrderPageState createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  final WebSocketChannel channel = IOWebSocketChannel.connect(
      "ws://35.231.59.91:8080/get-ws-Order/5c10af71535a234d990b109f");

  Order order = new Order();
  bool aa = true;
  bool isloading = false;

  var nameEditingController = new TextEditingController();
  var usernameEditingController = new TextEditingController();

  void initState() {
    super.initState();
    setState(() {
      order = widget._order;
      nameEditingController.text = widget._order.customer.name;
    });
  }

  Widget orderContent() => Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        child: Card(
          elevation: 2.0,
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Text(
                order.customer.name,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              )),
              ListTile(
                title: Text("Note"),
                subtitle: Text(order.note),
              ),
              ListTile(
                title: Text("Total Tagihan"),
                subtitle: Text("Rp. ${hitungTagihan(order)}"),
              ),
              showExpansionTile("List Obat", order.produk)
            ],
          ),
        ),
      );

  Widget showExpansionTile(String title, List<DetailTransaksi> listData) {
    List<Widget> listDataWidget = [];
    for (var item in listData) {
      listDataWidget.add(new ListTile(
        title: Text(item.service.nama),
        subtitle: Text("Jumlah : ${item.jumlah}"),
        trailing: Text("Rp. ${item.jumlah * item.service.harga}"),
      ));
    }
    return ExpansionTile(
      title: Text(title),
      children: listDataWidget,
    );
  }

  double hitungTagihan(Order order) {
    double totalProduk = 0;

    for (var item in order.produk) {
      totalProduk = totalProduk + (item.jumlah * item.service.harga);
    }
    return totalProduk;
  }

  Widget content() => new Center(
          child: Column(
        children: <Widget>[
          Expanded(
            flex: 12,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // Container()
                    orderContent(),
                  ],
                ),
              ),
            ),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Order"),
          backgroundColor: Colors.lightGreen,
        ),
        // body: Container(),
        body: content(),
        // bottomNavigationBar: widget.level == "add" ? saveButton() : Container(),
      ),
    );
  }
}
