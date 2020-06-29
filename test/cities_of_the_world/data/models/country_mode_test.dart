import 'dart:convert';

import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/country/country_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/country_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tCountryModel = CountryModel(
      id: 1,
      name: 'test',
      code: 'test',
      createdAt: DateTime.parse("2018-01-07 17:08:01"),
      updatedAt: DateTime.parse("2018-01-07 17:08:01"),
      continentId: 1);

  test('should be return a City after use toDomain()', () async {
    //assert
    expect(tCountryModel.toDomain(), isA<Country>());
  });

  test('should return a valid model from a Json', () async {
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('country.json')) as Map<String, dynamic>;
    //act
    final result = CountryModel.fromJson(jsonMap);
    //assert
    expect(result, tCountryModel);
  });
}
