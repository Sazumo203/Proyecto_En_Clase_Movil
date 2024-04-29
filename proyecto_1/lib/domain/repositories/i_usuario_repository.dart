

import 'package:proyecto_1/data/datasources/remote/i_usuario_datasource.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';

abstract class IUsuarioRepository {
  final IUsuarioDataSource _UsuarioDatatasource;

  IUsuarioRepository(this._UsuarioDatatasource);

  Future<List<Usuario>> getUsuarios();

  Future<bool> addUsuario(Usuario rep);

  Future<bool> updateUsuario(Usuario rep);

  Future<bool> deleteUsuario(int id);
}
