

import 'package:proyecto_1/domain/models/Reportes.dart';

abstract class IReportDataSource {
  Future<List<Reporte>> getReports();

  Future<bool> addReport(Reporte rep);

  Future<bool> updateReport(Reporte rep);

  Future<bool> deleteReport(int id);
}