import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';
import 'package:proyecto_1/ui/controllers/User_controller.dart';

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
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo Usuario de Soporte',
          style: TextStyle(color: Colors.white), // Título en blanco
        ),
        leading:
            const Icon(Icons.person_add, color: Colors.white), // Icono blanco
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
                TextField(
                  key: const Key('nombreusuario'),
                  controller: controllerNombre,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    prefixIcon: Icon(Icons.person), // Icono para nombre
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('correousuario'),
                  controller: controllerCorreo,
                  decoration: const InputDecoration(
                    labelText: 'Correo Electrónico',
                    prefixIcon: Icon(Icons.email), // Icono para correo
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('contrasenausuario'),
                  controller: controllerContrasena,
                  obscureText: true, // Ocultar contraseña
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock), // Icono para contraseña
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    width: 200, // Ancho reducido del botón
                    child: ElevatedButton(
                      key: const Key('Buttonconfirmaragregarusuario'),
                      onPressed: () async {
                        await userController.addUser(
                          Usuario(
                            name: controllerNombre.text,
                            correo: controllerCorreo.text,
                            password: controllerContrasena.text,
                          ),
                        );
                        Get.back(); // Regresar a la página anterior
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save), // Icono para guardar
                          SizedBox(width: 8),
                          Text("Guardar Usuario"),
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
