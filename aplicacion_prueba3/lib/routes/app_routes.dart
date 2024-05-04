import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/ingreso_cliente.dart';
import 'package:flutter_application_1/pages/home.dart';

class AppRouter {
  static const String initialRoute = '/ingreso_cliente'; 
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage()); //raiz
      case '/ingreso_cliente':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text('Página no encontrada'),
            ),
            body: Center(
              child: Text('La ruta ${settings.name} no existe en la aplicación.'),
            ),
          ),
        );
    }
  }
}
