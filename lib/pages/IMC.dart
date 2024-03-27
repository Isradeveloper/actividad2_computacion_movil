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
  late String resultado = "";

  TextEditingController ctlpeso = TextEditingController();
  TextEditingController ctlaltura = TextEditingController();

  void mostrarNotificacion(String texto) {
    Widget okBoton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Aceptar"));

    AlertDialog alert = AlertDialog(
      title: const Text("Notificación"),
      content: Text(texto),
      actions: [okBoton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  dynamic validarCampo(
      String valor, String label, bool requerido, bool numerico) {
    String resultado = "";

    if (requerido) {
      if (valor.isEmpty) {
        resultado += "\nEl campo $label no puede estar vacío";
      }
    }

    if (numerico) {
      try {
        double.parse(valor);
      } catch (e) {
        resultado += "\nEl campo $label debe ser numérico";
      }
    }

    if (resultado.isNotEmpty) {
      mostrarNotificacion(resultado);
    }
  }

  void calcularIMC() {
    validarCampo(ctlpeso.text, "Peso", true, true);
    validarCampo(ctlpeso.text, "Altura", true, true);
    peso = double.parse(ctlpeso.text);
    altura = double.parse(ctlaltura.text);

    setState(() {
      double calculo = (peso) / pow(altura, 2);
      resultado = "El IMC es de: ${calculo.toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cálcular peso corporal IMC - Israel Trujillo"),
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
                resultado,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
