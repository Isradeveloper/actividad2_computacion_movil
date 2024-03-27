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

  void calcularSueldo() {
    validarCampo(ctlnombre.text, "Nombre", true, false);
    validarCampo(ctlhoras.text, "Horas", true, true);
    validarCampo(ctlvalorHora.text, "Valor hora", true, true);

    nombre = ctlnombre.text;
    horas = int.parse(ctlhoras.text);
    valorHora = double.parse(ctlvalorHora.text);

    final double sueldo = horas * valorHora;

    setState(() {
      resultado =
          "El empleado $nombre, recibirá de sueldo \$$sueldo. Por $horas hora(s) trabajadas de \$$valorHora cada una.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cálcular Sueldo - Israel Trujillo"),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TituloRed(titulo: "APPSUELDO"),
              const TituloRed(titulo: "CÁLCULO SUELDO !"),
              const SizedBox(height: 10),
              WTextField(
                ctl: ctlnombre,
                label: "Nombre del empleado",
                keyboard: TextInputType.text,
              ),
              const SizedBox(height: 20),
              WTextField(
                ctl: ctlhoras,
                label: "Horas trabajadas",
                keyboard: TextInputType.number,
              ),
              const SizedBox(height: 20),
              WTextField(
                ctl: ctlvalorHora,
                label: "Valor de las horas",
                keyboard: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: calcularSueldo,
                  child: const Text("Calcular Sueldo")),
              const SizedBox(height: 20),
              Text(
                resultado,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
