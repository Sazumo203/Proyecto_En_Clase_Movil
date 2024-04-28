import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/ui/pages/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/pages/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/pages/client_list_uc.dart';
import 'package:proyecto_1/ui/pages/pages/login.dart';
import 'package:proyecto_1/ui/pages/pages/users_list_uc.dart';
import 'package:proyecto_1/ui/pages/pages/view_report.dart';
import 'package:proyecto_1/ui/pages/pages/view_report_uc.dart';

class ReportListUc extends StatefulWidget {
  const ReportListUc({super.key});

  @override
  State<ReportListUc> createState() => _ReportListUc();
}

class _ReportListUc extends State<ReportListUc> {
  ReportController reportController = Get.find();
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Reportes",style: TextStyle(color: Colors.white)),
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
                    Text('Usuarios',style: TextStyle(color: Colors.white)),
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
                    Text('Clientes',style: TextStyle(color: Colors.white)),
                  ],
                ),
            ),
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  loginController.logout();
                  Get.offAll(const LoginScreen(
                    key: Key('LoginScreen'),
                  ));
                }),
          ]),
      body: Center(child: _getXlistView()),
    );
  }

  Widget _getXlistView() {
    return Obx(
      () => ListView.builder(
        itemCount: reportController.reports.length,
        itemBuilder: (context, index) {
          Reporte reporte = reportController.reports[index];
          return Card(
            child: ListTile(
              title: Text(reporte.gtitle),
              subtitle: Text(reporte.body),
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
    );
  }
}
