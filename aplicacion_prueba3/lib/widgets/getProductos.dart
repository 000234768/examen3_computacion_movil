import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getProductDetails(String searchTerm) async {
  final response = await http.get(Uri.parse('https://firestore.googleapis.com/v1/projects/prueba3-72c15/databases/(default)/documents/productos/$searchTerm'));

  if (response.statusCode == 200) {
    print('Response body: ${response.body}'); 
    final Map<String, dynamic> data = json.decode(response.body);
    final Map<String, dynamic> fields = data['fields'];
    
    // Mapea todos los campos relevantes
    final String nombre = fields['Nombre']['stringValue'];
    final String imagen = fields['Imagen']['stringValue'];
    final String descripcion = fields['Descripcion']['stringValue'];
    final double costo = fields['Costo']['doubleValue'];

    return {
      'Nombre': nombre,
      'Imagen': imagen,
      'Descripcion': descripcion,
      'Costo': costo,
    };
  } else {
    throw Exception('Failed to load product details');
  }
}
