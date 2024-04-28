import 'package:flutter/material.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';

// Widget para visualizar el reporte con diseño mejorado
class ReporteView extends StatelessWidget {
  final Reporte reporte;

  const ReporteView({super.key, required this.reporte});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Detalle del Reporte',style: TextStyle(color: Colors.white)),
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
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                        const Icon(Icons.person, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'Creador: ${reporte.creatorName}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.fingerprint, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'ID del creador: ${reporte.creactorId}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Información del cliente
                    Row(
                      children: [
                        const Icon(Icons.account_circle, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'ID del cliente: ${reporte.idcliente}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Sección de calificación
                    Row(
                      children: [
                        const Icon(
                          Icons.grade,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          reporte.itsgraded
                              ? 'Calificación: ${reporte.grade}'
                              : 'No calificado',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Hora de inicio y duración
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'Hora de inicio: ${reporte.horainicio.format(context)}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.timer, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'Duración: ${reporte.duracion} minutos',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Contenido del reporte
                    const Text(
                      'Contenido del reporte:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reporte.body,
                      style: const TextStyle(fontSize: 16),
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
