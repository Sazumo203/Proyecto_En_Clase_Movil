import 'package:proyecto_1/domain/models/Usuarios.dart';

abstract class IUsuarioDataSource {
  Future<List<Usuario>> getUsuarios();

  Future<bool> addUsuario(Usuario rep);

  Future<bool> updateUsuario(Usuario rep);

  Future<bool> deleteUsuario(int id);
}
