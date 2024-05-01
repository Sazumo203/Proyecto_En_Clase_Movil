import 'package:flutter/material.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';

// Widget para visualizar el Usuario con diseño mejorado
class UsuarioView extends StatelessWidget {
  final Usuario usuario;

  const UsuarioView({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Detalle del Usuario Soporte',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // Usamos ListView para permitir desplazamiento si hay mucho contenido
          children: [
            const SizedBox(height: 20),
            Card(
              // Usamos Card para dar estilo al contenedor
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.fingerprint_sharp,
                            color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'ID del Usuario: ${usuario.id}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Información del creador
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'Nombre: ${usuario.name}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.email, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'Correo: ${usuario.correo}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Información del cliente
                    Row(
                      children: [
                        const Icon(Icons.account_circle,
                            color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          'Contraseña: ${usuario.password}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Sección de calificación
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
