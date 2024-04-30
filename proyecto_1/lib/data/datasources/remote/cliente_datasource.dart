import 'package:flutter/material.dart';
import 'package:proyecto_1/data/datasources/remote/i_cliente_datasource.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';

class ClienteDataSource implements IClienteDataSource {
  List<Cliente> Clientes = [
    Cliente(id: 12, name: "Pedro Perez"),
    Cliente(id: 34, name: "Juan Jimenez")
  ];

  @override
  Future<List<Cliente>> getClientes() async {
    return Future.value(Clientes);
  }

  @override
  Future<bool> addCliente(Cliente rep) async {
    Clientes = [...Clientes, rep];
    return Future.value(true);
  }

  @override
  Future<bool> updateCliente(Cliente rep) async {
    return Future.value(true);
  }

  @override
  Future<bool> deleteCliente(int id) async {
    return Future.value(true);
  }
}
