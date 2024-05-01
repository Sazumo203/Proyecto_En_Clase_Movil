import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loggy/loggy.dart';
import 'package:proyecto_1/data/datasources/remote/i_usuario_datasource.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';

class UsuarioDataSource implements IUsuarioDataSource {
  final http.Client httpClient;
  final String apiKey = '7mkMEO';

  UsuarioDataSource({http.Client? client})
      : httpClient = client ?? http.Client();
  List<Usuario> usuarios = [
    Usuario(
        id: 111, name: "Samuel Zuleta", correo: "s@a.com", password: "54321"),
    Usuario(
        id: 222, name: "Rafael Martinez", correo: "r@a.com", password: "654321")
  ];

  @override
  Future<List<Usuario>> getUsuarios() async {
    List<Usuario> users = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/data")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await httpClient.get(request);

    if (response.statusCode == 200) {
      //logInfo(response.body);
      final data = jsonDecode(response.body);

      users = List<Usuario>.from(data.skip(1).map((x) => Usuario.fromJson(x)));
      //users.removeAt(1);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
    return Future.value(users);
    //return Future.value(usuarios);
  }

  @override
  Future<bool> addUsuario(Usuario rep) async {
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
    //usuarios = [...usuarios, rep];
    //return Future.value(true);
  }

  @override
  Future<bool> updateUsuario(Usuario rep) async {
    return Future.value(true);
  }

  @override
  Future<bool> deleteUsuario(int id) async {
    return Future.value(true);
  }
}
