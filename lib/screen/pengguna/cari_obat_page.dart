import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:adminapotek/model/apotek_model.dart';
import 'package:adminapotek/controller/apotek_controller.dart';
import 'detail_apotek_page.dart';

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
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.922189, 107.610197),
    zoom: 10.0,
  );

  Future<List<Apotek>> getData() async {
    List<Apotek> data = await ApotekController(context).getListDataApotek();
    return data;
  }

  Widget showMap(List<Apotek> data) {
    data.forEach((item) => _markers.add(Marker(
          markerId: MarkerId(item.id),
          position: LatLng(item.latitude == null ? 0 : item.latitude,
              item.longitude == null ? 0 : item.longitude),
          infoWindow: InfoWindow(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => DetailApotek())));
            },
            title: item.name,
          ),
          icon: BitmapDescriptor.defaultMarker,
        )));
    return GoogleMap(
      myLocationEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: _markers,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Apotek>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: new Scaffold(
                appBar: AppBar(),
                body: Stack(
                  children: <Widget>[
                    // Max Size
                    showMap(snapshot.data),
                    new Positioned(
                      child: new Align(
                          alignment: FractionalOffset.topCenter,
                          child: Card(
                            child: TextField(
                              decoration:
                                  InputDecoration(icon: Icon(Icons.search)),
                            ),
                          )),
                    ),
                    new Positioned(
                      child: new Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          height: 100.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(10.0),
                                width: 160.0,
                                child: new InkWell(
                                  onTap: () {
                                    _goToTheApotek(new LatLng(
                                        snapshot.data[index].latitude == null
                                            ? 0
                                            : snapshot.data[index].latitude,
                                        snapshot.data[index].longitude == null
                                            ? 0
                                            : snapshot.data[index].longitude));
                                  },
                                  child: Card(
                                    child: Center(
                                      child: Text(
                                          snapshot.data[index].name == null
                                              ? "-"
                                              : snapshot.data[index].name),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Future<void> _goToTheApotek(LatLng latlng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latlng, zoom: 19.151926040649414)));
  }
}
