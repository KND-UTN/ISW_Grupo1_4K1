import 'dart:io';
import 'package:tp6/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliverEat',
      home: Descripcion(),
    );
  }
}

class Descripcion extends StatefulWidget {
  @override
  _DescripcionState createState() => _DescripcionState();
}

class _DescripcionState extends State<Descripcion> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Center(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                    height: 75,
                    child: Text("¿Qué debemos buscar?",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..shader = linearGradient)))),
                DottedBorder(
                  color: Color(0xffDA44bb),
                  borderType: BorderType.RRect,
                  radius: Radius.circular(30),
                  dashPattern: [32, 16],
                  strokeWidth: 10,
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Container(
                          height: 250,
                          width: 250,
                          child: (globals.bool_descripcion_hayImagen)
                              ? Container(
                                  height: 120.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(
                                            globals.file_descripcion_image!),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                )
                              : ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (Rect bounds) {
                                    return ui.Gradient.linear(
                                      Offset(4.0, 24.0),
                                      Offset(24.0, 4.0),
                                      [Color(0xffDA44bb), Color(0xff8921aa)],
                                    );
                                  },
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 150,
                                  ))),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 20.0, bottom: 15.0, left: 50),
                    child: Text("Descripción: ",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linearGradient))),
                  ),
                ),
                DottedBorder(
                    color: Color(0xffDA44bb),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(30),
                    dashPattern: [8, 4],
                    strokeWidth: 3,
                    padding: EdgeInsets.all(10),
                    child: Container(
                      margin: const EdgeInsets.only(top: 5.0, left: 5.0),
                      height: 100,
                      width: 260,
                      child: TextField(
                        controller: globals.controller_descripcion_descripcion,
                        maxLines: 8,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Ingrese la descripción'),
                      ),
                    )),
              ],
            ),
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
              if (globals.controller_descripcion_descripcion.text == "") {
                errorDescripcion(context);
              } else {
                if (5 >
                        globals
                            .controller_descripcion_descripcion.text.length ||
                    globals.controller_descripcion_descripcion.text.length >
                        280) {
                  errorLongitud(context);
                } else {
                  globals.bool_descripcion = true;
                  if (globals.controller_descripcion_descripcion.text.length >
                      15) {
                    Navigator.pop(
                        context,
                        globals.controller_descripcion_descripcion.text
                                .substring(0, 15) +
                            "...");
                  } else {
                    Navigator.pop(context,
                        globals.controller_descripcion_descripcion.text);
                  }
                }
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

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final imagen_temporal = File(image.path);

    final size = await image.length() / (1024 * 1024);
    if (size > 5) {
      errorPeso(context, size.toStringAsFixed(2));
    } else {
      setState(() {
        globals.bool_descripcion_hayImagen = true;
        globals.file_descripcion_image = imagen_temporal;
      });
    }
  }

  void errorPeso(context, String peso) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Imagen muy pesada'),
        content: Text(
            'El límite de tamaño para las imagenes es de 5MB. \nSu imagen pesa ' +
                peso +
                'MB.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Aceptar'),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  void errorDescripcion(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Descripción necesaria'),
        content: Text(
            'Recuerde que debe introducir una descripción.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Aceptar'),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  void errorLongitud(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text(
            'La cantidad de caracteres debe estar en un rango de 5 a 280.'),
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
