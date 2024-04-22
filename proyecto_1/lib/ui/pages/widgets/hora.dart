import 'package:flutter/material.dart';

class HoraSelector extends StatefulWidget {
  final String label; // Etiqueta del campo de entrada
  final Function(TimeOfDay)
      onTimeSelected; // Callback para la hora seleccionada

  HoraSelector({
    required this.label,
    required this.onTimeSelected,
  });

  @override
  _HoraSelectorState createState() => _HoraSelectorState();
}

class _HoraSelectorState extends State<HoraSelector> {
  TimeOfDay? selectedTime; // Variable para almacenar la hora seleccionada

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context, initialTime: selectedTime ?? TimeOfDay.now());
    if (picked != null) {
      setState(() {
        selectedTime = picked; // Actualizar la hora seleccionada
      });
      widget.onTimeSelected(picked); // Llamar al callback
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(),
        ),
        child: Text(
          selectedTime != null
              ? selectedTime!.format(context) // Mostrar la hora seleccionada
              : "Seleccionar hora",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
