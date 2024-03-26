import 'package:actividad2_computacion_movil/pages/CalculadoraSueldo.dart';
import 'package:actividad2_computacion_movil/pages/IMC.dart';
import 'package:actividad2_computacion_movil/pages/Principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Actividad 2 Computación Móvil",
      initialRoute: "/",
      routes: {
        "/": (context) => const Principal(),
        "calcular_imc": (context) => const IMC(),
        "calcular_sueldo": (context) => const CalculadoraSueldo(),
      },
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent)),
    );
  }
}
