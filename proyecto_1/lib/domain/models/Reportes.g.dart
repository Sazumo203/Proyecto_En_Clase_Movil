// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Reportes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReporteHiveAdapter extends TypeAdapter<ReporteHive> {
  @override
  final int typeId = 0;

  @override
  ReporteHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReporteHive(
      id: fields[0] as int?,
      creatorName: fields[2] as String,
      creactorId: fields[3] as int,
      title: fields[4] as String,
      body: fields[5] as String,
      grade: fields[6] as int,
      idcliente: fields[1] as int?,
      itsgraded: fields[7] as bool,
      horainicio: fields[8] as String,
      duracion: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ReporteHive obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idcliente)
      ..writeByte(2)
      ..write(obj.creatorName)
      ..writeByte(3)
      ..write(obj.creactorId)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.body)
      ..writeByte(6)
      ..write(obj.grade)
      ..writeByte(7)
      ..write(obj.itsgraded)
      ..writeByte(8)
      ..write(obj.horainicio)
      ..writeByte(9)
      ..write(obj.duracion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReporteHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
