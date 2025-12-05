// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/carrito_provider.dart';
import 'widgets/loading_overlay.dart'; // Asegúrate de tener este archivo

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CarritoProvider(),
      child: const MiApp(),
    ),
  );
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Productos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Consumer<CarritoProvider>(
        builder: (context, carrito, child) {
          return LoadingOverlay(
            isLoading: carrito.isLoading,
            child: const HomeScreen(),
          );
        },
      ),
    );
  }
}