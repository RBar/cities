import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/country_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/pagination_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_cities_with_countries_at_page.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/state_management/page_view_bloc/citiesoftheworld_bloc.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetCitiesWithCountriesAtPage extends Mock
    implements GetCitiesAndCountriesAtPage {}

void main() {
  CitiesoftheworldBloc bloc;
  MockGetCitiesWithCountriesAtPage mockGetCitiesWithCountriesAtPage;

  setUp(() {
    mockGetCitiesWithCountriesAtPage = MockGetCitiesWithCountriesAtPage();

    bloc = CitiesoftheworldBloc(
      citiesAndCountriesAtPage: mockGetCitiesWithCountriesAtPage,
    );
  });
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
  test('initial state should be empty', () async {
    //assert
    expect(bloc.initialState, equals(const EmptyState()));
  });

  void _emitInErrorOrder(String message) {
    final expected = [
      const EmptyState(),
      ErrorState(message: message),
    ];
    expectLater(bloc, emitsInOrder(expected));
  }

  group('getCitiesWithCountriesAtPageEvent', () {
    test('should get data from the usecase', () async {
      //arrange
      when(mockGetCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => Right(tResponseReachedFalse));
      //act
      bloc.add(const GetCitiesWithCountriesAtPageEvent(page: tpage));
      await untilCalled(mockGetCitiesWithCountriesAtPage(
          const CitiesPageParams(page: tpage)));
      //assert
      verify(mockGetCitiesWithCountriesAtPage(
          const CitiesPageParams(page: tpage)));
    });

    // test('''
    //     should emit [Empty, Loaded]
    //     when data is gotten successfully
    //     and reached last page is false
    //     and the page is different from 1
    //     ''', () async {
    //   //arrange
    //   when(mockGetCitiesWithCountriesAtPage(any))
    //       .thenAnswer((realInvocation) async => Right(tResponseReachedFalse));
    //   //assert later
    //   final expected = [
    //     const EmptyState(),
    //     LoadedState(cities: tResponseReachedFalse.items, rachedLastPage: false),
    //   ];
    //   expectLater(bloc, emitsInOrder(expected));
    //   //act
    //   bloc.add(const GetCitiesWithCountriesAtPageEvent(page: 2));
    // });

    test('''
      should emit [Empty, Loading, Loaded] 
      when data is gotten successfully
      and reached last page is false 
      and the page is 1
      ''', () async {
      //arrange
      when(mockGetCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => Right(tResponseReachedFalse));
      //assert later
      final expected = [
        const EmptyState(),
        const LoadingState(),
        LoadedState(cities: tResponseReachedFalse.items, rachedLastPage: false),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetCitiesWithCountriesAtPageEvent(page: tpage));
    });

    test('''
      should emit [Empty, Loaded] 
      when data is gotten successfully
      and the page requested is greater 
      than the last page of the response
      ''', () async {
      //arrange
      when(mockGetCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => Right(tResponseReachedTrue));
      //assert later
      final expected = [
        const EmptyState(),
        const LoadedState(cities: [], rachedLastPage: true),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetCitiesWithCountriesAtPageEvent(page: tOutOfRangePage));
    });
    test('''
        should emit [Empty, Loading, Error](Server Failure) 
        when the data is gotten unsuccessfully
        and the page is  1
      ''', () async {
      //arrange
      when(mockGetCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => const Left(ServerFailure()));
      //assert later
      final expected = [
        const EmptyState(),
        const LoadingState(),
        const ErrorState(message: serverFailureMessage),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(const GetCitiesWithCountriesAtPageEvent(page: tpage));
    });
    test('''
        should emit [Empty, Error](Server Failure) 
        when the data is gotten unsuccessfully
        and the page is different from 1
      ''', () async {
      //arrange
      when(mockGetCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => const Left(ServerFailure()));
      //assert later
      _emitInErrorOrder(serverFailureMessage);
      //act
      bloc.add(const GetCitiesWithCountriesAtPageEvent(page: 2));
    });
    test('''
        should emit [Loading, Error](Cache Failure)
        when the data is gotten unsuccessfully
        and the page is different from 1
      ''', () async {
      //arrange
      when(mockGetCitiesWithCountriesAtPage(any))
          .thenAnswer((realInvocation) async => const Left(CacheFailure()));
      //assert later
      _emitInErrorOrder(cacheFailureMessage);
      //act
      bloc.add(const GetCitiesWithCountriesAtPageEvent(page: 2));
    });
    test('''
        should emit [Loading, Error](Connection Failure) 
        when the data is gotten unsuccessfully
        and the page is different from 1
      ''', () async {
      //arrange
      when(mockGetCitiesWithCountriesAtPage(any)).thenAnswer(
          (realInvocation) async => const Left(ConnectionFailure()));
      //assert later
      _emitInErrorOrder(connectionFailureMessage);
      //act
      bloc.add(const GetCitiesWithCountriesAtPageEvent(page: 2));
    });
  });
}
