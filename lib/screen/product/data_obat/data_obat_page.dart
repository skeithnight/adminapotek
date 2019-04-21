import 'package:flutter/material.dart';
import 'package:adminapotek/screen/widget/appbar_widget.dart';

import 'package:adminapotek/controller/product_controller.dart';
import 'package:adminapotek/model/obat_model.dart';
import 'detail_obat_page.dart';

class DataObatPage extends StatefulWidget {
  _DataObatPageState createState() => _DataObatPageState();
}

class _DataObatPageState extends State<DataObatPage> {
  Widget content() => new FutureBuilder<List<Obat>>(
        future: ProductController(context).getDataObat(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return listData(snapshot.data);
          } else if (snapshot.hasError) {
            return new Center(child: Text("${snapshot.error}"));
          }

          return new Center(child: CircularProgressIndicator());
        },
      );

  Widget listData(List<Obat> listData) {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) => Card(
              elevation: 5.0,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DetailObatPage('detail', listData[index])));
                },
                title: Text(listData[index].name),
                subtitle: Text(listData[index].price.toString()),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context).appBar("Daftar Obat"),
      body: content(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailObatPage("add", null)));
        },
        tooltip: 'Tambah Produk',
        child: Icon(Icons.add),
      ),
    );
  }
}
