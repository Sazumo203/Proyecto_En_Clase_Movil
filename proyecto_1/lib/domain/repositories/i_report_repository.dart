
import 'package:proyecto_1/data/datasources/remote/i_report_datasource.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';

abstract class IReportRepository {
  final IReportDataSource _ReportDatatasource;

  IReportRepository(this._ReportDatatasource);

  Future<List<Reporte>> getReports();

  Future<bool> addReport(Reporte rep);

  Future<bool> updateReport(Reporte rep);

  Future<bool> deleteReport(int id);
}
