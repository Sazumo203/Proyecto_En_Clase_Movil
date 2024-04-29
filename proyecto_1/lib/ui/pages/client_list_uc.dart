import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/ui/controllers/Client_controller.dart';
import 'package:proyecto_1/ui/pages/add_client.dart';


class ClientListUc extends StatefulWidget {
  const ClientListUc({super.key});

  @override
  State<ClientListUc> createState() => _ClientListUc();
}

class _ClientListUc extends State<ClientListUc> {
  ClientController clientController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clientes",style: TextStyle(color: Colors.white)),backgroundColor: Colors.blueAccent, iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(child: _getXlistView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Get.to(
            () => const NewclientePage(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(
      () => ListView.builder(
        itemCount: clientController.clients.length,
        itemBuilder: (context, index) {
          Cliente cliente = clientController.clients[index];
          return Card(
            child: ListTile(
              title: Text(cliente.gid.toString()),
              subtitle: Text(cliente.gname),
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
