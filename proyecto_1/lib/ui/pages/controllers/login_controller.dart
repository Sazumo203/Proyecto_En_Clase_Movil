import 'package:get/get.dart';

class LoginController extends GetxController {
  var _logged = false.obs;
  var _rol = "".obs;


  bool get correo => _logged.value;
  String get rol => _rol.value;

  Future<bool> login(correo,contrasena) async{
    if(correo == "a@a.com" && contrasena == "123456"){
      _logged.value = true;
      _rol.value ="uc";
    }else if(correo == "zi@hotmail.com"&&contrasena == "12345"){
      _logged.value = true;
      _rol.value ="us";
    }
    return Future.value(_logged.value);
  }

  void logout() {
      _logged.value = false;
      _rol.value = "";
  }
  
}