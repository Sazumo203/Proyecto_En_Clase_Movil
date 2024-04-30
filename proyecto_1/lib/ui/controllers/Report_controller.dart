import 'dart:html';

import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/domain/use_case/report_usercase.dart';

class ReportController extends GetxController {
  final RxList<Reporte> _reports = <Reporte>[].obs;
  //final UserUseCase userUseCase = Get.find();
  RxInt _calificacion = 0.obs;
  List<Reporte> get reports => _reports;
  final ReportUserCase reportUserCase = Get.find();
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
    await reportUserCase.addReport(rep);
    getReports();
  }

  updateReport(Reporte rep) async {
    await reportUserCase.updateReport(rep);
    getReports();
  }

  void deleteReport(int id) async {
    await reportUserCase.deleteReport(id);
    getReports();
  }
}
