import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/ui/pages/controllers/Report_controller.dart';

class NewReportPage extends StatefulWidget {
  const NewReportPage({Key? key}) : super(key: key);

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewReportPage> {
  final controllerId = TextEditingController();
  final controllerIdCliente = TextEditingController();
  final controllerTitle = TextEditingController();
  final controllerBody = TextEditingController();
  final controllerGrade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ReportController reportController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Reporte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerId,
                decoration: const InputDecoration(
                  labelText: 'Id Reporte: ',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerIdCliente,
                decoration: const InputDecoration(
                  labelText: 'Id Cliente: ',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerTitle,
                decoration: const InputDecoration(
                  labelText: 'Title: ',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerBody,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Body: ',
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () async {
                            await reportController.addReport(Reporte(
                                id: int.parse(controllerId.text),
                                idcliente: int.parse(controllerIdCliente.text),
                                creatorName: "Creator",
                                creactorId: 5,
                                title: controllerTitle.text,
                                body: controllerBody.text,
                                grade: 0,
                                itsgraded: false));
                            Get.back();
                          },
                          child: const Text("Save")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
