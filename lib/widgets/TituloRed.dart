import 'package:flutter/material.dart';

class TituloRed extends StatelessWidget {

  final String titulo;

  const TituloRed({
    super.key,
    required this.titulo
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
