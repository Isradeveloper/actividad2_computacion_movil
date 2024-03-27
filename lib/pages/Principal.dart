import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página Principal - Israel Trujillo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "calcular_imc");
              },
              child: const Text("IMC")
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "calcular_sueldo");
              },
              child: const Text("Cálcular Sueldo Empleado")
            ),
          ],
        ),
      ),
    );
  }
}
