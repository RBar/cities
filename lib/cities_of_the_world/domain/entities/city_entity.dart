import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/country_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class City extends Equatable {
  final int id;
  final String name;
  final String localName;
  final double lat;
  final double lng;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int countryId;
  final Country country;

  const City({
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

  // equatable thing, for data class purposes
  @override
  List<Object> get props =>
      [id, name, localName, lat, lng, createdAt, updatedAt, country, countryId];
}
