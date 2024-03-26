import 'dart:math';

import 'package:actividad2_computacion_movil/widgets/TituloRed.dart';
import 'package:actividad2_computacion_movil/widgets/WTextfield.dart';
import 'package:flutter/material.dart';

class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  late double peso;
  late double altura;
  late double resultado = 0;

  TextEditingController ctlpeso = TextEditingController();
  TextEditingController ctlaltura = TextEditingController();

  void calcularIMC() {
    peso = double.parse(ctlpeso.text);
    altura = double.parse(ctlaltura.text);

    setState(() {
      resultado = (peso) / pow(altura, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cálcular peso corporal IMC"),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TituloRed(titulo: "IMCAPP"),
              const TituloRed(titulo: "Vida saludable"),
              const SizedBox(height: 100),
              WTextField(
                ctl: ctlpeso,
                label: "Peso en Kg",
                keyboard: TextInputType.number,
              ),
              const SizedBox(height: 30),
              WTextField(
                ctl: ctlaltura,
                label: "Altura en mts",
                keyboard: TextInputType.number,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: calcularIMC, child: const Text("Calcular IMC")),
              const SizedBox(height: 30),
              Text(
                "El IMC es de: ${resultado.toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
