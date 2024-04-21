class Reporte {
  Reporte({
    this.id,
    required this.creatorName,
    required this.creactorId,
    required this.title,
    required this.body,
    required this.grade,
  });

  int? id;
  String creatorName;
  int creactorId;
  String title;
  String body;
  int grade;

  String get gtitle  => title;
  String get gcreatorName  => creatorName;

  factory Reporte.fromJson(Map<String, dynamic> json) => Reporte(
        id: json["id"],
        creatorName: json["creatorName"] ?? "creador",
        creactorId: json["creactorId"] ?? "00000",
        title: json["title"] ?? "NA",
        body: json["body"] ?? "NA",
        grade: json["grade"] ?? "0"
      );


  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "creatorName": creatorName,
        "creactorId": creactorId,
        "title": title,
        "body": body,
        "grade": grade
      };
}