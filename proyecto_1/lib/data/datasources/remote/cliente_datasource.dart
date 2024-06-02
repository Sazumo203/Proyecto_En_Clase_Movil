import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loggy/loggy.dart';
import 'package:proyecto_1/data/datasources/remote/i_cliente_datasource.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';

class ClienteDataSource implements IClienteDataSource {
  final http.Client httpClient;
  final String apiKey = 'HOkOIp';

  ClienteDataSource({http.Client? client})
      : httpClient = client ?? http.Client();
  List<Cliente> Clientes = [
    Cliente(id: 12, name: "Pedro Perez"),
    Cliente(id: 34, name: "Juan Jimenez")
  ];

  @override
  Future<List<Cliente>> getClientes() async {
    List<Cliente> users = [];
    var request = Uri.parse("https://retoolapi.dev/$apiKey/data")
        .resolveUri(Uri(queryParameters: {
      "format": 'json',
    }));

    var response = await httpClient.get(request);

    if (response.statusCode == 200) {
      //logInfo(response.body);
      final data = jsonDecode(response.body);

      users = List<Cliente>.from(data.skip(1).map((x) => Cliente.fromJson(x)));
      //users.removeAt(1);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('Error code ${response.statusCode}');
    }
    return Future.value(users);
    //return Future.value(Clientes);
  }

  @override
  Future<bool> addCliente(Cliente rep) async {
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
    //Clientes = [...Clientes, rep];
    //return Future.value(true);
  }

  @override
  Future<bool> updateCliente(Cliente rep) async {
    return Future.value(true);
  }

  @override
  Future<bool> deleteCliente(int id) async {
    return Future.value(true);
  }
}
