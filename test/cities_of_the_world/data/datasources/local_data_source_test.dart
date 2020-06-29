import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/local_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/city/city_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/country/country_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/pagination/pagination_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/responsedata/response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

void main() {
  MockHiveInterface mockHiveInterface;
  MockHiveBox mockHiveBox;
  CitiesOfTheWorldLocalDataSourceImpl localDataSource;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockHiveBox = MockHiveBox();
    localDataSource =
        CitiesOfTheWorldLocalDataSourceImpl(hive: mockHiveInterface);
  });
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
  const int tpage = 0;
  group('cacheResponseData', () {
    test('should cache the responseDataClassModel when the method is call',
        () async {
      //arrange
      when(mockHiveInterface.openBox(any))
          .thenAnswer((realInvocation) async => mockHiveBox);
      //act
      await localDataSource.cacheResponseData(tResponseModel, tpage);
      //assert
      verify(mockHiveBox.put('page$tpage', tResponseModel));
      verify(mockHiveInterface.openBox(any));
    });
  });
  group('getLocalCitiesAndCountriesAtPage', () {
    test('should when', () async {
      //arrange
      when(mockHiveInterface.openBox(any))
          .thenAnswer((realInvocation) async => mockHiveBox);
      when(mockHiveBox.get('page${tpage.toString()}'))
          .thenAnswer((realInvocation) async => tResponseModel);
      //act
      final result =
          await localDataSource.getLocalCitiesAndCountriesAtPage(tpage);
      //assert
      verify(mockHiveInterface.openBox(any));
      verify(mockHiveBox.get('page${tpage.toString()}'));
      expect(result, tResponseModel.toDomain());
    });
  });
}
