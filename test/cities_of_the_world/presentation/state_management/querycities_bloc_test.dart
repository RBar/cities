import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/country_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/pagination_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_filtered_cities_with_countries.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_filtered_cities_with_countries_at_page.dart';

import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/state_management/query_bloc/querycities_bloc.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetFilteredCitiesWithCountries extends Mock
    implements GetFilteredCitiesWithCountries {}

class MockGetFilteredCitiesWithCountriesAtPage extends Mock
    implements GetFilteredCitiesAndCountriesAtPage {}

void main() {
  QuerycitiesBloc bloc;
  MockGetFilteredCitiesWithCountries mockGetFilteredCitiesWithCountries;
  MockGetFilteredCitiesWithCountriesAtPage
      mockGetFilteredCitiesWithCountriesAtPage;

  setUp(() {
    mockGetFilteredCitiesWithCountriesAtPage =
        MockGetFilteredCitiesWithCountriesAtPage();
    mockGetFilteredCitiesWithCountries = MockGetFilteredCitiesWithCountries();
    bloc = QuerycitiesBloc(
        filteredCitiesWithCountries: mockGetFilteredCitiesWithCountries,
        filteredCitiesAndCountriesAtPage:
            mockGetFilteredCitiesWithCountriesAtPage);
  });
  const tfilter = 'test';
  const String serverFailureMessage = 'Server Failure';
  const String cacheFailureMessage = 'Cache Failure';
  const String connectionFailureMessage = 'Check your internet connection';
  const int tpage = 1;
  final tResponseReachedTrue = ResponseDataClass(
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
  final tResponseReachedFalse = ResponseDataClass(
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
          const Pagination(currentPage: 1, lastPage: 2, perPage: 1, total: 1));
  const int tOutOfRangePage = 3;

  void _emitInErrorOrderWithLoading(String message) {
    final expected = [
      const EmptyQueryState(),
      const LoadingQueryState(),
      ErrorQueryState(message: message),
    ];
    expectLater(bloc, emitsInOrder(expected));
  }

  group('getfilteredCitieswithCountries', () {
    test('initial state should be empty', () async {
      //assert
      expect(bloc.initialState, equals(const EmptyQueryState()));
    });
    test('should get data from the usecase', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountries(any))
          .thenAnswer((realInvocation) async => Right(tResponseReachedFalse));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesEvent(filter: tfilter));
      await untilCalled(mockGetFilteredCitiesWithCountries(
          const FilteredParams(filter: tfilter)));
      //assert
      verify(mockGetFilteredCitiesWithCountries(
          const FilteredParams(filter: tfilter)));
    });

    test('''
      should emit [Empty, Loading, Loaded]
      when data is gotten successfully
      ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountries(any))
          .thenAnswer((realInvocation) async => Right(tResponseReachedFalse));
      final expected = [
        const EmptyQueryState(),
        const LoadingQueryState(),
        LoadedQueryState(
            cities: tResponseReachedFalse.items,
            reachedLastPage: false,
            results: tResponseReachedFalse.pagination.total),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesEvent(filter: tfilter));
    });
    test('''
      should emit [Empty, Error](Server Failure)
      when the data is gotten unsuccessfully
      ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountries(any))
          .thenAnswer((realInvocation) async => const Left(ServerFailure()));
      //assert later
      _emitInErrorOrderWithLoading(serverFailureMessage);
      //act
      bloc.add(const GetFilteredCitiesWithCountriesEvent(filter: tfilter));
    });
    test('''
      should emit [Empty, Error](Cache Failure)
      when the data is gotten unsuccessfully
      ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountries(any))
          .thenAnswer((realInvocation) async => const Left(CacheFailure()));
      //assert later
      _emitInErrorOrderWithLoading(cacheFailureMessage);
      //act
      bloc.add(const GetFilteredCitiesWithCountriesEvent(filter: tfilter));
    });
    test('''
        should emit [Empty, Error](Connection Failure)
        when the data is gotten unsuccessfully
        ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountries(any)).thenAnswer(
          (realInvocation) async => const Left(ConnectionFailure()));
      //assert later
      _emitInErrorOrderWithLoading(connectionFailureMessage);
      //act
      bloc.add(const GetFilteredCitiesWithCountriesEvent(filter: tfilter));
    });
  });

  group('getFilteredCitiesWithCountriesAtPageEvent', () {
    test('initial state should be empty', () async {
      //assert
      expect(bloc.initialState, equals(const EmptyQueryState()));
    });
    test('should get data from the usecase', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => Right(tResponseReachedFalse));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesAtPageEvent(
          filter: tfilter, page: tpage));
      await untilCalled(mockGetFilteredCitiesWithCountriesAtPage(
          const FilteredCitiesPageParams(page: tpage, filter: tfilter)));
      //assert
      verify(mockGetFilteredCitiesWithCountriesAtPage(
          const FilteredCitiesPageParams(page: tpage, filter: tfilter)));
    });
    test('''
      should emit [Empty, Loaded] 
      when data is gotten successfully
      and reached last page is false 
      and the page is different from 1
      ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => Right(tResponseReachedFalse));
      //assert later
      final expected = [
        const EmptyQueryState(),
        LoadedQueryState(
            cities: tResponseReachedFalse.items,
            reachedLastPage: false,
            results: tResponseReachedFalse.pagination.total),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesAtPageEvent(
          page: 2, filter: tfilter));
    });
    test('''
      should emit [Empty, Loaded] 
      when data is gotten successfully
      and reached last page is false 
      and the page 1
      ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => Right(tResponseReachedFalse));
      //assert later
      final expected = [
        const EmptyQueryState(),
        const LoadingQueryState(),
        LoadedQueryState(
            cities: tResponseReachedFalse.items,
            reachedLastPage: false,
            results: tResponseReachedFalse.pagination.total),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesAtPageEvent(
          page: tpage, filter: tfilter));
    });

    test('''
      should emit [Empty, Loaded] 
      when data is gotten successfully
      and the page requested is greater 
      than the last page of the response
      ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => Right(tResponseReachedTrue));
      //assert later
      final expected = [
        const EmptyQueryState(),
        LoadedQueryState(
            cities: [],
            reachedLastPage: true,
            results: tResponseReachedFalse.pagination.total),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesAtPageEvent(
          page: tOutOfRangePage, filter: tfilter));
    });

    test('''
      should emit [Empty, Loading, Error](Server Failure) 
      when the data is gotten unsuccessfully
      and the page is  1
      ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => const Left(ServerFailure()));
      //assert later
      final expected = [
        const EmptyQueryState(),
        const LoadingQueryState(),
        const ErrorQueryState(message: serverFailureMessage),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesAtPageEvent(
          page: tpage, filter: tfilter));
    });

    test('''
      should emit [Empty, Error](Server Failure)
      when the data is gotten unsuccessfully
      and the page is different from  1
      ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => const Left(ServerFailure()));
      //assert later
      final expected = [
        const EmptyQueryState(),
        const ErrorQueryState(message: serverFailureMessage),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesAtPageEvent(
          page: 2, filter: tfilter));
    });
    test('''
      should emit [Empty, Error](Cache Failure)
      when the data is gotten unsuccessfully
      and the page is different from  1
      ''', () async {
      //arrange
      when(mockGetFilteredCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => const Left(CacheFailure()));
      //assert later
      final expected = [
        const EmptyQueryState(),
        const ErrorQueryState(message: cacheFailureMessage),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesAtPageEvent(
          page: 2, filter: tfilter));
    });
    test(
        '''
      '''
        'should emit [Empty, Error](Connection Failure) when the data is gotten unsuccessfully and the page is different from  1',
        () async {
      //arrange
      when(mockGetFilteredCitiesWithCountriesAtPage(any)).thenAnswer(
          (realInvocation) async => const Left(ConnectionFailure()));
      //assert later
      final expected = [
        const EmptyQueryState(),
        const ErrorQueryState(message: connectionFailureMessage),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetFilteredCitiesWithCountriesAtPageEvent(
          page: 2, filter: tfilter));
    });
  });
}
