import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/domain/use_case/report_usercase.dart';
import 'package:proyecto_1/ui/controllers/Client_controller.dart';

class ReportController extends GetxController {
  final RxList<Reporte> _reports = <Reporte>[].obs;
  //final UserUseCase userUseCase = Get.find();
  RxInt _calificacion = 0.obs;
  List<Reporte> get reports => _reports;
  final ReportUserCase reportUserCase = Get.find();
  final ClientController _clienteController = Get.find<ClientController>();
  int get calificacion => _calificacion.value;
  @override
  void onInit() {
    getReports();
    //GET
    super.onInit();
  }

  void upCal(int cal) {
    _calificacion.value = cal;
  }

  getReports() async {
    _reports.value = await reportUserCase.getReports();
    _reports.refresh();
  }

  addReport(Reporte rep) async {
    //Cliente? usuarioEncontrado = _clienteController.clients.firstWhereOrNull(
    //  (user) => user.id == rep.idcliente,
    //);

    if (await _clienteController.encontrarCliente(rep.idcliente)) {
      await reportUserCase.addReport(rep);
      getReports();
    }
  }

  updateReport(Reporte rep) async {
    await reportUserCase.updateReport(rep);
    getReports();
  }
}
