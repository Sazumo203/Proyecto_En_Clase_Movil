import 'dart:html';

import 'package:flutter/material.dart';
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

  void upCal(int cal){
    _calificacion.value= cal;
  }



  //initReports() async {
  //  _reports.value = [
  //    Reporte(
  //        id: 1,
  //        idcliente: 1,
  //        creatorName: "Creator 1",
  //        creactorId: 5,
  //        title: "Reporte de la mañana",
  //        body: "Juanchito tira la silla y la parte",
  //        grade: 4,
  //        itsgraded: true,
  //        horainicio: const TimeOfDay(hour: 8, minute: 30),
  //        duracion: 25),
  //    Reporte(
  //        id: 2,
  //        idcliente: 2,
  //        creatorName: "Creator 1",
  //        creactorId: 5,
  //        title: "Reporte de la tarde",
  //        body: "Camilo se da trompá con Juanchito por estúpido",
  //        grade: 0,
  //        itsgraded: false,
  //        horainicio: const TimeOfDay(hour: 17, minute: 25),
  //        duracion: 45)
  //  ];
  //}


  getReports() async {
    _reports.value = await reportUserCase.getReports();
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
  //void simulateProcess() async {
  //  await userUseCase.simulateProcess();
  //}
}
