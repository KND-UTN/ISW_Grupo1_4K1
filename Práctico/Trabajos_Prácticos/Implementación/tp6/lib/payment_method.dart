import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

const ktext = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.w900,
);

class PaymentMethods extends StatelessWidget {
  Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  String cantidad = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
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
      body: Container(
        margin: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 75,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Forma de pago",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()..shader = linearGradient))),
                    )),
              ],
            ),
            //ESPACIO
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '  ',
                style: ktext,
              ),
            ),
            Container(
              height: 150.0,
              margin: new EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [Color(0xffDA44bb), Color(0xff8921aa)],
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
                        backgroundImage: AssetImage(
                            'assets/images/tarjeta-de-debito (1).png'),
                        backgroundColor: Colors.white,
                      )),
                  new Expanded(
                      child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'Tarjeta de Crédito',
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      new SizedBox(
                        height: 8.0,
                      ),
                      new Text(
                        'SOLO VISA',
                        style: new TextStyle(
                            fontSize: 12.0, color: Colors.white70),
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      new RaisedButton(
                        onPressed: () async {
                          final resultado = await Navigator.pushNamed(context, '/forma_pago/tarjeta');
                          if (resultado != null)
                            {
                              Navigator.pop(context, resultado.toString());
                            }
                        },
                        child: Text(
                          "Seleccionar",
                          style: TextStyle(
                              color: Colors.blue.shade600,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        textColor: Colors.blue,
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0)),
                      )
                    ],
                  )),
                ],
              ),
            ),
            //ESPACIO
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '  ',
                style: ktext,
              ),
            ),
            Container(
              height: 150.0,
              margin: new EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [Color(0xff8921aa), Color(0xffDA44bb)],
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
                        backgroundImage:
                            AssetImage('assets/images/efectivo.png'),
                        backgroundColor: Colors.white,
                      )),
                  new Expanded(
                      child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'Efectivo',
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      new SizedBox(
                        height: 8.0,
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      new RaisedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: Text(
                                        "Debe ingresar con cuánto va a pagar:"),
                                    content: TextField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        cantidad = value;
                                      },
                                      decoration: InputDecoration(
                                          filled: true, hintText: "\$"),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop("Ok");
                                            int cantidadInt =
                                                int.parse(cantidad);
                                            if (cantidadInt > 999999) {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext
                                                          context) =>
                                                      AlertDialog(
                                                        title: Text(
                                                            "El monto ingresado es demasiado grande!"),
                                                        content: Text(
                                                          "Vuelva a intentar.",
                                                        ),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(
                                                                  "Ok",
                                                                );
                                                              },
                                                              child: Text("Ok"))
                                                        ],
                                                      ));
                                            } else {
                                              if (cantidad.toString() == "0" || cantidad.toString() == "")
                                                {
                                                  errorMonto(context);
                                                }
                                              else
                                                {
                                                  Navigator.pop(context, r"Efectivo: $" + cantidad.toString());
                                                }
                                            }
                                          },
                                          child: Text(
                                            "Ok",
                                          ))
                                    ],
                                  ));
                        },
                        child: Text(
                          "Seleccionar",
                          style: TextStyle(
                              color: Colors.blue.shade600,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        textColor: Colors.blue,
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0)),
                      )
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void errorMonto(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: const Text(
            'Debe ingresar un monto'),
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
