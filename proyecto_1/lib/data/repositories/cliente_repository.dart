import 'package:proyecto_1/data/datasources/remote/i_cliente_datasource.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/domain/repositories/i_cliente_repository.dart';

class ClienteRepository implements IClienteRepository {
  final IClienteDataSource _clienteDatatasource;
  ClienteRepository(this._clienteDatatasource);

  @override
  Future<List<Cliente>> getClientes() async =>
      await _clienteDatatasource.getClientes();

  @override
  Future<bool> addCliente(Cliente rep) async =>
      await _clienteDatatasource.addCliente(rep);
  @override
  Future<bool> updateCliente(Cliente rep) async =>
      await _clienteDatatasource.updateCliente(rep);
  @override
  Future<bool> deleteCliente(int id) async =>
      await _clienteDatatasource.deleteCliente(id);
}
