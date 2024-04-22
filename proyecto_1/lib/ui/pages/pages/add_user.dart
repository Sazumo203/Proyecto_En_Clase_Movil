import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';
import 'package:proyecto_1/ui/pages/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/pages/controllers/User_controller.dart';
import 'package:proyecto_1/ui/pages/controllers/login_controller.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({Key? key}) : super(key: key);

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  final controllerId = TextEditingController();
  final controllerNombre = TextEditingController();
  final controllerContrasena = TextEditingController();
  final controllerCorreo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario de soporte'),
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
            TextField(
                controller: controllerCorreo,
                decoration: const InputDecoration(
                  labelText: 'Correo: ',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerContrasena,
                decoration: const InputDecoration(
                  labelText: 'Contrasena: ',
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
                            await userController.addUser(Usuario(
                              id: int.parse(controllerId.text),
                              name: controllerNombre.text,
                              correo: controllerCorreo.text,
                              password: controllerContrasena.text,
                            ));
                            Get.back();
                          },
                          child: const Text("Guardar usuario US")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
