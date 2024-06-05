import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_1/data/datasources/remote/cliente_datasource.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';

void main() {
  late ClienteDataSource datasource;
  late http.Client httpClient;
  late Cliente newUser;

  setUp(() {
    httpClient = http.Client();
    datasource = ClienteDataSource(client: httpClient);
    newUser = Cliente(
      id: Random().nextInt(99999),
      name: 'Supporter',
    );
  });

  tearDown(() {
    httpClient.close(); // Close the client to clean up resources
  });
  test('Create, Get supports, Update, and Delete an entry', () async {
    // Step 1: Create an entry
    bool createResult = await datasource.addCliente(newUser);
    print('createResult value is: $createResult');
    expect(createResult, isTrue);

    // Step 2: Retrieve the user to get the ID
    List<Cliente> users = await datasource.getClientes();
    // Using firstWhere with orElse to handle the case where no user is found
    Cliente? createdUser = users.firstWhereOrNull((user) {
      print(user.id);
      return (user.id == newUser.id);
    });

    print('createdUser.id value is: ${createdUser!.id}');
    expect(createdUser, isNotNull);

    // // Step 3: Update the entry
    createdUser.name =
        'Support Name 1'; // Safe because createdUser is not null here
    bool updateResult = await datasource.updateCliente(createdUser);
    print('updateResult value is $updateResult');
    expect(updateResult, isTrue);
  });
}
