import 'package:flutter/material.dart';
import 'package:proyecto_1/data/datasources/remote/i_report_datasource.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';

class ReportDataSource implements IReportDataSource {
  List<Reporte> repors = [
    Reporte(
        id: 1,
        idcliente: 1,
        creatorName: "Rafael Martinez",
        creactorId: 222,
        title: "Reporte de la mañana",
        body: "Juanchito tira la silla y la parte",
        grade: 4,
        itsgraded: true,
        horainicio: const TimeOfDay(hour: 8, minute: 30),
        duracion: 25),
    Reporte(
        id: 2,
        idcliente: 2,
        creatorName: "Samuel Zuleta",
        creactorId: 111,
        title: "Reporte de la tarde",
        body: "Camilo se da trompá con Juanchito por estúpido",
        grade: 0,
        itsgraded: false,
        horainicio: const TimeOfDay(hour: 17, minute: 25),
        duracion: 45)
  ];

  @override
  Future<List<Reporte>> getReports() async {
    return Future.value(repors);
  }

  @override
  Future<bool> addReport(Reporte rep) async {
    repors = [...repors, rep];
    return Future.value(true);
  }

  @override
  Future<bool> updateReport(Reporte rep) async {
    Reporte reporte = repors.firstWhere((repo) => repo.id == rep.id);
    reporte.grade = rep.grade;
    reporte.itsgraded = true;

    return Future.value(true);
  }

  @override
  Future<bool> deleteReport(int id) async {
    return Future.value(false);
  }
}
