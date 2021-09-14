import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'package:tp6/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliverEat',
      home: LoQueSeaMenu(),
    );
  }
}

class LoQueSeaMenu extends StatefulWidget {
  @override
  _LoQueSeaMenuState createState() => _LoQueSeaMenuState();
}

class _LoQueSeaMenuState extends State<LoQueSeaMenu> {
  TextEditingController str_origen = TextEditingController();
  TextEditingController str_destino = TextEditingController();
  TextEditingController str_descripcion = TextEditingController();
  TextEditingController str_pago = TextEditingController();
  TextEditingController str_horario = TextEditingController();

  _LoQueSeaMenuState() {
    str_origen.text = "Sin seleccionar";
    str_destino.text = "Sin seleccionar";
    str_descripcion.text = "Sin seleccionar";
    str_pago.text = "Sin seleccionar";
    str_horario.text = "Sin seleccionar";
  }

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
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  height: 75,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Creá tu pedido",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linearGradient))),
                  )),
              Container(
                  height: 5,
                  width: 300,
                  decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(147, 147, 147, .6),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(10.0)),
                      gradient: new LinearGradient(
                          colors: [Color(0xffDA44bb), Color(0xff8921aa)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          tileMode: TileMode.clamp))),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 90.0,
                    margin: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(147, 147, 147, .6),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                        gradient: new LinearGradient(
                            colors: [Color(0xff7400b8), Color(0xff5E60CE)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.clamp)),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new CircleAvatar(
                              radius: 35.0,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage("assets/images/map.png"),
                            )),
                        new Expanded(
                            child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Dirección de Origen',
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              str_origen.text,
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.white70),
                            ),
                            new SizedBox(
                              height: 10.0,
                            ),
                          ],
                        )),
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new TextButton(
                                  onPressed: () async {
                                    final respuesta = await Navigator.pushNamed(
                                        context, '/direcciones/origen');
                                    setState(() {
                                      if (respuesta != null) {
                                        str_origen.text = respuesta.toString();
                                      }
                                      ;
                                    });
                                  },
                                  child: Text("Seleccionar",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 90.0,
                    margin: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(147, 147, 147, .6),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                        gradient: new LinearGradient(
                            colors: [Color(0xff5E60CE), Color(0xff4EA8DE)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.clamp)),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new CircleAvatar(
                              radius: 35.0,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage("assets/images/address.png"),
                            )),
                        new Expanded(
                            child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Dirección de Destino',
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              str_destino.text,
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.white70),
                            ),
                            new SizedBox(
                              height: 10.0,
                            ),
                          ],
                        )),
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new TextButton(
                                  onPressed: () async {
                                    final result = await Navigator.pushNamed(
                                        context, '/direcciones/destino');

                                    if (result != null) {
                                      setState(() {
                                        str_destino.text = result.toString();
                                      });
                                    }
                                  },
                                  child: Text("Seleccionar",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 90.0,
                    margin: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(147, 147, 147, .6),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                        gradient: new LinearGradient(
                            colors: [Color(0xff56CFE1), Color(0xff4EA8DE)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.clamp)),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new CircleAvatar(
                              radius: 35.0,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage("assets/images/camera.png"),
                            )),
                        new Expanded(
                            child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Descripción',
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              str_descripcion.text,
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.white70),
                            ),
                            new SizedBox(
                              height: 10.0,
                            ),
                          ],
                        )),
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new TextButton(
                                  onPressed: () async {
                                    final result = await Navigator.pushNamed(
                                        context, '/descripcion');
                                    if (result != null) {
                                      setState(() {
                                        str_descripcion.text =
                                            result.toString();
                                      });
                                    }
                                  },
                                  child: Text("Seleccionar",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 90.0,
                    margin: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(147, 147, 147, .6),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                        gradient: new LinearGradient(
                            colors: [Color(0xff4EA8DE), Color(0xff56CFE1)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.clamp)),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new CircleAvatar(
                              radius: 35.0,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage("assets/images/cash-payment.png"),
                            )),
                        new Expanded(
                            child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Forma de Pago',
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              'Sin seleccionar',
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.white70),
                            ),
                            new SizedBox(
                              height: 10.0,
                            ),
                          ],
                        )),
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/forma_pago');
                                  },
                                  child: Text("Seleccionar",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 90.0,
                    margin: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(147, 147, 147, .6),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                        gradient: new LinearGradient(
                            colors: [Color(0xff4EA8DE), Color(0xff5E60CE)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.clamp)),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new CircleAvatar(
                              radius: 35.0,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage("assets/images/clock.png"),
                            )),
                        new Expanded(
                            child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Horario',
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              str_horario.text,
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.white70),
                            ),
                            new SizedBox(
                              height: 10.0,
                            ),
                          ],
                        )),
                        new Padding(
                            padding:
                                new EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new TextButton(
                                  onPressed: () async {
                                    final result = await Navigator.pushNamed(
                                        context, '/horario');

                                    if (result != null) {
                                      setState(() {
                                        str_horario.text = result.toString();
                                      });
                                    }
                                  },
                                  child: Text("Seleccionar",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ))
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
              if (globals.bool_origen &&
                  globals.bool_destino &&
                  globals.bool_descripcion &&
                  globals.bool_pago &&
                  globals.bool_horario) {
                if (globals.str_origen_ciudad == globals.str_destino_ciudad) {
                  Navigator.pushNamed(context, 'ok');
                } else {
                  mostrarErrorDirecciones(context);
                }
              }
              mostrarErrorSelecciones(context);
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

  void mostrarErrorDirecciones(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Las ciudades no concuerdan.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Aceptar'),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  void mostrarErrorSelecciones(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: const Text(
            'Debe completar todas las opciones para completar el pedido.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Aceptar'),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}
