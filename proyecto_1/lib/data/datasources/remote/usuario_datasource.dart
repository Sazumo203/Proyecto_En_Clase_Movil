
import 'package:flutter/material.dart';
import 'package:proyecto_1/data/datasources/remote/i_Usuario_datasource.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';


class UsuarioDataSource implements IUsuarioDataSource {
 List<Usuario> usuarios = [
      Usuario(
          id: 111, name: "Samuel Zuleta", correo: "s@a.com", password: "54321"),
      Usuario(
          id: 222,
          name: "Rafael Martinez",
          correo: "r@a.com",
          password: "654321")
    ];


  @override
  Future<List<Usuario>> getUsuarios() async {
    return Future.value(usuarios);
  }

  @override
  Future<bool> addUsuario(Usuario rep) async {
    usuarios = [...usuarios, rep];
    return Future.value(true);
  }

  @override
  Future<bool> updateUsuario(Usuario rep) async {
      return Future.value(true);
  
  }

  @override
  Future<bool> deleteUsuario(int id) async {
      return Future.value(true);
  }
}
