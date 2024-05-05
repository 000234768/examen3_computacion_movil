import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/providers/producto.dart';
Future<List<Producto>> getProductos() async {
  final response = await http.get(Uri.parse('https://firestore.googleapis.com/v1/projects/prueba3-72c15/databases/(default)/documents/productos'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> documentos = data['documents'] ?? [];
    
    final List<Producto> productos = documentos.map((doc) {
      final Map<String, dynamic> fields = doc['fields'];
      return Producto(
        nombre: fields['Nombre']['stringValue'] ?? 'Sin nombre',
        imagen: fields['Imagen']['stringValue'] ?? 'Sin imagen',
        costo: (fields['Costo']['doubleValue'] as num?)?.toDouble() ?? 0,
      );
    }).toList();

    return productos;
  } else {
    throw Exception('Failed to load products');
  }
}
