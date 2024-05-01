import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loggy/loggy.dart';
import 'package:proyecto_1/data/datasources/remote/i_report_datasource.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';

class ReportDataSource implements IReportDataSource {
  final http.Client httpClient;
  final String apiKey = 'i8sNE4';

  ReportDataSource({http.Client? client})
      : httpClient = client ?? http.Client();

  List<Reporte> repors = [
    Reporte(
        id: 1,
        idcliente: 1,
        creatorName: "Rafael Martinez",
        creactorId: 222,
        title: "Reporte de la mañana",
        body: "Juanchito la silla y la parte",
        grade: 4,
        itsgraded: true,
        horainicio: "8:30",
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
        horainicio: "17:25",
        duracion: 45)
  ];

  @override
  Future<List<Reporte>> getReports() async {
    List<Reporte> users = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/data")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await httpClient.get(request);

    if (response.statusCode == 200) {
      //logInfo(response.body);
      final data = jsonDecode(response.body);

      users = List<Reporte>.from(data.skip(1).map((x) => Reporte.fromJson(x)));
      //users.removeAt(1);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
    return Future.value(users);
    //return Future.value(repors);
  }

  @override
  Future<bool> addReport(Reporte rep) async {
    logInfo("Web service, Adding user");

    final response = await httpClient.post(
      Uri.parse("https://retoolapi.dev/$apiKey/data"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(rep.toJson()),
    );

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
    //repors = [...repors, rep];
    //return Future.value(true);
  }

  @override
  Future<bool> updateReport(Reporte rep) async {
    final response = await httpClient.put(
      Uri.parse("https://retoolapi.dev/$apiKey/data/${rep.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(rep.toJson()),
    );

    if (response.statusCode == 200) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
    //Reporte reporte = repors.firstWhere((repo) => repo.id == rep.id);
    //reporte.grade = rep.grade;
    //reporte.itsgraded = true;

    //return Future.value(true);
  }

  @override
  Future<bool> deleteReport(int id) async {
    return Future.value(false);
  }
}
