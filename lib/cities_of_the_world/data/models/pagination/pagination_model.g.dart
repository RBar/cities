// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaginationModelAdapter extends TypeAdapter<PaginationModel> {
  @override
  final typeId = 2;

  @override
  PaginationModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaginationModel(
      currentPage: fields[0] as int,
      lastPage: fields[1] as int,
      perPage: fields[2] as int,
      total: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PaginationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.currentPage)
      ..writeByte(1)
      ..write(obj.lastPage)
      ..writeByte(2)
      ..write(obj.perPage)
      ..writeByte(3)
      ..write(obj.total);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map json) {
  return PaginationModel(
    currentPage: json['current_page'] as int,
    lastPage: json['last_page'] as int,
    perPage: json['per_page'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
