import 'dart:html';

import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/domain/use_case/cliente_usercase.dart';

class ClientController extends GetxController {
  final RxList<Cliente> _clients = <Cliente>[].obs;
  final ClienteUserCase clienteUseCase = Get.find();

  List<Cliente> get clients => _clients;

  @override
  void onInit() {
    getClients();
    //GET
    super.onInit();
  }

  // initClients() async {
  //   _clients.value = [
  //     Cliente(
  //         id: 12,
  //         name: "Pedro Perez"),
  //     Cliente(
  //         id: 34,
  //         name: "Juan Jimenez")
  //   ];
  // }

  getClients() async {
    _clients.value = await clienteUseCase.getClientes();
    _clients.refresh();
  }

  addcliente(Cliente clt) async {
    await clienteUseCase.addCliente(clt);

    getClients();
  }

  updateReport(Cliente clt) async {
    //await userUseCase.updateReport(rep);
    getClients();
  }

  void deleteUser(int id) async {
    //await userUseCase.deleteReport(id);
    getClients();
  }

  //void simulateProcess() async {
  //  await userUseCase.simulateProcess();
  //}
  //a
}
