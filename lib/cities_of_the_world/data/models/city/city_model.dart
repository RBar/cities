import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/country/country_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'city_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(anyMap: true, fieldRename: FieldRename.snake)
class CityModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String localName;
  @HiveField(3)
  final double lat;
  @HiveField(4)
  final double lng;
  @HiveField(5)
  final DateTime createdAt;
  @HiveField(6)
  final DateTime updatedAt;
  @HiveField(7)
  final int countryId;
  @HiveField(8)
  final CountryModel country;
  @HiveField(9)
  const CityModel({
    @required this.id,
    @required this.name,
    @required this.localName,
    @required this.lat,
    @required this.lng,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.countryId,
    @required this.country,
  });
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  City toDomain() => City(
      id: id,
      name: name,
      localName: localName,
      lat: lat,
      lng: lng,
      createdAt: createdAt,
      updatedAt: updatedAt,
      countryId: countryId,
      country: country.toDomain());

  @override
  List<Object> get props =>
      [id, name, localName, lat, lng, createdAt, updatedAt, country, countryId];
}

class Cities {
  List<CityModel> items = [];
  Cities();
  Cities.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (final item in jsonList) {
      final city = CityModel.fromJson(item as Map<String, dynamic>);
      items.add(city);
    }
  }
}
