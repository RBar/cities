import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/country_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'country_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(anyMap: true, fieldRename: FieldRename.snake)
class CountryModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String code;
  @HiveField(3)
  final DateTime createdAt;
  @HiveField(4)
  final DateTime updatedAt;
  @HiveField(5)
  final int continentId;
  @HiveField(6)
  const CountryModel({
    @required this.id,
    @required this.name,
    @required this.code,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.continentId,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  Country toDomain() => Country(
      id: id,
      name: name,
      code: code,
      createdAt: createdAt,
      updatedAt: updatedAt,
      continentId: continentId);

  @override
  List<Object> get props => [id, name, code, createdAt, updatedAt, continentId];
}
