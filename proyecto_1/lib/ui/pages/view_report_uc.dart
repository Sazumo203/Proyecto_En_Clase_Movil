import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/ui/controllers/Report_controller.dart';

class ReporteViewUc extends StatelessWidget {
  const ReporteViewUc({super.key, required this.reporte});
  final Reporte reporte;

  @override
  Widget build(BuildContext context) {
    final reportController = Get.find<ReportController>();
    reportController.upCal(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalle del Reporte',
          style: TextStyle(color: Colors.white), // Título en blanco
        ),
        leading:
            const Icon(Icons.assignment, color: Colors.white), // Icono blanco
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true, // Para permitir desplazamiento si es necesario
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
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.fingerprint_sharp,
                            color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'ID del Reporte: ${reporte.id}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                    Row(
                      children: [
                        const Icon(Icons.account_circle,
                            color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'ID del cliente: ${reporte.idcliente}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'Hora de inicio: ${reporte.horainicio}',
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
                    const Text(
                      'Contenido del Reporte:',
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
            const SizedBox(height: 30),
            const Center(
                child: Text("Calificación", style: TextStyle(fontSize: 30))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (reporte.grade > 1) {
                      reporte.grade--;
                      reportController.upCal(reporte.grade);
                    }
                  },
                  iconSize: 48,
                  color: Colors.blue,
                  splashRadius: 24,
                ),
                const SizedBox(width: 20),
                Obx(() => Text('${reportController.calificacion}',
                    style: const TextStyle(fontSize: 20))),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (reporte.grade < 5) {
                      reporte.grade++;
                      reportController.upCal(reporte.grade);
                    }
                  },
                  iconSize: 48,
                  color: Colors.blue,
                  splashRadius: 24,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 200, // Control del ancho del botón
                child: ElevatedButton(
                  onPressed: () {
                    reporte.itsgraded = true;
                    reportController.updateReport(reporte);
                    Get.back();
                  },
                  child: const Text("Enviar"), // Botón centrado y reducido
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
