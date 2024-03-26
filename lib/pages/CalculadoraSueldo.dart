import 'dart:math';

import 'package:actividad2_computacion_movil/widgets/TituloRed.dart';
import 'package:actividad2_computacion_movil/widgets/WTextfield.dart';
import 'package:flutter/material.dart';

class CalculadoraSueldo extends StatefulWidget {
  const CalculadoraSueldo({super.key});

  @override
  State<CalculadoraSueldo> createState() => _CalculadoraSueldoState();
}

class _CalculadoraSueldoState extends State<CalculadoraSueldo> {
  late String nombre;
  late int horas;
  late double valorHora;
  late String resultado = "";

  TextEditingController ctlnombre = TextEditingController();
  TextEditingController ctlhoras = TextEditingController();
  TextEditingController ctlvalorHora = TextEditingController();

  void calcularSueldo() {
    nombre = ctlnombre.text;
    horas = int.parse(ctlhoras.text);
    valorHora = double.parse(ctlvalorHora.text);

    final double sueldo = horas * valorHora;

    setState(() {
      resultado =
          "El empleado $nombre, recibirá de sueldo $sueldo. Por $horas hora(s) en $valorHora cada una";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cálcular peso corporal CalculadoraSueldo"),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TituloRed(titulo: "CalculadoraSueldoAPP"),
              const TituloRed(titulo: "Vida saludable"),
              const SizedBox(height: 10),
              WTextField(
                ctl: ctlnombre,
                label: "Nombre del empleado",
                keyboard: TextInputType.text,
              ),
              const SizedBox(height: 30),
              WTextField(
                ctl: ctlhoras,
                label: "Horas trabajadas",
                keyboard: TextInputType.number,
              ),
              const SizedBox(height: 30),
              WTextField(
                ctl: ctlvalorHora,
                label: "Valor de las horas",
                keyboard: TextInputType.number,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: calcularSueldo,
                  child: const Text("Calcular Sueldo")),
              const SizedBox(height: 30),
              Text(
                resultado,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
