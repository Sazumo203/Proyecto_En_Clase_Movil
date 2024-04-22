class Cliente {
  Cliente(
      {this.id,
      required this.name,});

  int? id;
  String name;

  int? get gid => id;
  String get gname => name;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
      id: json["id"],
      name: json["name"] ?? "Cliente");

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name,
      };
}