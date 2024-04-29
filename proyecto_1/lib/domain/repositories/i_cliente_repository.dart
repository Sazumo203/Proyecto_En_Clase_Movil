

import 'package:proyecto_1/data/datasources/remote/i_Cliente_datasource.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';

abstract class IClienteRepository {
  final IClienteDataSource _ClienteDatatasource;

  IClienteRepository(this._ClienteDatatasource);

  Future<List<Cliente>> getClientes();

  Future<bool> addCliente(Cliente rep);

  Future<bool> updateCliente(Cliente rep);

  Future<bool> deleteCliente(int id);
}
