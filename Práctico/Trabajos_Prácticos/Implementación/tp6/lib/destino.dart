import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tp6/globals.dart' as globals;
import 'dart:ui' as ui;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliverEat',
      home: Destino(),
    );
  }
}

class Destino extends StatefulWidget {
  @override
  _DestinoState createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  String dropdownValue = globals.str_destino_ciudad;

  Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("DeliverEat",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient))),
          backgroundColor: Colors.white,
          elevation: 5,
          automaticallyImplyLeading: true,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return ui.Gradient.linear(
                    Offset(4.0, 24.0),
                    Offset(24.0, 4.0),
                    [Color(0xffDA44bb), Color(0xff8921aa)],
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 36.0,
                )),
          )),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 10.0, left: 15, right: 30),
          child: Column(
            children: [
              Container(
                  height: 75,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Dirección de entrega",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linearGradient))),
                  )),
              Container(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: 220,
                    child: TextField(
                      controller: globals.controller_destino_direccion,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Dirección',
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        iconSize: 24,
                        elevation: 16,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Córdoba', 'Río Primero', 'Carlos Paz']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ],
              ),
              Container(
                height: 30,
              ),
              TextField(
                controller: globals.controller_destino_referencias,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Referencias',
                ),
              ),
              Container(
                height: 30,
              ),
            ],
          ),
        ),
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
            onPressed: () {
              if(globals.controller_destino_direccion.text == "")
                {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Error'),
                      content: Text("Debe completar la dirección"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Aceptar'),
                          child: const Text('Aceptar'),
                        ),
                      ],
                    ),
                  );
                }
              else
                {
                  Navigator.pop(context, globals.controller_destino_direccion.text);
                }
            },
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
