// Widget para visualizar el reporte
import 'package:flutter/material.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';

class ReporteView extends StatelessWidget {
  final Reporte reporte;

  ReporteView({required this.reporte});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Reporte'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Título: ${reporte.title}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Creador: ${reporte.creatorName}'),
            Text('ID del creador: ${reporte.creactorId}'),
            Text('ID del cliente: ${reporte.idcliente}'),
            SizedBox(height: 10),
            Text('Calificación: ${reporte.grade}'),
            Text('Grado asignado: ${reporte.itsgraded ? "Sí" : "No"}'),
            SizedBox(height: 10),
            Text('Contenido:'),
            SizedBox(height: 10),
            Text(reporte.body),
          ],
        ),
      ),
    );
  }
}
