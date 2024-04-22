import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/ui/pages/controllers/Report_controller.dart';


class ReportListUc extends StatefulWidget {
  const ReportListUc({super.key});

  @override
  State<ReportListUc> createState() => _ReportListUc();
}

class _ReportListUc extends State<ReportListUc> {
  ReportController reportController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reportes"), 
      actions: const []),
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
              subtitle: Text(reporte.gcreatorName),
              onTap: () {
                //Get.to();
              },
            ),
          );
        },
      ),
    );
  }
}