import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/widgets/header.dart';
import 'package:flutter_application_1/widgets/footer.dart';
import 'package:flutter_application_1/widgets/card.dart';
import 'package:flutter_application_1/models/productos.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tienda online',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Nuestros Productos',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('productos')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                final List<Listado> productos = documents.map((doc) {
                  final Map<String, dynamic> data =
                      doc.data() as Map<String, dynamic>;
                  return Listado(
                    productId: 0,
                    productName: data['Nombre'] ?? 'Sin nombre',
                    productPrice: (data['Costo'] as num?)?.toInt() ?? 0,
                    productImage: data['Imagen'] ?? 'Sin imagen',
                    productState:
                        'Disponible', // Agrega el estado según lo que necesites
                  );
                }).toList();

                return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  children: productos.map((producto) {
                    return CustomCard(
                      title: producto.productName,
                      price: producto.productPrice.toDouble(),
                      url: producto.productImage,
                      buttonText: 'Agregar al carrito',
                      onPress: () {},
                    );
                  }).toList(),
                );
              },
            ),
          ),
          MyFooter(),
        ],
      ),
    );
  }
}