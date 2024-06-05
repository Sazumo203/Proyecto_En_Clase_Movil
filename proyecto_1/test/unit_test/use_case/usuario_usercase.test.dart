import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';
import 'package:proyecto_1/domain/use_case/usuario_usercase.dart';
import '../mocks/Usuario_controller_unit_test.mocks.dart';


// Mock de ClientRepository
//class MockIClientRepository extends Mock implements ClientRepository {}

void main() {
  late MockIUsuarioRepository mockClientRepository;
  late UsuarioUserCase clientUseCase;
  late Usuario newUser;

  setUp(() {
    // Inicialización del mock y la instancia de ClientUseCase
    mockClientRepository = MockIUsuarioRepository();
    clientUseCase = UsuarioUserCase(mockClientRepository);
    newUser = Usuario(
        id: 999999999,
        name: 'Tester Client',
        correo: 'z@a.com',
        password: '123');
  });

  test('getClients should call getClients on the repository', () async {
    when(mockClientRepository.getUsuarios())
        .thenAnswer((_) async => <Usuario>[]);

    await clientUseCase.getUsuarios();

    verify(mockClientRepository.getUsuarios()).called(1);
  });

  test('addClient should call addClient method on the repository', () async {
    when(mockClientRepository.addUsuario(newUser)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    await clientUseCase.addUsuario(newUser);

    // Assert
    verify(mockClientRepository.addUsuario(newUser)).called(1);
  });

  test('updateClient should call updateClient method on the repository',
      () async {
    when(mockClientRepository.updateUsuario(newUser)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    await clientUseCase.updateUsuario(newUser);

    // Assert
    verify(mockClientRepository.updateUsuario(newUser)).called(1);
  });

  test('deleteClient should call deleteClient method on the repository',
      () async {
    when(mockClientRepository.deleteUsuario(newUser.id)).thenAnswer((_) async =>
        true); // Asegura que el método mockeado devuelva un Future<bool>

    // Act
    await clientUseCase.deleteUsuario(newUser.id!);

    // Assert
    verify(mockClientRepository.deleteUsuario(newUser.id)).called(1);
  });
}
