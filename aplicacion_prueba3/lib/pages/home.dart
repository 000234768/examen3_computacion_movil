import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/widgets/header.dart';
import 'package:flutter_application_1/widgets/footer.dart';

// Modelo de Producto
class Producto {
  final String nombre;
  final String imagen;
  final double costo;

  Producto({
    required this.nombre,
    required this.imagen,
    required this.costo,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Función para obtener los datos de la API
  Future<Producto> getProductDetails(String productName) async {
    final response = await http.get(
      Uri.parse(
          'https://firestore.googleapis.com/v1/projects/prueba3-72c15/databases/(default)/documents/productos/$productName'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> fields = data['fields'];

      // Extrae los datos necesarios
      final String nombre = fields['Nombre']['stringValue'];
      final String imagen = fields['Imagen']['stringValue'];
      final double costo = fields['Costo']['doubleValue'];

      return Producto(
        nombre: nombre,
        imagen: imagen,
        costo: costo,
      );
    } else {
      throw Exception('Failed to load product details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyHeader(),
        body: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<Producto>(
                  future: getProductDetails('notebook'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final producto = snapshot.data!;
                      return Column(
                        children: [
                          Image.network(producto.imagen),
                          Text(producto.nombre),
                          Text('\$${producto.costo.toStringAsFixed(2)}'),
                        ],
                      );
                    }
                  },
                ),
                FutureBuilder<Producto>(
                  future: getProductDetails('mouse'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final producto = snapshot.data!;
                      return Column(
                        children: [
                          Image.network(producto.imagen),
                          Text(producto.nombre),
                          Text('\$${producto.costo.toStringAsFixed(2)}'),
                        ],
                      );
                    }
                  },
                ),
                FutureBuilder<Producto>(
                  future: getProductDetails('pantallas'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final producto = snapshot.data!;
                      return Column(
                        children: [
                          Image.network(producto.imagen),
                          Text(producto.nombre),
                          Text('\$${producto.costo.toStringAsFixed(2)}'),
                        ],
                      );
                    }
                  },
                ),
                FutureBuilder<Producto>(
                  future: getProductDetails('Teclados'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final producto = snapshot.data!;
                      return Column(
                        children: [
                          Image.network(producto.imagen),
                          Text(producto.nombre),
                          Text('\$${producto.costo.toStringAsFixed(2)}'),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 100, // Altura del footer
          child: MyFooter(),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Producto Demo',
    home: HomePage(),
  ));
}
