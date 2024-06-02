import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';
import 'package:proyecto_1/domain/use_case/usuario_usercase.dart';

class UserController extends GetxController {
  final RxList<Usuario> _users = <Usuario>[].obs;
  //final UserUseCase userUseCase = Get.find();
  final UsuarioUserCase usuarioUserCase = Get.find();

  List<Usuario> get users => _users;

  @override
  void onInit() {
    getUsers();
    //GET
    super.onInit();
  }

  getUsers() async {
    _users.value = await usuarioUserCase.getUsuarios();
  }

  addUser(Usuario user) async {
    await usuarioUserCase.addUsuario(user);
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
