import 'dart:html';

import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';

class ClientController extends GetxController {
  final RxList<Cliente> _clients = <Cliente>[].obs;
  //final UserUseCase userUseCase = Get.find();

  List<Cliente> get clients => _clients;

  @override
  void onInit() {
    initClients();
    //GET
    super.onInit();
  }

  initClients() async {
    _clients.value = [
      Cliente(
          id: 12,
          name: "Pedro Perez"),
      Cliente(
          id: 34,
          name: "Juan Jimenez")
    ];
  }

  getClients() async {
    //_reports.value = await userUseCase.getUsers();
  }

  addUser(Cliente clt) async {
    //await userUseCase.addReport(rep);
    _clients.value = [..._clients.value, clt];
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
}