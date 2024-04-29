

import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/domain/repositories/I_report_repository.dart';

class ReportUserCase {
  final IReportRepository _repository;

  ReportUserCase(this._repository);

  Future<List<Reporte>> getReports() async => await _repository.getReports();

  Future<bool> addReport(Reporte rep) async => await _repository.addReport(rep);

  Future<bool> updateReport(Reporte rep) async =>
      await _repository.updateReport(rep);

  Future<bool> deleteReport(int id) async => await _repository.deleteReport(id);
}
