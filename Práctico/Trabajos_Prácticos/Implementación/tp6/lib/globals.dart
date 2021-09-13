library globals;
import 'dart:io';

import 'package:flutter/cupertino.dart';

bool bool_origen = false;
bool bool_destino = false;
bool bool_descripcion = false;
bool bool_pago = false;
bool bool_horario = false;

TextEditingController controller_origen_direccion = TextEditingController();
TextEditingController controller_origen_referencias = TextEditingController();

TextEditingController controller_destino_direccion = TextEditingController();
TextEditingController controller_destino_referencias = TextEditingController();
String str_destino_ciudad = "Córdoba";

TextEditingController controller_descripcion_descripcion = TextEditingController();
bool bool_descripcion_hayImagen = false;
File? file_descripcion_image;


bool destino = false;
bool descripcion = false;
bool pago = false;
bool horario = false;


