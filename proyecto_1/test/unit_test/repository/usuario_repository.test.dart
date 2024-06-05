import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:proyecto_1/data/repositories/usuario_repository.dart';
import 'package:proyecto_1/data/repositories/usuario_repository.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';

import '../mocks/Usuario_controller_unit_test.mocks.dart';

void main() {
  late MockIUsuarioDataSource mockIClientDataSource;
  late UsuarioRepository clientRepository;
  late Usuario client;

  setUp(() {
    mockIClientDataSource = MockIUsuarioDataSource();
    clientRepository = UsuarioRepository(mockIClientDataSource);
    client = Usuario(
        id: 999999999,
        name: 'Tester Client',
        correo: 'z@a.com',
        password: '123');
  });

  test('getClients should call getClients on the datasource', () async {
    when(mockIClientDataSource.getUsuarios())
        .thenAnswer((_) async => <Usuario>[]);

    await clientRepository.getUsuarios();

    verify(mockIClientDataSource.getUsuarios()).called(1);
  });

  test('addClient should call addClient method on the datasource', () async {
    when(mockIClientDataSource.addUsuario(client)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    bool result = await clientRepository.addUsuario(client);

    // Assert
    verify(mockIClientDataSource.addUsuario(client)).called(1);
    expect(result, isTrue);
  });

  test('updateClient should call updateClient method on the datasource',
      () async {
    when(mockIClientDataSource.updateUsuario(client)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await clientRepository.updateUsuario(client);

    // Assert
    verify(mockIClientDataSource.updateUsuario(client)).called(1);
    expect(result, isTrue);
  });

  test('deleteClient should call deleteClient method on the datasource',
      () async {
    when(mockIClientDataSource.deleteUsuario(client.id)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    bool result = await clientRepository.deleteUsuario(client.id!);

    // Assert
    verify(mockIClientDataSource.deleteUsuario(client.id)).called(1);
    expect(result, isTrue);
  });
}
