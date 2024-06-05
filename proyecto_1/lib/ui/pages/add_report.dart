import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/ui/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/controllers/login_controller.dart';
import 'package:proyecto_1/ui/widgets/hora.dart';
import 'package:proyecto_1/ui/widgets/inputint.dart';

class NewReportPage extends StatefulWidget {
  const NewReportPage({Key? key}) : super(key: key);

  @override
  _NewReportPageState createState() => _NewReportPageState();
}

class _NewReportPageState extends State<NewReportPage> {
  final controllerId = TextEditingController();
  final loginController = Get.find<LoginController>();
  final controllerIdCliente = TextEditingController();
  final controllerTitle = TextEditingController();
  final controllerBody = TextEditingController();
  final timeController = TextEditingController();
  TimeOfDay _selectedTime = const TimeOfDay(hour: 4, minute: 20);



  final controllerDuracion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final reportController = Get.find<ReportController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo Reporte',
          style: TextStyle(
            color: Colors.white, // Título en blanco
          ),
        ),
        leading:
            const Icon(Icons.assignment, color: Colors.white), // Icono blanco
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0), // Padding interno
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0), // Bordes circulares
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Sombra suave
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // Posición de la sombra
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true, // Para ajustar el tamaño
              children: [
                const SizedBox(height: 16),
                NumeroEnteroInput(
                  key: const Key('IDclientereport'),
                  label: "ID del Cliente",
                  controller: controllerIdCliente,
                  onTextChanged: (text) {},
                ),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('titlereport'),
                  controller: controllerTitle,
                  decoration: const InputDecoration(
                    labelText: 'Título del Reporte',
                    prefixIcon: Icon(Icons.title), // Icono para título
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('descriptionreport'),
                  controller: controllerBody,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    labelText: 'Descripción del Reporte',
                    prefixIcon:
                        Icon(Icons.description), // Icono para descripción
                    border: OutlineInputBorder(), // Para resaltar el campo
                  ),
                ),
                const SizedBox(height: 16),
                HoraSelector(
                  key: const Key('hourselector'),
                  label: "Hora de Inicio",
                  onTimeSelected: (selectedTime) {
                    setState(() {
                      _selectedTime = selectedTime;
                    });
                  },
                ),
                const SizedBox(height: 16),
                NumeroEnteroInput(
                  key: const Key('duraciónreport'),
                  label: "Duración (en minutos)",
                  controller: controllerDuracion,
                  onTextChanged: (text) {},
                ),
                const SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    width: 200, // Ancho reducido del botón
                    child: ElevatedButton(
                      key: const Key('Botonguardarreporte'),
                      onPressed: () async {
                        String formattedTime =
                            '${_selectedTime.hourOfPeriod}:${_selectedTime.minute.toString().padLeft(2, '0')} ${_selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}';
                        await reportController.addReport(
                          Reporte(
                            idcliente: int.parse(controllerIdCliente.text),
                            creatorName: loginController.nombreusuario,
                            creactorId: loginController.idusuario,
                            title: controllerTitle.text,
                            body: controllerBody.text,
                            grade: 0,
                            itsgraded: false,
                            horainicio: formattedTime,
                            duracion: int.parse(controllerDuracion.text),
                          ),
                        );
                        Get.back(); // Regresar a la página anterior
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save), // Icono para guardar
                          SizedBox(width: 8),
                          Text("Guardar Reporte"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
