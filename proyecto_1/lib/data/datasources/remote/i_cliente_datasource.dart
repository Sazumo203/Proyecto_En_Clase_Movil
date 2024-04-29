

import 'package:proyecto_1/domain/models/Clientes.dart';

abstract class IClienteDataSource {
  Future<List<Cliente>> getClientes();

  Future<bool> addCliente(Cliente rep);

  Future<bool> updateCliente(Cliente rep);

  Future<bool> deleteCliente(int id);
}