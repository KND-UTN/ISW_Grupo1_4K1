import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;


final estado_mapa = new GlobalKey<_MapScreenState>();
final estado_selector = new GlobalKey<_AddressSelectorState>();


class MapSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: Stack(
        children: [
          MapScreen(key: estado_mapa),
          Positioned(top: 50.0, left: 10.0, child: BackButton()),
          Positioned(bottom: 0, left: 0, right: 0, child: AddressSelector(key: estado_selector),),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Continuar',
              style: TextStyle(color: Color(0xFF4ea8de)),
            ),
          ),
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  MapScreen({required Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPositiion = CameraPosition(
      target: LatLng(-31.41670784207306, -64.18360221409914), zoom: 12);

  Marker _marcador = Marker(markerId: const MarkerId('marcador'));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPositiion,
        markers: {_marcador},
        onLongPress: _addMarkerAndUpdateAddress,
      ),
    );
  }

  void _addMarker(LatLng pos) {
    setState(() {
      _marcador = Marker(
          markerId: const MarkerId('marcador'),
          infoWindow: const InfoWindow(title: 'marcador'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos);
    });
  }

  Future<void> _addMarkerAndUpdateAddress(LatLng pos) async {
    setState(() {
      _marcador = Marker(
          markerId: const MarkerId('marcador'),
          infoWindow: const InfoWindow(title: 'marcador'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos);
    });

    final queryParameters = {
      'key': 'AIzaSyCUB5OtErzNYvJfNzBM7oAhgcwZf0kBkqc',
      'latlng': pos.latitude.toString() + "," + pos.longitude.toString(),
    };

    final url = Uri.https(
        'maps.googleapis.com', '/maps/api/geocode/json', queryParameters);
    var response = await http.get(url);
    var json_response = json.decode(response.body);

    estado_selector.currentState!.updateDireccion(
        json_response["results"][0]["formatted_address"].toString());
  }
}

class BackButton extends StatelessWidget {
  BackButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(147, 147, 147, 0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded),
        color: Colors.black,
        onPressed: () {},
      ),
    );
  }
}

class AddressSelector extends StatefulWidget {
  AddressSelector({required Key key}) : super(key: key);

  @override
  _AddressSelectorState createState() => _AddressSelectorState();
}

class _AddressSelectorState extends State<AddressSelector> {
  final controller_direccion = TextEditingController();
  final controller_edificio = TextEditingController();
  final controller_notas = TextEditingController();
  final controller_test = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffDDDDDD),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: const EdgeInsets.only(top: 10.0),
            height: 5,
            width: 200,
          ),
          Text(controller_test.text),
          Container(
              width: 350,
              child: TextField(
                controller: controller_direccion,
                onSubmitted: (value) {
                  updateMarker();
                },
                decoration: InputDecoration(
                  labelText: 'Dirección',
                ),
              )),
          Container(
              margin: const EdgeInsets.only(top: 15.0),
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Edificio / Departamento',
                ),
              )),
          Container(
              margin: const EdgeInsets.only(top: 15.0),
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Notas al repartidor',
                ),
              )),
        ],
      ),
    );
  }

  void updateMarker() async {
    final queryParameters = {
      'key': 'AIzaSyCUB5OtErzNYvJfNzBM7oAhgcwZf0kBkqc',
      'address': controller_direccion.text,
    };

    final url = Uri.https(
        'maps.googleapis.com', '/maps/api/geocode/json', queryParameters);
    var response = await http.get(url);
    var json_response = json.decode(response.body);

    setState(() {
      controller_direccion.text =
          json_response["results"][0]["formatted_address"].toString();
    });

    estado_mapa.currentState!._addMarker(LatLng(
        json_response["results"][0]["geometry"]["location"]["lat"],
        json_response["results"][0]["geometry"]["location"]["lng"]));
  }

  void updateDireccion(String direccion) {
    controller_direccion.text = direccion;
  }
}
