import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/ui/pages/controllers/Client_controller.dart';


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
      appBar: AppBar(title: const Text("Clientes"), 
      actions: const []),
      body: Center(child: _getXlistView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //Get.to(
          //  () => const NewReportPage(),
          //  //arguments: [user, user.id]
          //);
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