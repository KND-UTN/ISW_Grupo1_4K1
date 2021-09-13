import 'package:tp6/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:time_picker_widget/time_picker_widget.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliverEat',
      home: Horario(),
    );
  }
}

class Horario extends StatefulWidget {
  @override
  _HorarioState createState() => _HorarioState();
}

class _HorarioState extends State<Horario> {
  late DateTime selectedDate;
  late TimeOfDay selectedHour;

  String dropdownValue = 'Córdoba';
  bool fechaSeleccionada = false;
  bool horaSeleccionada = false;
  String fecha = "";
  String hora = "";

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
          margin: const EdgeInsets.only(top: 10.0, left: 15, right: 10),
          child: Column(
            children: [
              Container(
                  height: 75,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Horario de entrega",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linearGradient))),
                  )),
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
                              AssetImage("assets/images/schedule.png"),
                        )),
                    new Expanded(
                        child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          'Fecha',
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        new Text(
                          fechaSeleccionada == false
                              ? 'Sin seleccionar'
                              : fecha.toString(),
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
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month,
                                            DateTime.now().day + 7))
                                    .then((date) {
                                  setState(() {
                                    initializeDateFormatting('es_MX', null);
                                    fechaSeleccionada = true;
                                    fecha = DateFormat.MMMMd('es_MX')
                                        .format(date!);
                                    selectedDate = date;
                                  });
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
                              AssetImage("assets/images/clock.png"),
                        )),
                    new Expanded(
                        child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          'Hora',
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        new Text(
                          horaSeleccionada == false
                              ? 'Sin seleccionar'
                              : hora.toString(),
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
                                showCustomTimePicker(
                                    context: context,
                                    // It is a must if you provide selectableTimePredicate
                                    onFailValidation: (context) =>
                                        print('Unavailable selection'),
                                    initialTime: TimeOfDay(hour: 20, minute: 0),
                                    selectableTimePredicate: (time) =>
                                        time!.hour > 8 && time.hour <= 23).then(
                                    (time) => setState(() {
                                          hora = time!.format(context);
                                          horaSeleccionada = true;
                                          print(time.hour);
                                          selectedHour = time;
                                        }));
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
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
            height: 120.0,
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 500,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      globals.bool_horario = true;
                      Navigator.pop(context, "Lo antes posible");
                    },
                    child: const Text(
                      'Lo antes posible',
                      style: TextStyle(color: Color(0xFF4ea8de)),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                ),
                Container(
                  height: 60,
                  width: 500,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (fechaSeleccionada == false ||
                          horaSeleccionada == false) {
                        errorNoCampos(context);
                      } else {
                        if (DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                selectedHour.hour,
                                selectedHour.minute)
                            .isBefore(DateTime.now())) {
                          errorHoraMenor(context);
                        } else {
                          globals.bool_horario = true;
                          Navigator.pop(context, fecha + ", " + hora);
                        }
                      }
                    },
                    child: const Text(
                      'Continuar',
                      style: TextStyle(color: Color(0xFF4ea8de)),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void errorHoraMenor(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text("La fecha y hora debe ser mayor o igual a la actual."),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Aceptar'),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  void errorNoCampos(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text("Debe seleccionar fecha y hora para continuar"),
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
