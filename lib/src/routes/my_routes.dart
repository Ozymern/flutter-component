import 'package:flutter/material.dart';
import 'package:flutter_component/src/pages/Home.dart';
import 'package:flutter_component/src/pages/alert.dart';
import 'package:flutter_component/src/pages/animated_container.dart';
import 'package:flutter_component/src/pages/avatar.dart';
import 'package:flutter_component/src/pages/card.dart';
import 'package:flutter_component/src/pages/input_page.dart';
import 'package:flutter_component/src/pages/listview_page.dart';
import 'package:flutter_component/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => Home(),
    'avatar': (BuildContext context) => Avatar(),
    'alert': (BuildContext context) => Alert(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListPage(),
  };
}
