import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/ui/controllers/Client_controller.dart';
import 'package:proyecto_1/ui/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/controllers/User_controller.dart';
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
            onPressed: () => _showFloatingPanel(context),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.filter_alt, color: Colors.white),
                SizedBox(width: 5),
                Text("Filtros", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
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
          itemCount: reportController.reportsF.length,
          itemBuilder: (context, index) {
            final reporte = reportController.reportsF[index];
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

void _showFloatingPanel(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return _buildFloatingPanel();
    },
    isScrollControlled: true,
  );
}

Widget _buildFloatingPanel() {
  final reportController = Get.find<ReportController>();
  UserController userController = Get.find();
  ClientController clientController = Get.find();
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text(
          'Filtros',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'por usuario(US)',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField(
          items: userController.users.map((e) {
            return DropdownMenuItem(
              value: e.gid,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  e.gname,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }).toList(),
          onChanged: (int? value) {
            reportController.setUserFilter(value!);
            reportController.updateReportsFiltered();
          },
          isDense: true,
          isExpanded: true,
        ),
        const SizedBox(height: 16),
        const Text(
          'por cliente',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField(
          items: clientController.clients.map((e) {
            return DropdownMenuItem(
              value: e.gid,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  e.gname,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }).toList(),
          onChanged: (int? value) {
              reportController.setClientFilter(value!);
              reportController.updateReportsFiltered();
            },
          isDense: true,
          isExpanded: true,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            reportController.setClientFilter(0);
            reportController.setUserFilter(0);
            reportController.updateReportsFiltered();
          },
          child: const Text('Borrar filtros'),
        ),
      ],
    ),
  );
}
