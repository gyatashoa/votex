// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiveUserDetails_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserDetailsAdapter extends TypeAdapter<HiveUserDetails> {
  @override
  final int typeId = 0;

  @override
  HiveUserDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUserDetails()
      ..departmentName = fields[0] as String?
      ..departmentId = fields[1] as String?
      ..collegeId = fields[2] as String?
      ..collegeName = fields[3] as String?
      ..dob = fields[4] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, HiveUserDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.departmentName)
      ..writeByte(1)
      ..write(obj.departmentId)
      ..writeByte(2)
      ..write(obj.collegeId)
      ..writeByte(3)
      ..write(obj.collegeName)
      ..writeByte(4)
      ..write(obj.dob);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
