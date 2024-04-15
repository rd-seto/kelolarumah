// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      token: fields[0] as String,
      tokenType: fields[1] as String,
      id: fields[2] as int?,
      name: fields[3] as String?,
      email: fields[4] as String?,
      phone: fields[5] as String?,
      occupation: fields[6] as String?,
      designation: fields[7] as String?,
      institution: fields[8] as String?,
      nid: fields[9] as String?,
      dateOfBirth: fields[10] as String?,
      passport: fields[11] as String?,
      gender: fields[12] as String?,
      roleId: fields[13] as int?,
      avatar: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.tokenType)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.occupation)
      ..writeByte(7)
      ..write(obj.designation)
      ..writeByte(8)
      ..write(obj.institution)
      ..writeByte(9)
      ..write(obj.nid)
      ..writeByte(10)
      ..write(obj.dateOfBirth)
      ..writeByte(11)
      ..write(obj.passport)
      ..writeByte(12)
      ..write(obj.gender)
      ..writeByte(13)
      ..write(obj.roleId)
      ..writeByte(14)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
