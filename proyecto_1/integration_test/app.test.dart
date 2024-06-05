import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:proyecto_1/data/datasources/remote/cliente_datasource.dart';
import 'package:proyecto_1/data/datasources/remote/i_cliente_datasource.dart';
import 'package:proyecto_1/data/datasources/remote/i_report_datasource.dart';
import 'package:proyecto_1/data/datasources/remote/i_usuario_datasource.dart';
import 'package:proyecto_1/data/datasources/remote/report_datasource.dart';
import 'package:proyecto_1/data/datasources/remote/usuario_datasource.dart';
import 'package:proyecto_1/data/repositories/cliente_repository.dart';
import 'package:proyecto_1/data/repositories/report_repository.dart';
import 'package:proyecto_1/data/repositories/usuario_repository.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/domain/repositories/i_cliente_repository.dart';
import 'package:proyecto_1/domain/repositories/i_report_repository.dart';
import 'package:proyecto_1/domain/repositories/i_usuario_repository.dart';
import 'package:proyecto_1/domain/use_case/cliente_usercase.dart';
import 'package:proyecto_1/domain/use_case/report_usercase.dart';
import 'package:proyecto_1/domain/use_case/usuario_usercase.dart';
import 'package:proyecto_1/main.dart';
import 'package:proyecto_1/ui/controllers/Client_controller.dart';
import 'package:proyecto_1/ui/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/controllers/User_controller.dart';
import 'package:proyecto_1/ui/controllers/login_controller.dart';

void main() {
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
  
  Future<Widget> createHomeScreen() async {
    WidgetsFlutterBinding.ensureInitialized();
    return MyApp();
  }
  
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ReporteHiveAdapter());
    await Hive.openBox<ReporteHive>('reportes');
  });


  tearDownAll(() async {
    await Hive.close();
  });

  testWidgets("login --> login éxitoso", (WidgetTester tester) async {

    Widget widget = await createHomeScreen();
    await tester.pumpWidget(widget);

    await tester.enterText(find.byKey(const Key('email')), 'a@a.com');
    await tester.enterText(find.byKey(const Key('password')), '123456');

    await tester.tap(find.byKey(const Key('ButtonLogin')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Your Support Assistance'), findsNothing);
  });



}