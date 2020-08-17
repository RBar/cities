import 'dart:convert';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/city/city_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/country/country_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tCityModel = CityModel(
      id: 1,
      name: 'test',
      localName: 'test',
      lat: 1,
      lng: 1,
      createdAt: DateTime.parse("2018-01-07 17:08:01"),
      updatedAt: DateTime.parse("2018-01-07 17:08:01"),
      countryId: 1,
      country: CountryModel(
          id: 1,
          name: 'test',
          code: 'test',
          createdAt: DateTime.parse("2018-01-07 17:08:01"),
          updatedAt: DateTime.parse("2018-01-07 17:08:01"),
          continentId: 1));
  test('should be return a City after use toDomain()', () async {
    //assert
    expect(tCityModel.toDomain(), isA<City>());
  });

  test('should return a valid List of model from a Json', () async {
    //arrange
    final List jsonList = json.decode(fixture('cities.json')) as List<dynamic>;
    //act
    final result = Cities.fromJsonList(jsonList).items;
    //assert
    expect(result, [
      tCityModel,
    ]);
  });
}
