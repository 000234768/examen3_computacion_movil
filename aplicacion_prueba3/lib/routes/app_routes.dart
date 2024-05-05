import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pages.dart';

class AppRouter {
  static const String initialRoute = '/ingreso_cliente'; 
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage()); // Ruta raíz
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
              title: const Text('Página no encontrada'),
            ),
            body: Center(
              child: Text('La ruta ${settings.name} no existe en la aplicación.'),
            ),
          ),
        );
    }
  }
}
