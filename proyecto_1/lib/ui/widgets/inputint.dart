import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumeroEnteroInput extends StatelessWidget {
  final String label;
  final TextEditingController
      controller; // El controlador para el campo de texto
  final Function(String) onTextChanged; // Callback para el texto cambiado

  NumeroEnteroInput({
    required this.label,
    required this.controller,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Vincula el controlador
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Solo dígitos
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        onTextChanged(value); // Callback para el cambio de texto
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Ingrese un número";
        } else {
          try {
            int.parse(value); // Asegurarse de que sea convertible a entero
          } catch (e) {
            return "Ingrese un número entero válido";
          }
        }
        return null;
      },
    );
  }
}
