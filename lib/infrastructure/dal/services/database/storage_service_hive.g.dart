// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_service_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VMDatabaseAdapter extends TypeAdapter<VMDatabase> {
  @override
  final int typeId = 0;

  @override
  VMDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VMDatabase()
      ..id = fields[0] as int?
      ..property = fields[1] as String?
      ..record = fields[2] as String?
      ..value = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, VMDatabase obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.property)
      ..writeByte(2)
      ..write(obj.record)
      ..writeByte(3)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VMDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
