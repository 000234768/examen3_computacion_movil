import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pages.dart';
import 'package:flutter_application_1/pages/resultados.dart';

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
      case '/restablece_contrasena':
        return MaterialPageRoute(builder: (_) => RestableceContrasena());
      case '/registro_cliente':
        return MaterialPageRoute(builder: (_) => RegistroCliente());
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
