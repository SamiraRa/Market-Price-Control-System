// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submitted_report_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubmittedReportAdapter extends TypeAdapter<SubmittedReport> {
  @override
  final int typeId = 1;

  @override
  SubmittedReport read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubmittedReport(
      date: fields[0] as String,
      marketName: fields[1] as String,
      suggestedPrice: fields[2] as String,
      prevPrice: fields[3] as String,
      itemName: fields[4] as String,
      itemImage: fields[5] as String,
      itemDetails: fields[6] as String,
      expDate: fields[7] as String,
      batchDate: fields[8] as String,
      itemId: fields[9] as String,
      itemWeight: fields[10] as String,
      itemQty: fields[11] as String,
      category: fields[12] as String,
      subCategory: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SubmittedReport obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.marketName)
      ..writeByte(2)
      ..write(obj.suggestedPrice)
      ..writeByte(3)
      ..write(obj.prevPrice)
      ..writeByte(4)
      ..write(obj.itemName)
      ..writeByte(5)
      ..write(obj.itemImage)
      ..writeByte(6)
      ..write(obj.itemDetails)
      ..writeByte(7)
      ..write(obj.expDate)
      ..writeByte(8)
      ..write(obj.batchDate)
      ..writeByte(9)
      ..write(obj.itemId)
      ..writeByte(10)
      ..write(obj.itemWeight)
      ..writeByte(11)
      ..write(obj.itemQty)
      ..writeByte(12)
      ..write(obj.category)
      ..writeByte(13)
      ..write(obj.subCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubmittedReportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
