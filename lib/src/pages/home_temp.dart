import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  final options = ['uno', 'dos', 'tres', 'cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compoentes Temporales'),
      ),
      body: ListView(
        children: _createItems2(),
      ),
    );
  }

  //metodo que devolvera una lista de widget de tipo ListTile 1 forma
  List<Widget> _createItems() {
    List<Widget> list = List<Widget>();

    for (String item in options) {
      final tempWidget = ListTile(
        title: Text(item),
      );
      list
        ..add(tempWidget)
        //agregar divisor 1 forma
        //  list.add(Divider());
        //agregar divisor 2 forma, con el .. me regresa al operador original (operador cascasa)
        ..add(Divider());
    }
    return list;
  }

//metodo que devolvera una lista de widget de tipo ListTile 2 forma
  List<Widget> _createItems2() {
    //map devuelve una nueva lista iterable en el mismo orden,
    var widget = options
        .map((x) => Column(
              children: <Widget>[
                ListTile(
                  title: Text('$x ####'),
                  subtitle: Text('subtitulo'),
                  //widget que se coloca al inicio
                  leading: Icon(Icons.ac_unit),
                  //widget que se coloca al final
                  trailing: Icon(Icons.adb),
                  //metodo que se ejecuta al hacer click a un elemento de la lista, sirve para la navegacion
                  onTap: () {},
                ),
                Divider(),
              ],
            ))
        .toList();
    return widget;
  }
}
