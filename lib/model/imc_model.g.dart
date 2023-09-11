// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcModelAdapter extends TypeAdapter<ImcModel> {
  @override
  final int typeId = 1;

  @override
  ImcModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcModel()
      .._tipo = fields[0] as String
      .._categoria = fields[1] as double;
  }

  @override
  void write(BinaryWriter writer, ImcModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._tipo)
      ..writeByte(1)
      ..write(obj._categoria);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
