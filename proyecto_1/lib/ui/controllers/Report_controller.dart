import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/domain/use_case/report_usercase.dart';
import 'package:proyecto_1/ui/controllers/Client_controller.dart';

class ReportController extends GetxController {
  final RxList<Reporte> _reports = <Reporte>[].obs;
  final RxList<Reporte> _reportsfilters = <Reporte>[].obs;
  //final UserUseCase userUseCase = Get.find();
  RxInt _calificacion = 0.obs;
  int filtroUser = 0;
  int filtroClient = 0;
  List<Reporte> get reports => _reports;
  List<Reporte> get reportsF => _reportsfilters;
  final ReportUserCase reportUserCase = Get.find();
  final ClientController _clienteController = Get.find<ClientController>();
  int get calificacion => _calificacion.value;
  
  get reportesFilters => null;
  @override
  void onInit() {
    getReports();
    updateReportsFiltered();
    //GET
    super.onInit();
  }

  void upCal(int cal) {
    _calificacion.value = cal;
  }

  setUserFilter(int nuevo) async {
    filtroUser = nuevo;
  }

  setClientFilter(int nuevo) async {
    filtroClient = nuevo;
  }

  updateReportsFiltered() async {
    if (filtroClient == 0 &&
        filtroUser == 0) {
        _reportsfilters.value = await reportUserCase.getReports();
        _reportsfilters.refresh();
    } else {
      if (filtroClient != 0) {
        _reportsfilters.value = _reportsfilters.where((e) => e.idcliente == filtroClient).toList();
        _reportsfilters.refresh();

      }
      if (filtroUser != 0) {     
        _reportsfilters.value = _reportsfilters.where((e) => e.creactorId == filtroUser).toList();
        _reportsfilters.refresh();
      }
    }
    
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
