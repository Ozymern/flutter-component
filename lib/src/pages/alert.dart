import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Alert'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('alert'),
            textColor: Colors.white,
            onPressed: () {
              _showAlert(context);
            },
            color: Colors.blue,
            shape: StadiumBorder(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_return),
          //metodo que me devuelve a la pagina anterior
          onPressed: () => Navigator.pop(context),
        ));
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        // se puede cerrar la alerta haciendo click afuera
        barrierDismissible: true,
        //construllo mi alert
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0)),
            title: Text('titulo'),
            content: Column(
              //para que se adapte al contenido interno
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('contenido del alert'),
                Divider(),
                FlutterLogo(
                  size: 80.0,
                )
              ],
            ),
            //agrego los botones
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK')),
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancelar'))
            ],
          );
        });
  }
}
