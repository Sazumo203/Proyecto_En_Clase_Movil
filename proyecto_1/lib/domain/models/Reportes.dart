import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'Reportes.g.dart';

class Reporte {
  Reporte(
      {this.id,
      required this.creatorName,
      required this.creactorId,
      required this.title,
      required this.body,
      required this.grade,
      required this.idcliente,
      required this.itsgraded,
      required this.horainicio,
      required this.duracion});

  int? id;
  int? idcliente;
  String creatorName;
  int creactorId;
  String title;
  String body;
  int grade;
  bool itsgraded;
  String horainicio;
  int duracion;

  factory Reporte.fromJson(Map<String, dynamic> json) => Reporte(
      id: json["id"],
      idcliente: json["idcliente"],
      creatorName: json["creatorName"] ?? "creador",
      creactorId: json["creactorId"] ?? 00000,
      title: json["title"] ?? "NA",
      body: json["body"] ?? "NA",
      grade: json["grade"] ?? 0,
      itsgraded: json["itsgraded"] ?? false,
      horainicio: json["horainicio"] ?? "04:20",
      duracion: json["duracion"] ?? 30);

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "idcliente": idcliente,
        "creatorName": creatorName,
        "creactorId": creactorId,
        "title": title,
        "body": body,
        "grade": grade,
        "itsgraded": itsgraded,
        "horainicio": horainicio,
        "duracion": duracion
      };
}

@HiveType(typeId: 0)
class ReporteHive extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? idcliente;

  @HiveField(2)
  String creatorName;

  @HiveField(3)
  int creactorId;

  @HiveField(4)
  String title;

  @HiveField(5)
  String body;

  @HiveField(6)
  int grade;

  @HiveField(7)
  bool itsgraded;

  @HiveField(8)
  String horainicio;

  @HiveField(9)
  int duracion;

  ReporteHive(
      {this.id,
      required this.creatorName,
      required this.creactorId,
      required this.title,
      required this.body,
      required this.grade,
      required this.idcliente,
      required this.itsgraded,
      required this.horainicio,
      required this.duracion});

  factory ReporteHive.fromReporte(Reporte reporte) {
    return ReporteHive(
      id: reporte.id,
      idcliente: reporte.idcliente,
      creatorName: reporte.creatorName,
      creactorId: reporte.creactorId,
      title: reporte.title,
      body: reporte.body,
      grade: reporte.grade,
      itsgraded: reporte.itsgraded,
      horainicio: reporte.horainicio,
      duracion: reporte.duracion,
    );
  }

  Reporte toReporte() {
    return Reporte(
      id: id,
      idcliente: idcliente,
      creatorName: creatorName,
      creactorId: creactorId,
      title: title,
      body: body,
      grade: grade,
      itsgraded: itsgraded,
      horainicio: horainicio,
      duracion: duracion,
    );
  }
}
