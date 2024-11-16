import 'package:flutter/material.dart';
import 'package:inicio_de_sesion/pantalla_inicio.dart';
import 'package:inicio_de_sesion/pantalla_registro.dart';
import 'package:inicio_de_sesion/pantalla_sesion.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea 2.1',
      initialRoute: 'pantalla1',
      routes: {
        'pantalla1': (context) => pantalla_inicio(),
        'pantalla2': (context) => pantalla_registro(),
        'pantalla3': (context) => pantalla_sesion(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
