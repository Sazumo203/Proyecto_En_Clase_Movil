import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/ui/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/add_report.dart';
import 'package:proyecto_1/ui/pages/login.dart';
import 'package:proyecto_1/ui/pages/view_report.dart';

class Reportlist extends StatefulWidget {
  const Reportlist({super.key});

  @override
  State<Reportlist> createState() => _Reportlist();
}

Widget _buildStarRating(int grade) {
  if (grade == 0) {
    return const Text("No calificado"); // Texto si no está calificado
  }
  return Row(
    children: List.generate(5, (index) {
      return Icon(
        index < grade ? Icons.star : Icons.star_border, // Estrella o borde
        color: Colors.yellow,
      );
    }),
  );
}

class _Reportlist extends State<Reportlist> {
  ReportController reportController = Get.find();
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Obx(
          () => Text("Bienvenido, ${loginController.nombreusuario}",
              style: const TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              loginController.logout();
              Get.offAll(const LoginScreen(key: Key('LoginScreen')));
            },
          ),
        ],
      ),
      body: Center(child: _getXlistView()), // Asumiendo que esta función existe
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const NewReportPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(
      () => ListView.builder(
        itemCount: reportController.reports.length,
        itemBuilder: (context, index) {
          final reporte = reportController.reports[index];
          return Card(
            child: ListTile(
              leading: Text(
                reporte.horainicio, // Hora del reporte
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              title: Text(reporte.title),
              subtitle: Row(
                children: [
                  Expanded(
                      child: Text(
                          "Encargado: ${reporte.creatorName}")), // Descripción del reporte
                  _buildStarRating(
                      reporte.grade), // Calificación como estrellas
                ],
              ),
              onTap: () {
                Get.to(ReporteView(reporte: reporte));
              },
            ),
          );
        },
      ),
    );
  }
}
