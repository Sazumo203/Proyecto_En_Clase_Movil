import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';


class ReportController extends GetxController {
  final RxList<Reporte> _reports = <Reporte>[].obs;
  //final UserUseCase userUseCase = Get.find();

  List<Reporte> get reports => _reports;

  @override
  void onInit() {
    getReports();
    super.onInit();
  }

  getReports() async {
    //_reports.value = await userUseCase.getUsers();
  }

  addReport(Reporte rep) async {
    //await userUseCase.addReport(rep);
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
