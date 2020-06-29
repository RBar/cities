import 'dart:convert';

import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/city/city_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/country/country_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/pagination/pagination_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/responsedata/response_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tResponseModel = ResponseDataClassModel(
      items: [
        CityModel(
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
                continentId: 1)),
      ],
      pagination: const PaginationModel(
          currentPage: 1, lastPage: 1, perPage: 1, total: 1));

  test('should be return a City after use toDomain()', () async {
    //assert
    expect(tResponseModel.toDomain(), isA<ResponseDataClass>());
  });

  test('should return a valid model from a Json', () async {
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('response.json'))['data'] as Map<String, dynamic>;
    //act
    final result = ResponseDataClassModel.fromJson(jsonMap);
    //assert
    expect(result, tResponseModel);
  });
}
