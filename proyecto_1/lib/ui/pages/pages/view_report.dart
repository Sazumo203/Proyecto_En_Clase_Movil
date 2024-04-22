import 'package:flutter/material.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';

// Widget para visualizar el reporte con diseño mejorado
class ReporteView extends StatelessWidget {
  final Reporte reporte;

  ReporteView({required this.reporte});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Reporte'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // Usamos ListView para permitir desplazamiento si hay mucho contenido
          children: [
            Center(
              child: Text(
                reporte.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              // Usamos Card para dar estilo al contenedor
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Información del creador
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text(
                          'Creador: ${reporte.creatorName}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.fingerprint, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text(
                          'ID del creador: ${reporte.creactorId}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Información del cliente
                    Row(
                      children: [
                        Icon(Icons.account_circle, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text(
                          'ID del cliente: ${reporte.idcliente}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Sección de calificación
                    Row(
                      children: [
                        Icon(
                          Icons.grade,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 10),
                        Text(
                          reporte.itsgraded
                              ? 'Calificación: ${reporte.grade}'
                              : 'No calificado',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Hora de inicio y duración
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text(
                          'Hora de inicio: ${reporte.horainicio.format(context)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.timer, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text(
                          'Duración: ${reporte.duracion} minutos',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Contenido del reporte
                    Text(
                      'Contenido del reporte:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      reporte.body,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
