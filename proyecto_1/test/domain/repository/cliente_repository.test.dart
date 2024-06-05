import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:proyecto_1/data/repositories/cliente_repository.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';

import '../use_cases/Usuario_controller_unit_test.mocks.dart';

void main() {
  late MockIClienteDataSource mockIClientDataSource;
  late ClienteRepository clientRepository;
  late Cliente client;

  setUp(() {
    mockIClientDataSource = MockIClienteDataSource();
    clientRepository = ClienteRepository(mockIClientDataSource);
    client = Cliente(id: 999999999, name: 'Tester Client');
  });

  test('getClients should call getClients on the datasource', () async {
    when(mockIClientDataSource.getClientes())
        .thenAnswer((_) async => <Cliente>[]);

    await clientRepository.getClientes();

    verify(mockIClientDataSource.getClientes()).called(1);
  });

  test('addClient should call addClient method on the datasource', () async {
    when(mockIClientDataSource.addCliente(client)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    bool result = await clientRepository.addCliente(client);

    // Assert
    verify(mockIClientDataSource.addCliente(client)).called(1);
    expect(result, isTrue);
  });

  test('updateClient should call updateClient method on the datasource',
      () async {
    when(mockIClientDataSource.updateCliente(client)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await clientRepository.updateCliente(client);

    // Assert
    verify(mockIClientDataSource.updateCliente(client)).called(1);
    expect(result, isTrue);
  });

  test('deleteClient should call deleteClient method on the datasource',
      () async {
    when(mockIClientDataSource.deleteCliente(client.id)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await clientRepository.deleteCliente(client.id!);

    // Assert
    verify(mockIClientDataSource.deleteCliente(client.id)).called(1);
    expect(result, isTrue);
  });
}
