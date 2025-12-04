// Aquí aprenderemos: Row y Expanded para distribución equitativa


import 'package:flutter/material.dart';
import '../screens/carrito_screen.dart'; 


class BarraNavegacion extends StatelessWidget {
  final int indiceActual;
  final Function(int) onTap;

  const BarraNavegacion({
    super.key,
    required this.indiceActual,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      // ROW: Organiza los botones horizontalmente
      child: Row(
      children: [
        // EXPANDED: Cada botón ocupa el mismo espacio
        _buildBotonNav(context, 0, Icons.home, 'Inicio'),
        _buildBotonNav(context, 1, Icons.search, 'Buscar'),
        _buildBotonNav(context, 2, Icons.favorite, 'Favoritos'),
        _buildBotonNav(context, 3, Icons.shopping_cart, 'Carrito'),
        _buildBotonNav(context, 4, Icons.person, 'Perfil'),
      ],
    ),
    );
  }

  Widget _buildBotonNav(BuildContext context, int indice, IconData icono, String label) {
  final bool estaActivo = indice == indiceActual;
  return Expanded(
    child: GestureDetector(
      onTap: () {
        if (indice == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CarritoScreen()),
          );
        } else {
          onTap(indice);
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, color: estaActivo ? Colors.blue : Colors.grey, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: estaActivo ? Colors.blue : Colors.grey,
                fontSize: 11,
                fontWeight: estaActivo ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
