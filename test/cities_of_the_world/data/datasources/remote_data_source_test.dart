import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/local_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/remote_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/city/city_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/country/country_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/pagination/pagination_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/responsedata/response_model.dart';
import 'package:cities_of_the_world_demo/core/error/exceptions.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import '../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockLocalDatasSource extends Mock
    implements CitiesOfTheWorldLocalDataSource {}

void main() {
  CitiesOfTheWorldRemoteDataSourceImpl remoteDataSource;
  MockHttpClient mockHttpClient;
  MockLocalDatasSource mockLocalDatasSource;
  setUp(() {
    mockHttpClient = MockHttpClient();
    mockLocalDatasSource = MockLocalDatasSource();
    remoteDataSource = CitiesOfTheWorldRemoteDataSourceImpl(
        client: mockHttpClient, localDataSource: mockLocalDatasSource);
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
  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('response.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  const int tpage = 1;
  const String tfilter = 'test';
  group('getCitiesAndCountriesAtPage', () {
    test('''
      should perform a GET request on a URL with number
       being the endpoint and with application/json header''', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      await remoteDataSource.getCitiesAndCountriesAtPage(tpage);
      //assert
      verify(mockHttpClient.get(
        'http://connect-demo.mobile1.io/square1/connect/v1/city?page=${tpage.toString()}&include=country',
        headers: {
          'Content-Type': 'application/json',
        },
      ));
    });

    test(
        'should return responseDataClass when the response code is 200 (success)',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await remoteDataSource.getCitiesAndCountriesAtPage(tpage);
      //assert
      expect(result, equals(tResponseModel.toDomain()));
    });
    test('should verify if the localdatasource is being called', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      await remoteDataSource.getCitiesAndCountriesAtPage(tpage);
      //assert
      verify(mockLocalDatasSource.cacheResponseData(tResponseModel, tpage));
    });
    test('should when', () async {
      //arrange
      setUpMockHttpClientFailure404();
      //act
      final call = remoteDataSource.getCitiesAndCountriesAtPage;
      //assert
      expect(() => call(tpage), throwsA(const TypeMatcher<ServerException>()));
    });
  });
  group('getFilteredCitiesWithCountries', () {
    test('''
      should perform a GET request on a URL with number
       being the endpoint and with application/json header''', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      await remoteDataSource.getFilteredCitiesWithCountries(tfilter);
      //assert
      verify(mockHttpClient.get(
        'http://connect-demo.mobile1.io/square1/connect/v1/city?filter[0][name][contains]=$tfilter&include=country',
        headers: {
          'Content-Type': 'application/json',
        },
      ));
    });

    test(
        'should return responseDataClass when the response code is 200 (success)',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result =
          await remoteDataSource.getFilteredCitiesWithCountries(tfilter);
      //assert
      expect(result, equals(tResponseModel.toDomain()));
    });

    test('should when', () async {
      //arrange
      setUpMockHttpClientFailure404();
      //act
      final call = remoteDataSource.getFilteredCitiesWithCountries;
      //assert
      expect(
          () => call(tfilter), throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group('getFilteredCitiesAndCountriesAtPage', () {
    test('''
      should perform a GET request on a URL with number
       being the endpoint and with application/json header''', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      await remoteDataSource.getFilteredCitiesAndCountriesAtPage(
          tpage, tfilter);
      //assert
      verify(mockHttpClient.get(
        'http://connect-demo.mobile1.io/square1/connect/v1/city?filter[0][name][contains]=$tfilter&page=$tpage&include=country',
        headers: {
          'Content-Type': 'application/json',
        },
      ));
    });

    test(
        'should return responseDataClass when the response code is 200 (success)',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await remoteDataSource.getFilteredCitiesAndCountriesAtPage(
          tpage, tfilter);
      //assert
      expect(result, equals(tResponseModel.toDomain()));
    });

    test('should when', () async {
      //arrange
      setUpMockHttpClientFailure404();
      //act
      final call = remoteDataSource.getFilteredCitiesAndCountriesAtPage;
      //assert
      expect(() => call(tpage, tfilter),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
