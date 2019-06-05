import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerState createState() {
    return _AnimatedContainerState();
  }
}

class _AnimatedContainerState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.deepPurpleAccent;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          //duration el tiempo que va a pasar para cambiar su estado anterior al actual
          duration: Duration(milliseconds: 1200),
          //animaciones construidas por flutter
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadiusGeometry,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_changeShape()},
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeShape() {
    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromARGB(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadiusGeometry =
          BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
