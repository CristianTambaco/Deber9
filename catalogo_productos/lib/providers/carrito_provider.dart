import 'package:flutter/foundation.dart';
import 'package:catalogo_productos/models/carrito_item.dart';
import 'package:catalogo_productos/models/producto.dart';
import 'package:catalogo_productos/services/carrito_service.dart';

class CarritoProvider with ChangeNotifier {
  final CarritoService _service = CarritoService();

  List<CarritoItem> get items => _service.obtenerItems();
  Map<String, double> get totales => _service.calcularTotales();

  Future<void> agregarProducto(Producto producto, int cantidad) async {
    try {
      await _service.agregarProducto(producto, cantidad);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> eliminarProducto(String productoId) async {
    try {
      await _service.eliminarProducto(productoId);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> actualizarCantidad(String productoId, int nuevaCantidad) async {
    try {
      await _service.actualizarCantidad(productoId, nuevaCantidad);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> vaciarCarrito() async {
    try {
      await _service.vaciarCarrito();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}