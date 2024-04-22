import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';
import 'package:proyecto_1/ui/pages/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/pages/controllers/User_controller.dart';

class LoginController extends GetxController {
  var _logged = false.obs;
  var _rol = "".obs;
  var _idusuario = 0.obs;
  var _nombreusuario = "".obs;
  final UserController _userController = Get.find<UserController>();
  bool get correo => _logged.value;
  String get rol => _rol.value;
  String get nombreusuario => _nombreusuario.value;
  int get idusuario => _idusuario.value;

  Future<bool> login(correo, contrasena) async {
    if ((correo == "a@a.com" && contrasena == "123456") ||
        (correo == "b@a.com" && contrasena == "123456")) {
      _logged.value = true;
      _rol.value = "uc";
    } else {
      Usuario? usuarioEncontrado = _userController.users.firstWhereOrNull(
        (user) => user.correo == correo && user.password == contrasena,
      );

      if (usuarioEncontrado != null) {
        _logged.value = true;
        _idusuario.value = usuarioEncontrado.gid!;
        _nombreusuario.value = usuarioEncontrado.name;
        _rol.value = "us"; // Aquí puedes asignar el rol según tu lógica
      } else {
        _logged.value = false;
      }
    }
    return Future.value(_logged.value);
  }

  void logout() {
    _logged.value = false;
    _rol.value = "";
  }
}
