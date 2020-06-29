import 'dart:convert';

import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/pagination/pagination_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/pagination_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tPaginationModel =
      PaginationModel(currentPage: 1, lastPage: 1, perPage: 1, total: 1);

  test('should be return a City after use toDomain()', () async {
    //assert
    expect(tPaginationModel.toDomain(), isA<Pagination>());
  });

  test('should return a valid model from a Json', () async {
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('pagination.json')) as Map<String, dynamic>;
    //act
    final result = PaginationModel.fromJson(jsonMap);
    //assert
    expect(result, tPaginationModel);
  });
}
