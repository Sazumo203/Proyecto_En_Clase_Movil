import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/ui/pages/controllers/Report_controller.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({Key? key}) : super(key: key);

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  final controllerId = TextEditingController();
  final controllerIdCliente = TextEditingController();
  final controllerCreatorName = TextEditingController();
  final controllerCreatorId = TextEditingController();
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
                // controller: controllerFirstName,
                decoration: const InputDecoration(
              labelText: 'Nombre Cliente: ',
            )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                // controller: controllerLastName,
                decoration: const InputDecoration(
              labelText: 'Last Name',
            )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                // controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
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
                            //await reportController.addReport(Reporte(
                            //email: controllerEmail.text,
                            //firstName: controllerFirstName.text,
                            //lastName: controllerLastName.text));
                            // Get.back();
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
