import 'package:flutter/material.dart';

class LoQueSeaMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/direcciones/origen');
              },
              child: Text("Origen")),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/direcciones/destino');
              },
              child: Text("Destino")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, '/forma_pago');
          }, child: Text("Forma de pago")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, '/descripcion');
          }, child: Text("Descripcion")),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, '/horario');
          }, child: Text("Horario")),
          TextButton(onPressed: () { }, child: Text("Finalizar"))
        ],
      ),
    ));
  }
}
