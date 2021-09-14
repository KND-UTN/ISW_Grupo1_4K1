import 'package:flutter/material.dart';
import 'package:tp6/lo_que_sea_menu.dart';
import 'package:tp6/map_selector.dart';
import 'package:tp6/payment_method.dart';
import 'package:tp6/descripcion.dart';
import 'package:tp6/horario.dart';
import 'package:tp6/destino.dart';
import 'package:tp6/Credit_card.dart';
import 'package:tp6/screens/home_screen.dart';
import 'package:tp6/ok.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF8A4EDE),
        accentColor: Color(0xFFEAD8F1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      title: 'DeliverEat',
      home: HomeScreen(),
      routes: {
        '/menu': (context) => LoQueSeaMenu(),
        '/direcciones/origen': (context) => MapSelector(),
        '/direcciones/destino': (context) => Destino(),
        '/forma_pago': (context) => PaymentMethods(),
        '/forma_pago/tarjeta': (context) => CreditCard(),
        '/descripcion': (context) => Descripcion(),
        '/horario': (context) => Horario(),
        '/ok': (context) => OkScreen(),
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
