import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/local_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/datasources/remote_data_source.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/repositories/cities_of_the_world_repository_imp.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/country_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/pagination_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/core/error/exceptions.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:cities_of_the_world_demo/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements CitiesOfTheWorldRemoteDataSource {}

class MockLocalDataSource extends Mock
    implements CitiesOfTheWorldLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

void main() {
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;
  CitiesOfTheWorldRepositoryImpl repository;
  MockHiveInterface mockHiveInterface;
  MockHiveBox mockHiveBox;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockHiveInterface = MockHiveInterface();
    mockHiveBox = MockHiveBox();
    repository = CitiesOfTheWorldRepositoryImpl(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
      hive: mockHiveInterface,
    );
  });
  final tResponse = ResponseDataClass(
      items: [
        City(
            id: 1,
            name: 'test',
            localName: 'test',
            lat: 1,
            lng: 1,
            createdAt: DateTime.parse("2018-01-07 17:08:01"),
            updatedAt: DateTime.parse("2018-01-07 17:08:01"),
            countryId: 1,
            country: Country(
                id: 1,
                name: 'test',
                code: 'test',
                createdAt: DateTime.parse("2018-01-07 17:08:01"),
                updatedAt: DateTime.parse("2018-01-07 17:08:01"),
                continentId: 1)),
      ],
      pagination:
          const Pagination(currentPage: 1, lastPage: 1, perPage: 1, total: 1));
  const int tpage = 1;
  const String tfilter = 'test';
  void _mockPathandBox() {
    when(mockHiveInterface.openBox(any))
        .thenAnswer((realInvocation) async => mockHiveBox);
  }

  void _mockPathBoxContains(bool contains, String boxKeyName) {
    when(mockHiveInterface.openBox(any))
        .thenAnswer((realInvocation) async => mockHiveBox);
    when(mockHiveBox.containsKey(boxKeyName)).thenReturn(contains);
  }

  void _verifygetFilteredCitieswithCountry() {
    verify(mockRemoteDataSource.getFilteredCitiesWithCountries(tfilter));
    verifyZeroInteractions(mockLocalDataSource);
  }

  void _getFilteredCitieswithCountryAtPage() {
    verify(mockRemoteDataSource.getFilteredCitiesAndCountriesAtPage(
        tpage, tfilter));
    verifyZeroInteractions(mockLocalDataSource);
  }

  group('getCitieswithCountryatPage', () {
    test('''
      should verify if the box is being opened
      when the method is called
      ''', () async {
      //arrange
      _mockPathandBox();
      //act
      await repository.getCitiesAndCountriesAtPage(tpage);
      //assert
      verify(mockHiveInterface.openBox(any));
    });

    test('''
      should return an unexpected failure
      when the initialation of the box throw an exception or error
      ''', () async {
      //arrange
      when(mockHiveInterface.openBox(any)).thenThrow(UnexpectedException());
      //act
      final result = await repository.getCitiesAndCountriesAtPage(tpage);
      //assert
      verifyZeroInteractions(mockRemoteDataSource);
      verifyZeroInteractions(mockLocalDataSource);
      expect(result, equals(const Left(UnexpectedFailure())));
    });

    group('local data source', () {
      test(
          'should check if the local storage is being called when the box is not empty',
          () async {
        //arrange
        _mockPathBoxContains(true, 'page${tpage.toString()}');
        //act
        await repository.getCitiesAndCountriesAtPage(tpage);
        //assert
        verify(mockLocalDataSource.getLocalCitiesAndCountriesAtPage(tpage));
        verifyZeroInteractions(mockRemoteDataSource);
      });
      test('''
        should return a valid responsedataclass 
        when the method call is successfully
        ''', () async {
        //arrange
        _mockPathBoxContains(true, 'page${tpage.toString()}');
        when(mockLocalDataSource.getLocalCitiesAndCountriesAtPage(tpage))
            .thenAnswer((_) async => tResponse);
        //act
        final result = await repository.getCitiesAndCountriesAtPage(tpage);
        //assert
        verify(mockLocalDataSource.getLocalCitiesAndCountriesAtPage(tpage));
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Right(tResponse)));
      });
      test('''
        should return a cache failure 
        when the local storage throw a Cache Exception
        ''', () async {
        //arrange
        _mockPathBoxContains(true, 'page${tpage.toString()}');
        when(mockLocalDataSource.getLocalCitiesAndCountriesAtPage(tpage))
            .thenThrow(CacheException());
        //act
        final result = await repository.getCitiesAndCountriesAtPage(tpage);
        //assert
        verify(mockLocalDataSource.getLocalCitiesAndCountriesAtPage(tpage));
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(const Left(CacheFailure())));
      });
    });
    group('remote data source', () {
      test('should check if the device is online', () async {
        //arrange
        _mockPathBoxContains(false, 'page${tpage.toString()}');
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        await repository.getCitiesAndCountriesAtPage(tpage);
        //assert
        verify(mockNetworkInfo.isConnected);
      });
      group('device is online', () {
        test('''
          should  verify if the remote data sorce is being called 
          when the box doesnt contains the page0
          ''', () async {
          //arrange
          _mockPathBoxContains(false, 'page${tpage.toString()}');
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          //act
          await repository.getCitiesAndCountriesAtPage(tpage);
          //assert
          verify(mockRemoteDataSource.getCitiesAndCountriesAtPage(tpage));
          verifyZeroInteractions(mockLocalDataSource);
        });
        test('''
          should return a valid responsedataclass 
          when the method call is successfully
          ''', () async {
          //arrange
          _mockPathBoxContains(false, 'page${tpage.toString()}');
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(mockRemoteDataSource.getCitiesAndCountriesAtPage(tpage))
              .thenAnswer((_) async => tResponse);
          //act
          final result = await repository.getCitiesAndCountriesAtPage(tpage);
          //assert
          verify(mockRemoteDataSource.getCitiesAndCountriesAtPage(tpage));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Right(tResponse)));
        });
        test('''
           should return a ServerFailure  
           when the method call is unsuccessfull
          ''', () async {
          //arrange
          _mockPathBoxContains(false, 'page${tpage.toString()}');
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(mockRemoteDataSource.getCitiesAndCountriesAtPage(tpage))
              .thenThrow(ServerException());
          //act
          final result = await repository.getCitiesAndCountriesAtPage(tpage);
          //assert
          verify(mockRemoteDataSource.getCitiesAndCountriesAtPage(tpage));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(const Left(ServerFailure())));
        });
      });
      test('''
          should verify if the data sources are being called 
          when there is no connection to internet and return a ConnectionFailure
          ''', () async {
        //arrange
        _mockPathBoxContains(false, 'page${tpage.toString()}');
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final result = await repository.getCitiesAndCountriesAtPage(tpage);
        //assert
        verifyZeroInteractions(mockLocalDataSource);
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(const Left(ConnectionFailure())));
      });
    });
  });

  group('getFilteredCitieswithCountry', () {
    group('remote data source', () {
      test('should check if the device is online', () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        await repository.getFilteredCitiesWithCountries(tfilter);
        //assert
        verify(mockNetworkInfo.isConnected);
      });
      group('device is online', () {
        setUp(() async {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });
        test('''
            should  verify if the remote data sorce is being called 
            when method is called
          ''', () async {
          //act
          await repository.getFilteredCitiesWithCountries(tfilter);
          //assert
          _verifygetFilteredCitieswithCountry();
        });
        test('''
              should return a valid responsedataclass 
              when the method call is successfully
          ''', () async {
          when(mockRemoteDataSource.getFilteredCitiesWithCountries(tfilter))
              .thenAnswer((_) async => tResponse);
          //act
          final result =
              await repository.getFilteredCitiesWithCountries(tfilter);
          //assert
          _verifygetFilteredCitieswithCountry();
          expect(result, equals(Right(tResponse)));
        });
        test('''
            should return a ServerFailure  
            when the method call is unsuccessfull
          ''', () async {
          when(mockRemoteDataSource.getFilteredCitiesWithCountries(tfilter))
              .thenThrow(ServerException());
          //act
          final result =
              await repository.getFilteredCitiesWithCountries(tfilter);
          //assert
          _verifygetFilteredCitieswithCountry();
          expect(result, equals(const Left(ServerFailure())));
        });
      });
      test('''
          should verify if the data sources are being called 
          when there is no connection to internet
          and return a ConnectionFailure
          ''', () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final result = await repository.getFilteredCitiesWithCountries(tfilter);
        //assert
        verifyZeroInteractions(mockLocalDataSource);
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(const Left(ConnectionFailure())));
      });
    });
  });
  group('getFilteredCitieswithCountryAtPage', () {
    group('remote data source', () {
      test('should check if the device is online', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        await repository.getFilteredCitiesAndCountriesAtPage(tpage, tfilter);
        //assert
        verify(mockNetworkInfo.isConnected);
      });
      group('device is online', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });
        test('''
            should  verify if the remote data sorce is being called 
            when method is called
          ''', () async {
          //act
          await repository.getFilteredCitiesAndCountriesAtPage(tpage, tfilter);
          //assert
          _getFilteredCitieswithCountryAtPage();
        });
        test('''
            should return a valid responsedataclass 
            when the method called is successfully
          ''', () async {
          when(mockRemoteDataSource.getFilteredCitiesAndCountriesAtPage(
                  tpage, tfilter))
              .thenAnswer((_) async => tResponse);
          //act
          final result = await repository.getFilteredCitiesAndCountriesAtPage(
              tpage, tfilter);
          //assert
          _getFilteredCitieswithCountryAtPage();
          expect(result, equals(Right(tResponse)));
        });
        test(
            '''
            should return a ServerFailure
            when the method call is unsuccessfull
          '''
            '', () async {
          when(mockRemoteDataSource.getFilteredCitiesAndCountriesAtPage(
                  tpage, tfilter))
              .thenThrow(ServerException());
          //act
          final result = await repository.getFilteredCitiesAndCountriesAtPage(
              tpage, tfilter);
          //assert
          _getFilteredCitieswithCountryAtPage();
          expect(result, equals(const Left(ServerFailure())));
        });
      });
      test('''
          should verify if the data sources are being called 
          when there is no connection to internet and return a ConnectionFailure
          ''', () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final result = await repository.getFilteredCitiesAndCountriesAtPage(
            tpage, tfilter);
        //assert
        verifyZeroInteractions(mockLocalDataSource);
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(const Left(ConnectionFailure())));
      });
    });
  });
}
