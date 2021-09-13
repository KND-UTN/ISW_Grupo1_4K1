import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliverEat',
      home: PaymentMethods(),
    );
  }
}

class PaymentMethods extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: _PaymentMethods(),
    );
  }
}

const ktext = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.w900,
);

class _PaymentMethods extends StatelessWidget {
  String cantidad = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      body: Container(
        margin: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Formas de pago',
                  style: new TextStyle(
                    color: Color.fromRGBO(78, 168, 222, 1.0),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                GestureDetector(
                    child: Icon(
                      Icons.fastfood,
                      color: Color.fromRGBO(78, 168, 222, 1.0),
                      size: 30,
                    )),
              ],
            ),
            //ESPACIO
            Padding(
              padding: const EdgeInsets.only(top: 25),
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
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                      child: new CircleAvatar(radius: 35.0, backgroundImage: AssetImage('images/tarjeta-de-credito (3).png'))
                  ),
                  new Expanded(child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('Tarjeta de Credito', style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                      new SizedBox(height: 8.0,),
                      new Text('SOLO VISA', style: new TextStyle(fontSize: 12.0, color: Colors.white70),),
                      new SizedBox(height: 10.0,),
                      new RaisedButton( onPressed: (){
                        //Ruta a la pantalla de la tarjeta
                      },
                        child:
                        Text("Seleccionar", style: TextStyle(
                            color: Colors.blue.shade600,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        ),
                        textColor: Colors.blue,
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: 10,
                            bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0)
                        ),
                      )
                    ],)),

                ],),
            ),
            //ESPACIO
            Padding(
              padding: const EdgeInsets.only(top: 25),
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
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                      child: new CircleAvatar(radius: 35.0, backgroundImage:  AssetImage('images/efectivo.png'))
                  ),
                  new Expanded(child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('Efectivo', style: new TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
                      new SizedBox(height: 8.0,),
                      new SizedBox(height: 10.0,),
                      new RaisedButton( onPressed: (){
                        showDialog(context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Debe ingresar con cuánto va a pagar:"),
                              content: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  cantidad = value;
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: "\$"
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: (){
                                      Navigator.of(context).pop("Ok");
                                      int cantidadInt = int.parse(cantidad);
                                      if(cantidadInt > 999999){
                                        showDialog(context: context,
                                            builder: (BuildContext context) => AlertDialog(
                                              title: Text("El monto ingresado es demasiado grande!"),
                                              content: Text("Vuelva a intentar.",),
                                              actions: <Widget>[
                                                FlatButton(
                                                    onPressed: (){
                                                      Navigator.of(context).pop("Ok",);
                                                    },
                                                    child: Text("Ok"))
                                              ],
                                            )
                                        );
                                      }
                                      else{
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text("Ok",))
                              ],
                            )
                        );
                      },
                        child:
                        Text("Seleccionar", style: TextStyle(
                            color: Colors.blue.shade600,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        ),
                        textColor: Colors.blue,
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: 10,
                            bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0)
                        ),
                      )
                    ],)),
                ],),
            )
          ],
        ),
      ),
    );
  }
}

