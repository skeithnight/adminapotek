import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:adminapotek/screen/widget/appbar_widget.dart';
import 'package:adminapotek/controller/order_controller.dart';
import 'package:adminapotek/model/order_model.dart';
import 'package:adminapotek/model/customer_model.dart';
import 'package:adminapotek/controller/login_controller.dart';
import 'edit_acc_page.dart';

class CariObatPage extends StatefulWidget {
  _CariObatPageState createState() => _CariObatPageState();
}

class _CariObatPageState extends State<CariObatPage> {
  Completer<GoogleMapController> _controller = Completer();

  // Future<Position> getMyLocation() async {
  //   Position position = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   return position;
  // }

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId("1"),
      position: LatLng(-6.922189, 107.610197),
      infoWindow: InfoWindow(
        onTap: () {
          Navigator.pop(context);
        },
        title: 'Apotek Ating',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.922189, 107.610197),
    zoom: 10.0,
  );

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(-6.922189, 107.610197),
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          // Max Size
          GoogleMap(
            myLocationEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _markers,
          ),
          new Positioned(
            child: new Align(
                alignment: FractionalOffset.topCenter,
                child: Card(
                  child: TextField(
                    decoration: InputDecoration(icon: Icon(Icons.search)),
                  ),
                )),
          ),
          new Positioned(
            child: new Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: 160.0,
                      child: new InkWell(
                        onTap: _goToTheLake,
                        child: Card(
                          child: Center(
                            child: Text("Apotek"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: 160.0,
                      child: Card(
                          child: Center(
                        child: Text("Apotek"),
                      )),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: 160.0,
                      child: Card(
                          child: Center(
                        child: Text("Apotek"),
                      )),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: 160.0,
                      child: Card(
                          child: Center(
                        child: Text("Apotek"),
                      )),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: 160.0,
                      child: Card(
                          child: Center(
                        child: Text("Apotek"),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
