import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_shifter/mask_shifter.dart';
import 'package:credit_card_validate/credit_card_validate.dart';
import 'package:easy_mask/easy_mask.dart';
import 'dart:ui' as ui;
import 'package:tp6/globals.dart' as globals;


const ktext = TextStyle(
  color: Colors.lightBlue,
  fontSize: 24,
  fontWeight: FontWeight.w900,
);

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  double value = 0;
  String nombre = "";
  String numeroTarjeta = "";
  String vencimiento = "";
  String cvc = "";

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
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlipCard(
              key: cardKey,
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                height: 190.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    gradient: new LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent],
                        begin: Alignment.centerLeft, end: Alignment.centerRight, tileMode: TileMode.clamp)),
                child:
                Stack(
                  children:[
                    Positioned(
                      bottom: 75,
                      left: 10,
                      child: Container(
                        child: new Row(
                          children: [
                            Text(numeroTarjeta, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),),
                    Positioned(
                      bottom: 50,
                      left: 10,
                      child: Container(
                        child: new Row(
                          children: [
                            Text(vencimiento, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),),
                    Positioned(
                      bottom: 25,
                      left: 10,
                      child: Container(
                        child: new Row(children: [
                          new Text(nombre, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                        ],),
                      ),),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: Container(
                        child: new Text("VISA", style: new TextStyle(fontSize: 40.0, color: Colors.white70, fontWeight: FontWeight.bold),),),)
                  ],
                ),
              ),
              back: Container(
                height: 190.0,
                margin: new EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    gradient: new LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent],
                        begin: Alignment.centerLeft, end: Alignment.centerRight, tileMode: TileMode.clamp)),
                child:
                Stack(
                  children:[
                    Positioned(
                      bottom: 80,
                      right: 80,
                      child: Container(
                        child: new Row(
                          children: [
                            Text(cvc, style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              onTap: () {
                if(!cardKey.currentState!.isFront)
                {
                  cardKey.currentState!.toggleCard();
                };
              },
              style: new TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  nombre = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: new TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),
                filled: true,
                labelText: "Nombre y apellido",

              ),
            ),
            SizedBox(height: 20,),
            TextField(
              onTap: (){
                if(!cardKey.currentState!.isFront)
                {
                  cardKey.currentState!.toggleCard();
                };
              },
              style: new TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),
              inputFormatters: [TextInputMask(mask: "9999-9999-9999-9999")],
              keyboardType: TextInputType.number,
              maxLength: 19,
              onChanged: (value) {
                setState(() {
                  numeroTarjeta = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: new TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),
                filled: true,
                labelText: "Número de la tarjeta",
              ),
            ),
            TextField(
              onTap: (){
                if(!cardKey.currentState!.isFront)
                {
                  cardKey.currentState!.toggleCard();
                };
              },
              style: new TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),
              inputFormatters: [
                MaskedTextInputFormatterShifter(
                    maskONE: "XX/XX", maskTWO: "XX/XX"),
              ],
              keyboardType: TextInputType.datetime,
              maxLength: 5,
              onChanged: (value) {
                setState(() {
                  vencimiento = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: new TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),
                filled: true,
                labelText: "Fecha de vencimiento",
              ),
            ),
            TextField(
              style: new TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),
              keyboardType: TextInputType.datetime,
              maxLength: 3,
              onTap: () {
                if(cardKey.currentState!.isFront)
                  {
                    cardKey.currentState!.toggleCard();
                  };
              },
              onChanged: (value) {
                setState(() {
                  cvc = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: new TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),
                filled: true,
                labelText: "Código de seguridad",
              ),
            )
          ],
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

              bool flag1 = false;
              bool flag2 = false;
              bool flag3 = false;
              bool flag4 = false;
              if (nombre == "" || (cvc == "" || cvc.length < 3) || (numeroTarjeta == "" || numeroTarjeta.length < 19) || vencimiento == "") {
                flag1 = true;
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text("No puede dejar campos vacios o incompletos!",),
                      content: Text("Vuelva a intentar.",),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop("Ok");
                            },
                            child: Text("Ok",)
                        )
                      ],
                    ));
              }

              if (numeroTarjeta[0] != "4") {
                flag2 = true;
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text("La tarjeta que usted ingreso no es VISA!",),
                      content: Text("Vuelva a intentar.",),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop("Ok");
                            },
                            child: Text("Ok",)
                        )
                      ],
                    ));
              }

              if (CreditCardValidator.isCreditCardValid(cardNumber: numeroTarjeta.replaceAll("-", "")) == false || numeroTarjeta.length < 19) {
                flag3 = true;
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text("El número de tu tarjeta de crédito no es válido.",),
                      content: Text("Vuelva a intentar.",),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop("Ok");
                            },
                            child: Text("Ok",)
                        )
                      ],
                    ));
              }
              if(flag1 == false && flag2 == false && flag3 == false){
                var fecha = DateTime.now().toString();
                fecha = fecha.replaceAll('/','-');

                DateTime date = DateTime.parse(fecha);
                String anio = date.year.toString();
                String anio2 = anio.substring(2,4);
                String mes = date.month.toString();
                String subAnio = vencimiento.substring(3,5);
                String subMes = vencimiento.substring(0,2);
                if(double.parse(subAnio) < double.parse(anio2) || (double.parse(mes) > double.parse(subMes) && double.parse(subAnio) == double.parse(anio2))){
                  flag4 = true;
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text("La tarjeta ha expirado segun la fecha de vencimiento ingresada",),
                        content: Text("Vuelva a intentar.",),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop("Ok");
                              },
                              child: Text("Ok",)
                          )
                        ],
                      ));
                }
              }
              if (flag1 == false && flag2 == false && flag3 == false && flag4 == false) {
                Navigator.pop(context, "");
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

  void errorVisa(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: const Text(
            'La tarjeta ingresada no es VISA.'),
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



