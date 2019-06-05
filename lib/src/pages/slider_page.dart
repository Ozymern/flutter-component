import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() {
    return _SliderPageState();
  }
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImg()),
          ],
        ),
      ),
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _blockCheck,
        onChanged: (data) {
          setState(() {
            _blockCheck = data;
          });
        });
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.deepPurpleAccent,
        label: 'Tamaño de la imagen',
        divisions: 20,
        value: _valueSlider,
        min: 10.0,
        max: 200.0,
        onChanged: (_blockCheck)
            ? null
            : (data) {
                setState(() {
                  _valueSlider = data;
                });
              });
  }

  Widget _createCheckBox() {
    /* return Checkbox(
        value: _blockCheck,
        onChanged: (data) {
          setState(() {
            _blockCheck = data;
          });
        });*/
    //CheckboxListTile puedo hacer click en cualquier parte del elemento y dispara el evento onChanged
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _blockCheck,
        onChanged: (data) {
          setState(() {
            _blockCheck = data;
          });
        });
  }

  Widget _createImg() {
    return Image(
      image: NetworkImage(
          'https://t1.uc.ltmcdn.com/images/6/1/6/img_por_que_mi_gato_maulla_mucho_26616_600.jpg'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }
}
