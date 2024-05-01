import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/data/datasources/remote/i_report_datasource.dart';
import 'package:proyecto_1/data/datasources/remote/report_datasource.dart';
import 'package:proyecto_1/data/repositories/report_repository.dart';
import 'package:proyecto_1/domain/repositories/I_report_repository.dart';
import 'package:proyecto_1/domain/use_case/report_usercase.dart';
import 'package:proyecto_1/data/datasources/remote/i_usuario_datasource.dart';
import 'package:proyecto_1/data/datasources/remote/usuario_datasource.dart';
import 'package:proyecto_1/data/repositories/usuario_repository.dart';
import 'package:proyecto_1/domain/repositories/i_usuario_repository.dart';
import 'package:proyecto_1/domain/use_case/usuario_usercase.dart';
import 'package:proyecto_1/data/datasources/remote/i_cliente_datasource.dart';
import 'package:proyecto_1/data/datasources/remote/cliente_datasource.dart';
import 'package:proyecto_1/data/repositories/cliente_repository.dart';
import 'package:proyecto_1/domain/repositories/i_cliente_repository.dart';
import 'package:proyecto_1/domain/use_case/cliente_usercase.dart';
import 'package:proyecto_1/ui/controllers/Client_controller.dart';
import 'package:proyecto_1/ui/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/controllers/User_controller.dart';
import 'package:proyecto_1/ui/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put<IClienteDataSource>(ClienteDataSource());
    Get.put<IClienteRepository>(ClienteRepository(Get.find()));
    Get.put(ClienteUserCase(Get.find()));
    Get.put<IReportDataSource>(ReportDataSource());
    Get.put<IReportRepository>(ReportRepository(Get.find()));
    Get.put(ReportUserCase(Get.find()));

    Get.put<IUsuarioDataSource>(UsuarioDataSource());
    Get.put<IUsuarioRepository>(UsuarioRepository(Get.find()));
    Get.put(UsuarioUserCase(Get.find()));
    Get.put(ClientController());
    Get.put(UserController());
    Get.put(LoginController());
    Get.put(ReportController());
    Get.put(UserController());

    return GetMaterialApp(
        title: 'Administrador de reportes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(key: Key('LoginScreen')));
  }
}
