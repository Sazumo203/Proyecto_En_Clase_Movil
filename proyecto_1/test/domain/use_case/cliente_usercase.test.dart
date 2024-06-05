import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/domain/use_case/cliente_usercase.dart';
import '../mocks/cliente_controller_unit_test.mocks.dart';

// Mock de ClientRepository
//class MockIClientRepository extends Mock implements ClientRepository {}

void main() {
  late MockIClienteRepository mockClientRepository;
  late ClienteUserCase clientUseCase;
  late Cliente newUser;

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockClientRepository = MockIClienteRepository();
    clientUseCase = ClienteUserCase(mockClientRepository);
    newUser = Cliente(id: 999999999, name: 'Tester Client');
  });

  test('getClients should call getClients on the repository', () async {
    when(mockClientRepository.getClientes())
        .thenAnswer((_) async => <Cliente>[]);

    await clientUseCase.getClientes();

    verify(mockClientRepository.getClientes()).called(1);
  });

  test('addClient should call addClient method on the repository', () async {
    when(mockClientRepository.addCliente(newUser)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    await clientUseCase.addCliente(newUser);

    // Assert
    verify(mockClientRepository.addCliente(newUser)).called(1);
  });

  test('updateClient should call updateClient method on the repository',
      () async {
    when(mockClientRepository.updateCliente(newUser)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    await clientUseCase.updateCliente(newUser);

    // Assert
    verify(mockClientRepository.updateCliente(newUser)).called(1);
  });

  test('deleteClient should call deleteClient method on the repository',
      () async {
    when(mockClientRepository.deleteCliente(newUser.id)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    await clientUseCase.deleteCliente(newUser.id!);

    // Assert
    verify(mockClientRepository.deleteCliente(newUser.id)).called(1);
  });
}
