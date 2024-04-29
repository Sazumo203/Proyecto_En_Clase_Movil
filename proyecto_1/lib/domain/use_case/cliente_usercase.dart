


import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/domain/repositories/i_cliente_repository.dart';

class ClienteUserCase {
  final IClienteRepository _repository;

  ClienteUserCase(this._repository);

  Future<List<Cliente>> getClientes() async => await _repository.getClientes();

  Future<bool> addCliente(Cliente rep) async => await _repository.addCliente(rep);

  Future<bool> updateCliente(Cliente rep) async =>
      await _repository.updateCliente(rep);

  Future<bool> deleteCliente(int id) async => await _repository.deleteCliente(id);
}
