import 'dart:html';

import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';

class ReportController extends GetxController {
  final RxList<Reporte> _reports = <Reporte>[].obs;
  //final UserUseCase userUseCase = Get.find();

  List<Reporte> get reports => _reports;

  @override
  void onInit() {
    initReports();
    //GET
    super.onInit();
  }

  initReports() async {
    _reports.value = [
      Reporte(
          id: 1,
          idcliente: 1,
          creatorName: "Creator 1",
          creactorId: 5,
          title: "Reporte 1",
          body: "Juanchito tira la silla",
          grade: 4,
          itsgraded: true),
      Reporte(
          id: 2,
          idcliente: 2,
          creatorName: "Creator 1",
          creactorId: 5,
          title: "Reporte 2",
          body: "Camilo tira la silla",
          grade: 0,
          itsgraded: false)
    ];
  }

  getReports() async {
    //_reports.value = await userUseCase.getUsers();
  }

  addReport(Reporte rep) async {
    //await userUseCase.addReport(rep);
    _reports.value = [..._reports.value, rep];
    getReports();
  }

  updateReport(Reporte rep) async {
    //await userUseCase.updateReport(rep);
    getReports();
  }

  void deleteUser(int id) async {
    //await userUseCase.deleteReport(id);
    getReports();
  }

  //void simulateProcess() async {
  //  await userUseCase.simulateProcess();
  //}
}
