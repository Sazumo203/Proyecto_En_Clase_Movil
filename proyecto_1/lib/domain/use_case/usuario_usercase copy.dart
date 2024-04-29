


import 'package:proyecto_1/domain/models/Usuarios.dart';
import 'package:proyecto_1/domain/repositories/i_usuario_repository.dart';

class UsuarioUserCase {
  final IUsuarioRepository _repository;

  UsuarioUserCase(this._repository);

  Future<List<Usuario>> getUsuarios() async => await _repository.getUsuarios();

  Future<bool> addUsuario(Usuario rep) async => await _repository.addUsuario(rep);

  Future<bool> updateUsuario(Usuario rep) async =>
      await _repository.updateUsuario(rep);

  Future<bool> deleteUsuario(int id) async => await _repository.deleteUsuario(id);
}
