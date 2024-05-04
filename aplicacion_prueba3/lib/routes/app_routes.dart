import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pages.dart';
import 'package:flutter_application_1/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => LoginPage(),
    'carro_compras': (BuildContext context) => const CarroCompras(),
    'detalle_producto': (BuildContext context) => const DetalleProducto(),
    'pago': (BuildContext context) => const PaginaPago(),
    'registro_cliente': (BuildContext context) => const RegistroCliente(),
    'resultado_busqueda': (BuildContext context) => const ResultadoBusqueda(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
