import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/ui/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/client_list_uc.dart';
import 'package:proyecto_1/ui/pages/login.dart';
import 'package:proyecto_1/ui/pages/users_list_uc.dart';
import 'package:proyecto_1/ui/pages/view_report.dart';
import 'package:proyecto_1/ui/pages/view_report_uc.dart';

class ReportListUc extends StatefulWidget {
  const ReportListUc({super.key});

  @override
  State<ReportListUc> createState() => _ReportListUc();
}

class _ReportListUc extends State<ReportListUc> {
  final reportController = Get.find<ReportController>();
  final loginController = Get.find<LoginController>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Reportes", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        actions: [
          TextButton(
            onPressed: () {
              Get.to(const UsersListUc());
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.work, color: Colors.white),
                SizedBox(width: 5),
                Text("Usuarios", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(const ClientListUc());
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.group, color: Colors.white),
                SizedBox(width: 5),
                Text("Clientes", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              loginController.logout();
              Get.offAll(const LoginScreen(key: Key("LoginScreen")));
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: reportController.reports.length,
          itemBuilder: (context, index) {
            final reporte = reportController.reports[index];
            return Card(
              child: ListTile(
                leading: Text(
                  reporte.horainicio.format(context), // Hora del reporte
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
                  if (reporte.itsgraded) {
                    Get.to(ReporteView(reporte: reporte));
                  } else {
                    Get.to(ReporteViewUc(reporte: reporte));
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
