import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/country_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/pagination_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/repositories/c_o_w_repositories.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_filtered_cities_with_countries_at_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCitiesOfTheWorldRepository extends Mock
    implements CitiesOfTheWorldRepository {}

void main() {
  MockCitiesOfTheWorldRepository mockCitiesOfTheWorldRepository;
  GetFilteredCitiesAndCountriesAtPage usecase;
  setUp(() {
    mockCitiesOfTheWorldRepository = MockCitiesOfTheWorldRepository();
    usecase =
        GetFilteredCitiesAndCountriesAtPage(mockCitiesOfTheWorldRepository);
  });
  const String tfilter = 'test';
  const int tpage = 1;
  final ResponseDataClass tresponse = ResponseDataClass(
      items: [
        City(
            id: 1,
            name: 'test',
            localName: 'test',
            lat: 1,
            lng: 1,
            createdAt: DateTime(2017, 9, 7, 17, 30),
            updatedAt: DateTime(2017, 9, 7, 17, 30),
            countryId: 1,
            country: Country(
                id: 1,
                name: 'test',
                code: 'test',
                createdAt: DateTime(2017, 9, 7, 17, 30),
                updatedAt: DateTime(2017, 9, 7, 17, 30),
                continentId: 1)),
      ],
      pagination:
          const Pagination(currentPage: 1, lastPage: 1, perPage: 1, total: 1));

  test('should return a response from the repository', () async {
    //arrange
    when(mockCitiesOfTheWorldRepository.getFilteredCitiesAndCountriesAtPage(
            any, any))
        .thenAnswer((_) async => Right(tresponse));
    //act
    final result = await usecase(
        const FilteredCitiesPageParams(page: tpage, filter: tfilter));
    //assert
    expect(result, Right(tresponse));
    verify(mockCitiesOfTheWorldRepository.getFilteredCitiesAndCountriesAtPage(
        tpage, tfilter));
    verifyNoMoreInteractions(mockCitiesOfTheWorldRepository);
  });
}
