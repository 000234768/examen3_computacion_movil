import 'package:flutter/material.dart';

class CarroComprasPage extends StatefulWidget {
  final List<Map<String, dynamic>> productos;

  CarroComprasPage({required this.productos});

  @override
  _CarroComprasPageState createState() => _CarroComprasPageState();
}

class _CarroComprasPageState extends State<CarroComprasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de compras'),
      ),
      body: ListView.builder(
        itemCount: widget.productos.length,
        itemBuilder: (context, index) {
          final producto = widget.productos[index];
          return ExpansionTile(
            title: Text(producto['Nombre']),
            subtitle: Text('\$${producto['Costo']}'),
            children: [
              ListTile(
                title: Text('Descripción: ${producto['Descripcion']}'),
                leading: Image.network(producto['Imagen']),
              ),
              ListTile(
                title: Text('ID: ${producto['ID']}'),
              ),
              // Agrega más detalles según sea necesario
            ],
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.productos.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para proceder al pago
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
