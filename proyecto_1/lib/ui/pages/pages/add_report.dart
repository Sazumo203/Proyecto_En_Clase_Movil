import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/ui/pages/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/pages/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/widgets/hora.dart';
import 'package:proyecto_1/ui/pages/widgets/inputint.dart';

class NewReportPage extends StatefulWidget {
  const NewReportPage({Key? key}) : super(key: key);

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewReportPage> {
  final controllerId = TextEditingController();
  LoginController loginController = Get.find();
  final controllerIdCliente = TextEditingController();
  final controllerTitle = TextEditingController();
  final controllerBody = TextEditingController();
  final controllerGrade = TextEditingController();
  final timeController = TextEditingController();
  TimeOfDay _selectedTime = const TimeOfDay(
      hour: 4, minute: 20); // Controlador para guardar la hora seleccionada

  final controllerDuracion =
      TextEditingController(); // Controlador del campo de texto

  //final TextEditingController integerController =
  //  TextEditingController(); // Controlador para el número entero

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
                  labelText: 'Título del reporte: ',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerBody,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Descripción del reporte: ',
                )),
            const SizedBox(
              height: 20,
            ),
            HoraSelector(
              label: "Hora inicio de atención",
              onTimeSelected: (selectedTime) {
                setState(() {
                  _selectedTime = selectedTime; // Guardar la hora seleccionada
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            NumeroEnteroInput(
              label: "Ingrese la duración (En minutos): ",
              controller: controllerDuracion, // Pasar el controlador
              onTextChanged: (text) {
                // Puedes hacer algo con el texto cambiado
              },
            ),
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
                                creatorName: loginController.nombreusuario,
                                creactorId: loginController.idusuario,
                                title: controllerTitle.text,
                                body: controllerBody.text,
                                grade: 0,
                                itsgraded: false,
                                horainicio: _selectedTime,
                                // horainicio: timeController.text,
                                duracion: int.parse(controllerDuracion.text)
                                //duracion: int.parse(integerController.text)
                                ));
                            Get.back();
                          },
                          child: const Text("Guardar Reporte")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
