import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() {
    return _InputPageState();
  }
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _animalSelect = 'gato';
  // TextEditingController me permite tener una relacion con la caja de texto, cambiar sus valores
  TextEditingController _inputFieldDateController = TextEditingController();

  List<String> _animals = ['perro', 'gato', 'osos', 'aves', 'bufalos'];

  List<DropdownMenuItem<String>> getOptDrowndown() {
    List<DropdownMenuItem<String>> list = List();
    _animals.forEach((animal) {
      list.add(DropdownMenuItem(
        //child lo que se va a mostrar
        child: Text(animal),
        value: animal,
      ));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('input'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createPerson(),
          Divider(),
          _createInputEmail(),
          Divider(),
          _createInputPass(),
          Divider(),
          _createInputDate(context),
          Divider(),
          _createInputDropdown(context),
        ],
      ),
    );
  }

  Widget _createInput() {
    //textFiled para crear un input
    return TextField(
      autofocus: true,
      //capitalizacion por sentencia, despues de un espacio la letra que sigue es mayuscula
      textCapitalization: TextCapitalization.sentences,
      //decorar el inpur
      decoration: InputDecoration(
          counter: Text('Letras ${_name.length}'),
          hintText: 'Escriba su nombre',
          labelText: 'Nombre',
          //texto que aparece abajo del input
          helperText: 'nombre y apellido',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.donut_large),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      onChanged: (x) {
        //para redibujar el widget
        setState(() {
          _name = x;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre es  : $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_animalSelect),
    );
  }

  Widget _createInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      //decorar el inpur
      decoration: InputDecoration(
          hintText: 'Escriba su email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.email),
          icon: Icon(Icons.alternate_email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      onChanged: (x) {
        //para redibujar el widget
        setState(() {
          _email = x;
        });
      },
    );
  }

  Widget _createInputPass() {
    return TextField(
      //para que no se vea lo que estoy escribiendo
      obscureText: true,
      //decorar el inpur
      decoration: InputDecoration(
          hintText: 'Escriba su Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock_outline),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      onChanged: (x) {
        //para redibujar el widget
        setState(() {
          _password = x;
        });
      },
    );
  }

  Widget _createInputDate(BuildContext contex) {
    return TextField(
      //relacioneno con la propiedad TextEditingController
      controller: _inputFieldDateController,
      //para que no pueda copiar informacion de el mismo
      enableInteractiveSelection: false,
      //decorar el inpur
      decoration: InputDecoration(
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_view_day),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),

      //similar a hacer click
      onTap: () {
        //quito el foco de materialize
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020),
        //cambio de idioma
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        String _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _createInputDropdown(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
            //valor actual de la opcion seleccionada
            value: _animalSelect,
            items: getOptDrowndown(),
            onChanged: (data) {
              setState(() {
                _animalSelect = data;
              });
            })
      ],
    );
  }
}
