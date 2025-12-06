// lib/widgets/cantidad_selector.dart
import 'package:flutter/material.dart';

class CantidadSelector extends StatefulWidget {
  final int valorInicial;
  final int minimo;
  final int maximo;
  final ValueChanged<int> onChanged;

  const CantidadSelector({
    super.key,
    this.valorInicial = 1,
    this.minimo = 1,
    this.maximo = 10,
    required this.onChanged,
  });

  @override
  State<CantidadSelector> createState() => _CantidadSelectorState();
}

class _CantidadSelectorState extends State<CantidadSelector> {
  late int _cantidad;

  @override
  void initState() {
    super.initState();
    _cantidad = widget.valorInicial.clamp(widget.minimo, widget.maximo);
  }

  void _incrementar() {
    setState(() {
      if (_cantidad < widget.maximo) {
        _cantidad++;
        widget.onChanged(_cantidad);
      }
    });
  }

  void _decrementar() {
    setState(() {
      if (_cantidad > widget.minimo) {
        _cantidad--;
        widget.onChanged(_cantidad);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Botón de decremento
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: _decrementar,
            icon: const Icon(Icons.remove),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
        // Contenedor del número
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: Text('$_cantidad'),
          ),
        ),
        // Botón de incremento
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: _incrementar,
            icon: const Icon(Icons.add),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }
}