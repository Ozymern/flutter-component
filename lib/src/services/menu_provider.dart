import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List options = [];

  var dataMap;

  _MenuProvider() {}

  Future<List<dynamic>> loadData() async {
    //metodo para leer el archivo estatico con el json, el cual regresa un Future
    //Para obtener el valor que representa Future, se usa el método then(), pasándole como parámetro una función de callback que será llamada con el valor del Future.
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    options = dataMap['routes'];

    return options;
  }
}

//clase privada que solo sera llamada por menuProvider
final menuProvider = _MenuProvider();
