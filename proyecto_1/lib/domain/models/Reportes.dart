import 'package:flutter/material.dart';

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

  String get gtitle => title;
  String get gcreatorName => creatorName;
  int get ggrade => grade;

  factory Reporte.fromJson(Map<String, dynamic> json) => Reporte(
      id: json["id"],
      idcliente: json["idcliente"],
      creatorName: json["creatorName"] ?? "creador",
      creactorId: json["creactorId"] ?? "00000",
      title: json["title"] ?? "NA",
      body: json["body"] ?? "NA",
      grade: json["grade"] ?? "0",
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
