import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/getProductos.dart'; 

class MyHeader extends StatefulWidget implements PreferredSizeWidget {
  @override
  _MyHeaderState createState() => _MyHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 40);
}

class _MyHeaderState extends State<MyHeader> {
  String searchTerm = ''; 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/prueba3-72c15.appspot.com/o/logo.jpg?alt=media',
                width: 40,
                height: 40,
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.blue),
                onPressed: () async {
                  // Manejador de eventos del botón de búsqueda
                  try {
                    // Obtiene los detalles del producto utilizando la función getProductDetails
                    Map<String, dynamic> resultado = await getProductDetails(searchTerm);
                    // Navega a la página de resultados y muestra el resultado
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultadosPage(searchTerm: searchTerm, resultado: resultado),
                      ),
                    );
                  } catch (e) {
                    // Maneja errores aquí
                    print('Error al obtener detalles del producto: $e');
                  }
                },
              ),
              Container(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    // Actualiza el término de búsqueda cuando cambia el texto en el campo de búsqueda
                    setState(() {
                      searchTerm = value;
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.blue),
                onPressed: () {
                  // Manejador de eventos del botón de carrito de compras
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Manejador de eventos del botón de categorías
                },
                child: Text(
                  'Categorías',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Manejador de eventos del botón de contacto
                },
                child: Text(
                  'Contacto',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ResultadosPage extends StatelessWidget {
  final String searchTerm;
  final Map<String, dynamic> resultado; // Cambia el tipo de resultado a Map

  const ResultadosPage({Key? key, required this.searchTerm, required this.resultado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados de búsqueda'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resultados para:',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      searchTerm,
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Nombre: ${resultado['Nombre']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Descripción: ${resultado['Descripcion']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Costo: \$${resultado['Costo']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                  
                    SizedBox(
                      height: 200, 
                      child: Image.network(
                        resultado['Imagen'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Volver'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
