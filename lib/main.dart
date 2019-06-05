import 'package:flutter/material.dart';
import 'package:flutter_component/src/pages/alert.dart';
import 'package:flutter_component/src/routes/my_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //se agrega soporte de idioma
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es', 'ES'), // Hebrew
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      title: 'Flutter Component',
      debugShowCheckedModeBanner: false,
      //ruta inicial
      initialRoute: '/',
      //configuracion para las rutas (Navigator.pushNamed) routes es un map la cual esta creada en /routes/my_routes.dart
      routes: getRoutes(),
      //accion cuando se selecciona una ruta que no existe, debe devolver una ruta
      onGenerateRoute: (settings) {
        // print('ruta llamada ${settings.name}');
        return MaterialPageRoute(builder: (context) => Alert());
      },
    );
  }
}
