// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseDataClassModelAdapter
    extends TypeAdapter<ResponseDataClassModel> {
  @override
  final int typeId = 3;

  @override
  ResponseDataClassModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseDataClassModel(
      items: (fields[0] as List)?.cast<CityModel>(),
      pagination: fields[1] as PaginationModel,
    );
  }

  @override
  void write(BinaryWriter writer, ResponseDataClassModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.items)
      ..writeByte(1)
      ..write(obj.pagination);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseDataClassModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDataClassModel _$ResponseDataClassModelFromJson(Map json) {
  return ResponseDataClassModel(
    items: (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : CityModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    pagination: json['pagination'] == null
        ? null
        : PaginationModel.fromJson((json['pagination'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$ResponseDataClassModelToJson(
        ResponseDataClassModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'pagination': instance.pagination,
    };
