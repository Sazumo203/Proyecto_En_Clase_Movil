import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/ui/pages/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/pages/client_list_uc.dart';
import 'package:proyecto_1/ui/pages/pages/login.dart';
import 'package:proyecto_1/ui/pages/pages/report_list_uc.dart';
import 'package:proyecto_1/ui/pages/pages/users_list_uc.dart';


class MainUcScreen extends StatefulWidget {
  const MainUcScreen({super.key});


  @override
  State<MainUcScreen> createState() => _MainUcScreenState();

}

class _MainUcScreenState extends State<MainUcScreen> {
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Bienvenido, Administrador"), 
      actions: [
        IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              loginController.logout();
              Get.offAll(const LoginScreen(
                key: Key('LoginScreen'),
              ));
            }),
      ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Opciones",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      Get.to(const UsersListUc());
                    },
                    child: const Text("Editar usuarios")
                  ),
                  const SizedBox(
                    width: 20,
                  ),   
                  OutlinedButton(
                    onPressed: (){
                      Get.to(const ClientListUc());
                    },
                    child: const Text("Editar Clientes")
                  ),       
                ]

              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    Get.to(const ReportListUc());
                  },
                  child: const Text("Reportes")
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}