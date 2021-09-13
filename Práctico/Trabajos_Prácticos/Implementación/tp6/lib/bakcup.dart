import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class LoQueSeaMenu extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              "DeliverEat",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient)
              )
          ),
          backgroundColor: Colors.white12,
          elevation: 0,
          automaticallyImplyLeading: true,

          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, size: 36.0,),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
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
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new CircleAvatar(
                          radius: 35.0,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/images/map.png"),
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
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/direcciones/origen');
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
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new CircleAvatar(
                          radius: 35.0,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/images/map.png"),
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
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/direcciones/destino');
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
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
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
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
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
                        colors: [Color(0xff56CFE1), Color(0xff4EA8DE)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        tileMode: TileMode.clamp)),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
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
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/descripcion');
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
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
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
                        padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/horario');
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
              TextButton(onPressed: () {}, child: Text("Finalizar"))
            ],
          ),
        ));
  }
}
