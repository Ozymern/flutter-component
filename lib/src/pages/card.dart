import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: ListView(
        //agregaremos un padding
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2()
        ],
      ),
    );
  }

  _cardType1() {
    //retornare una tarjeta
    return Card(
      // elevation es la sombra que la tarjeta va a proyectar
      elevation: 10.0,
      //hacer mas pronunciado los bordes
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
      //los child pueden devolver cualquier cosa
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.lightBlueAccent,
            ),
            title: Text('titulo'),
            subtitle: Text('subtitulo de tarjeta'),
          ),
          //agrego 2 botones de manera horizontal
          Row(
            //aliniamos la linea para queeste en la parte derecha
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () => {}, child: Text('Cancelar')),
              FlatButton(onPressed: () => {}, child: Text('OK'))
            ],
          )
        ],
      ),
    );
  }

  _cardType2() {
    return Card(
      //clipBehavior ayuda a que nada de la tarjeta se salga del contenido de la misma
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      // elevation es la sombra que la tarjeta va a proyectar
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          // widget para hacer loading, el placeholder es la imagen por defecto y debe estar en el dispositivo
          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            //  NetworkImage cargo la imagen desde una url
            image: NetworkImage(
                'https://www.recreoviral.com/wp-content/uploads/2016/04/Fotograf%C3%ADas-de-osos-haciendo-cosas-de-humanos-24.jpg'),
            //agrego tiempo en aparecer la imagen
            fadeInDuration: Duration(milliseconds: 200),
            height: 260.0,
            //fit sirve para indicar que la imagen debe ocupar el espacio que tiene
            fit: BoxFit.contain,
          ),

          //container similar a un DIV
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('texto card '),
          )
        ],
      ),
    );
  }
}
