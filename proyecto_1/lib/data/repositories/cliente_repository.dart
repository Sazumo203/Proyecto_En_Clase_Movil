

import 'package:proyecto_1/data/datasources/remote/i_Cliente_datasource.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/domain/repositories/I_Cliente_repository.dart';

class ClienteRepository implements IClienteRepository {
  final IClienteDataSource _userDatatasource;
  ClienteRepository(this._userDatatasource);

  @override
  Future<List<Cliente>> getClientes() async => await _userDatatasource.getClientes();

  @override
  Future<bool> addCliente(Cliente rep) async =>
      await _userDatatasource.addCliente(rep);
  @override
  Future<bool> updateCliente(Cliente rep) async =>
      await _userDatatasource.updateCliente(rep);
  @override
  Future<bool> deleteCliente(int id) async =>
      await _userDatatasource.deleteCliente(id);
}
