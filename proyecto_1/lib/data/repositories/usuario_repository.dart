

import 'package:proyecto_1/data/datasources/remote/i_usuario_datasource.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';
import 'package:proyecto_1/domain/repositories/I_Usuario_repository.dart';

class UsuarioRepository implements IUsuarioRepository {
  final IUsuarioDataSource _userDatatasource;
  UsuarioRepository(this._userDatatasource);

  @override
  Future<List<Usuario>> getUsuarios() async => await _userDatatasource.getUsuarios();

  @override
  Future<bool> addUsuario(Usuario rep) async =>
      await _userDatatasource.addUsuario(rep);
  @override
  Future<bool> updateUsuario(Usuario rep) async =>
      await _userDatatasource.updateUsuario(rep);
  @override
  Future<bool> deleteUsuario(int id) async =>
      await _userDatatasource.deleteUsuario(id);
}
