import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'detail_order_page.dart';
import 'package:adminapotek/model/order_model.dart';

class OrderPage extends StatefulWidget {
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Widget content() {
    return new FutureBuilder<List<Order>>(
      future: OrderController(context).getListData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          // return Container();
          return listData(snapshot.data);
        } else if (snapshot.hasError) {
          return new Center(child: Text("${snapshot.error}"));
        }

        return new Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget listData(List<Order> listData) {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) => Card(
              elevation: 5.0,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DetailOrderPage('detail', listData[index])));
                },
                title: Text(listData[index].customer.name),
                subtitle: Text(listData[index].note),
                trailing: Text(listData[index].status),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context).appBar("Order"),
      body: content(),
    );
  }
}
