import 'package:flutter/material.dart';
import 'package:flutter_component/src/services/menu_provider.dart';
import 'package:flutter_component/src/utils/icons_util.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: _list());
  }

  Widget _list() {
    //  print(menuProvider.options);
//    menuProvider.loadData().then((data) {
//      print(data);
//    });

    return FutureBuilder(
      //future esta enlazada con lo que estamos esperando
      future: menuProvider.loadData(),
      //la informacion por defecto mientras no se ha resuelto el future, es opcional
      initialData: [],
      //builder me permitira dibujar en el dispositivo, debe de regresar un widget, napshot.data= traera la informacion del future
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, context) {
    final List<Widget> opt = [];
    data.forEach((x) {
      final widgetTemp = ListTile(
          title: Text(x['text']),
          leading: Icon(Icons.build, color: Colors.lightBlueAccent),
          trailing: getIcon(x['icon']),
          onTap: () {
            //1 forma de navegacion ideal cuando se requiere ir solamente a una ruta en especifico
            //rutas, devuelve la pagina a ir
//            final route = MaterialPageRoute(builder: (context) {
//              return Alert();
//            });
            //metodo para navegar a la siguiente pagina no es reutilizable este metodo
            // Navigator.push(context, route);
            //2 forma de navegar
            Navigator.pushNamed(context, x['routes']);
          });
      opt..add(widgetTemp)..add(Divider());
    });
    return opt;
  }
}
