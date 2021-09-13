import 'package:flutter/material.dart';
import 'package:tp6/lo_que_sea_menu.dart';
import 'package:tp6/map_selector.dart';
import 'package:tp6/payment_method.dart';
import 'package:tp6/descripcion.dart';
import 'package:tp6/horario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliverEat',
      home: MyHome(),
      routes: {
        '/menu': (context) => LoQueSeaMenu(),
        '/direcciones/origen': (context) => MapSelector(),
        '/direcciones/destino': (context) => MapSelector(),
        '/forma_pago': (context) => PaymentMethods(),
        '/descripcion': (context) => Descripcion(),
        '/horario': (context) => Horario(),
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/menu');
          },
          child: Text("Lo que sea (boton)")),
    ));
  }
}
