import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/ui/controllers/Client_controller.dart';


class NewclientePage extends StatefulWidget {
  const NewclientePage({Key? key}) : super(key: key);

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewclientePage> {
  final controllerId = TextEditingController();
  final controllerNombre = TextEditingController();
  final controllerContrasena = TextEditingController();
  final controllerCorreo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ClientController clienteController = Get.find();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Nuevo usuario de soporte',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // Cambia la posición de la sombra
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      controller: controllerId,
                      decoration: const InputDecoration(
                        labelText: 'Id Usuario: ',
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      controller: controllerNombre,
                      decoration: const InputDecoration(
                        labelText: 'Nombre: ',
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
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () async {
                                  await clienteController.addcliente(Cliente(
                                    id: int.parse(controllerId.text),
                                    name: controllerNombre.text,
                                  ));
                                  Get.back();
                                },
                                child: const Text(
                                  "Guardar cliente",
                                  style: TextStyle(color: Colors.black),
                                )))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
