// Mocks generated by Mockito 5.4.4 from annotations
// in proyecto_1/test/domain/use_cases/Usuario_controller_unit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:proyecto_1/domain/models/Usuarios.dart' as _i4;
import 'package:proyecto_1/domain/use_case/usuario_usercase.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [UsuarioUserCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsuarioUserCase extends _i1.Mock implements _i2.UsuarioUserCase {
  MockUsuarioUserCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Usuario>> getUsuarios() => (super.noSuchMethod(
        Invocation.method(
          #getUsuarios,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Usuario>>.value(<_i4.Usuario>[]),
      ) as _i3.Future<List<_i4.Usuario>>);

  @override
  _i3.Future<bool> addUsuario(_i4.Usuario? rep) => (super.noSuchMethod(
        Invocation.method(
          #addUsuario,
          [rep],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> updateUsuario(_i4.Usuario? rep) => (super.noSuchMethod(
        Invocation.method(
          #updateUsuario,
          [rep],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> deleteUsuario(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteUsuario,
          [id],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
