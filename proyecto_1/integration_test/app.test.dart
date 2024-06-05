import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:proyecto_1/data/datasources/remote/i_report_datasource.dart';
import 'package:proyecto_1/data/datasources/remote/report_datasource.dart';
import 'package:proyecto_1/data/repositories/report_repository.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
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
import 'package:proyecto_1/main.dart';
import 'package:proyecto_1/ui/controllers/Client_controller.dart';
import 'package:proyecto_1/ui/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/controllers/User_controller.dart';
import 'package:proyecto_1/ui/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/login.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ReporteHiveAdapter());
  await Hive.openBox<ReporteHive>('reportes');
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

  setUpAll(() async {});

  tearDownAll(() async {
    //await Hive.close();
  });

  testWidgets("login --> login éxitoso", (WidgetTester tester) async {
    Widget widget = await createHomeScreen();
    await tester.pumpWidget(widget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'a@a.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '123456');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Ingresa correo'), findsNothing);
  });

  testWidgets("login --> menu usuarios --> crear usuario",
      (WidgetTester tester) async {
    Widget widget = await createHomeScreen();
    await tester.pumpWidget(widget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'a@a.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '123456');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Filtros'), findsOneWidget);

    await tester.tap(find.byKey(const Key('Buttonusuario')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    expect(find.text('Trabajadores'), findsOneWidget);

    await tester.tap(find.byKey(const Key('Buttonagregarusuario')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    await tester.enterText(
        find.byKey(const Key('nombreusuario')), 'rafael martinez');

    await tester.enterText(find.byKey(const Key('correousuario')), 'r@a.com');

    await tester.enterText(
        find.byKey(const Key('contrasenausuario')), '123456789');

    await tester.tap(find.byKey(const Key('Buttonconfirmaragregarusuario')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    expect(find.text('Trabajadores'), findsOne);
  });

  testWidgets("login --> menu clientes --> crear cliente",
      (WidgetTester tester) async {
    Widget widget = await createHomeScreen();
    await tester.pumpWidget(widget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'a@a.com');
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '123456');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Filtros'), findsOneWidget);

    await tester.tap(find.byKey(const Key('Buttoncliente')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    expect(find.text('Clientes'), findsOneWidget);

    await tester.tap(find.byKey(const Key('Buttonagregarcliente')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    await tester.enterText(
        find.byKey(const Key('nombrecliente')), 'juan perez');

    await tester.tap(find.byKey(const Key('Buttonconfirmaragregarcliente')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    expect(find.text('Clientes'), findsOne);
  });

  testWidgets("login --> crear reporte", (WidgetTester tester) async {


    Widget widget = await createHomeScreen();
    await tester.pumpWidget(widget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), "s@a.com");

    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), "54321");
    
    await tester.pumpAndSettle(const Duration(seconds: 3));

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    expect(find.byKey(const Key('Buttonreporte')), findsOneWidget);

    await tester.tap(find.byKey(const Key('Buttonreporte')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Nuevo Reporte'), findsOneWidget);
  });

    testWidgets("login --> calificar reporte", (WidgetTester tester) async {

    Widget widget = await createHomeScreen();
    await tester.pumpWidget(widget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), "a@a.com");

    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), "123456");
    
    await tester.pumpAndSettle(const Duration(seconds: 3));

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    expect(find.text('Reportes'), findsOneWidget);

    await tester.tap(find.text('si'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Detalle del Reporte'), findsOneWidget);
  });
}
