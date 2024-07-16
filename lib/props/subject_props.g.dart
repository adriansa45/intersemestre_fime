// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_props.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubjectPropsAdapter extends TypeAdapter<SubjectProps> {
  @override
  final int typeId = 1;

  @override
  SubjectProps read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubjectProps(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SubjectProps obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectPropsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
