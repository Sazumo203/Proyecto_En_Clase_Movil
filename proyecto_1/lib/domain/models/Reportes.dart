class Reporte {
  Reporte(
      {this.id,
      required this.creatorName,
      required this.creactorId,
      required this.title,
      required this.body,
      required this.grade,
      required this.idcliente,
      required this.itsgraded});

  int? id;
  int? idcliente;
  String creatorName;
  int creactorId;
  String title;
  String body;
  int grade;
  bool itsgraded;

  String get gtitle => title;
  String get gcreatorName => creatorName;

  factory Reporte.fromJson(Map<String, dynamic> json) => Reporte(
      id: json["id"],
      idcliente: json["idcliente"],
      creatorName: json["creatorName"] ?? "creador",
      creactorId: json["creactorId"] ?? "00000",
      title: json["title"] ?? "NA",
      body: json["body"] ?? "NA",
      grade: json["grade"] ?? "0",
      itsgraded: json["itsgraded"] ?? false);

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "idcliente": idcliente,
        "creatorName": creatorName,
        "creactorId": creactorId,
        "title": title,
        "body": body,
        "grade": grade,
        "itsgraded": itsgraded
      };
}
