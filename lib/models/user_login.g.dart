// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLoginAdapter extends TypeAdapter<UserLogin> {
  @override
  final int typeId = 2;

  @override
  UserLogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLogin(
      userId: fields[0] as String,
      username: fields[1] as String,
      areaId: fields[2] as String,
      areaName: fields[3] as String,
      password: fields[4] as String,
      deviceId: fields[5] as String,
      deviceBrand: fields[6] as String,
      deviceModel: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserLogin obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.areaId)
      ..writeByte(3)
      ..write(obj.areaName)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.deviceId)
      ..writeByte(6)
      ..write(obj.deviceBrand)
      ..writeByte(7)
      ..write(obj.deviceModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
