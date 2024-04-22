import 'dart:html';

import 'package:flutter/material.dart';
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
          title: "Reporte de la mañana",
          body: "Juanchito tira la silla y la parte",
          grade: 4,
          itsgraded: true,
          horainicio: const TimeOfDay(hour: 8, minute: 30),
          duracion: 25),
      Reporte(
          id: 2,
          idcliente: 2,
          creatorName: "Creator 1",
          creactorId: 5,
          title: "Reporte de la tarde",
          body: "Camilo se da trompá con Juanchito por estúpido",
          grade: 0,
          itsgraded: false,
          horainicio: const TimeOfDay(hour: 17, minute: 25),
          duracion: 45)
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

  updateReport(Reporte rep,int nota) async {
    Reporte reporte =_reports.firstWhere((repo) => repo.id == rep.id);
    reporte.grade = nota;
    reporte.itsgraded = true;
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
