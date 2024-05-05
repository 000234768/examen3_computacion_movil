import 'package:flutter/material.dart';

class CarritoCompras extends ChangeNotifier {
  List<Map<String, dynamic>> productos = [];

  void agregarProducto(Map<String, dynamic> producto) {
    productos.add(producto);
    notifyListeners();
  }

  void eliminarProducto(int index) {
    productos.removeAt(index);
    notifyListeners();
  }
}
