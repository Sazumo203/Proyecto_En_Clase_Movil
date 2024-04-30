import 'package:proyecto_1/data/datasources/remote/i_report_datasource.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/domain/repositories/I_report_repository.dart';

class ReportRepository implements IReportRepository {
  final IReportDataSource _userDatatasource;
  ReportRepository(this._userDatatasource);

  @override
  Future<List<Reporte>> getReports() async =>
      await _userDatatasource.getReports();

  @override
  Future<bool> addReport(Reporte rep) async =>
      await _userDatatasource.addReport(rep);
  @override
  Future<bool> updateReport(Reporte rep) async =>
      await _userDatatasource.updateReport(rep);
  @override
  Future<bool> deleteReport(int id) async =>
      await _userDatatasource.deleteReport(id);
}
