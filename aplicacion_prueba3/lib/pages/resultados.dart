// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widgets/getProductos.dart'; // Importa la función getProductDetails

// class ResultadosPage extends StatelessWidget {
//   final String searchTerm;
//   final List<String> resultados; // Cambia el tipo de resultados a una lista de strings

//   // Constructor para recibir el término de búsqueda y los resultados
//   const ResultadosPage({Key? key, required this.searchTerm, required this.resultados}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Resultados de búsqueda'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Resultados para:',
//                 style: TextStyle(fontSize: 24),
//               ),
//               Text(
//                 searchTerm,
//                 style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               // Mostrar las imágenes de los productos con sus detalles
//               GridView.builder(
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, // Dos imágenes por fila
//                   crossAxisSpacing: 10, // Espacio entre columnas
//                   mainAxisSpacing: 10, // Espacio entre filas
//                   childAspectRatio: 0.75, // Relación de aspecto de la imagen
//                 ),
//                 itemCount: resultados.length,
//                 itemBuilder: (context, index) {
//                   // Llama a la función getProductDetails para obtener los detalles de cada producto
//                   return FutureBuilder<Map<String, dynamic>>(
//                     future: getProductDetails(resultados[index]), // Llama a getProductDetails con el término de búsqueda
//                     builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return CircularProgressIndicator(); // Muestra un indicador de carga mientras se cargan los datos
//                       } else {
//                         if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}'); // Muestra un mensaje de error si ocurrió algún error
//                         } else {
//                           final producto = snapshot.data!;
//                           return Card(
//                             margin: EdgeInsets.all(10), // Agrega margen alrededor del card
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Image.network(
//                                   producto['imagen'],
//                                   width: double.infinity, // Ajusta el ancho de la imagen al ancho del card
//                                   height: 150, // Altura fija para la imagen
//                                   fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(8),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         producto['Nombre'],
//                                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(
//                                         '\$${producto['Costo']}',
//                                         style: TextStyle(fontSize: 14),
//                                       ),
//                                       Text(
//                                         producto['Descripcion'],
//                                         style: TextStyle(fontSize: 14),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//                       }
//                     },
//                   );
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Volver a la pantalla anterior
//                   Navigator.pop(context);
//                 },
//                 child: Text('Volver'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
