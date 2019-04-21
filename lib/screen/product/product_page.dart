import 'package:flutter/material.dart';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'data_obat/data_obat_page.dart';

class ProductPage extends StatefulWidget {
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void gotoPage(nama) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DataObatPage()));
  }

  Widget cardMenu(IconData icon, String nama) => new InkWell(
        onTap: () {
          gotoPage(nama);
        },
        child: Container(
          child: Card(
            child: Center(
              child: Column(
                children: <Widget>[
                  Icon(
                    icon,
                    size: 100.0,
                  ),
                  Text(nama)
                ],
              ),
            ),
          ),
        ),
      );
  Widget content() => new Center(
      child: Container(
          width: 300.0,
          height: 500.0,
          child: Column(
            children: <Widget>[
              // cardMenu(Icons.fastfood, "Produk"),
              cardMenu(Icons.content_cut, "Grooming"),
              cardMenu(Icons.local_hospital, "Clinic"),
              cardMenu(Icons.hotel, "Hotel")
            ],
          )));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context).appBar("Product"),
      body: content(),
    );
  }
}
