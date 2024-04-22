class Usuario {
  Usuario(
      {this.id,
      required this.name,
      required this.correo,
      required this.password});

  int? id;
  String name;
  String correo;
  String password;

  int? get gid => id;
  String get gname => name;
  String get gcorreo => correo;
  String get gpassword => password;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json["id"],
      name: json["name"] ?? "Usuario",
      correo: json["correo"] ?? "",
      password: json["password"] ?? "12345");

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name,
        "correo": correo,
        "password": password,
      };
}