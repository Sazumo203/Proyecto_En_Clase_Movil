import 'dart:html';

import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';

class UserController extends GetxController {
  final RxList<Usuario> _users = <Usuario>[].obs;
  //final UserUseCase userUseCase = Get.find();

  List<Usuario> get users => _users;

  @override
  void onInit() {
    initUsers();
    //GET
    super.onInit();
  }

  initUsers() async {
    _users.value = [
      Usuario(
          id: 111, name: "Samuel Zuleta", correo: "s@a.com", password: "54321"),
      Usuario(
          id: 222,
          name: "Rafael Martinez",
          correo: "r@a.com",
          password: "654321")
    ];
  }

  getUsers() async {
    //_reports.value = await userUseCase.getUsers();
  }

  addUser(Usuario user) async {
    //await userUseCase.addReport(rep);
    _users.value = [..._users.value, user];
    getUsers();
  }

  updateReport(Usuario user) async {
    //await userUseCase.updateReport(rep);
    getUsers();
  }

  void deleteUser(int id) async {
    //await userUseCase.deleteReport(id);
    getUsers();
  }

  //void simulateProcess() async {
  //  await userUseCase.simulateProcess();
  //}
}
