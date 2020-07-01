import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';

import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_cities_with_countries_at_page.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'citiesoftheworld_event.dart';
part 'citiesoftheworld_state.dart';
part 'citiesoftheworld_bloc.freezed.dart';

// Messages constants for error state
const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String connectionFailureMessage = 'Check your internet connection';

//injectable is for depency injection purposes
@injectable
class CitiesoftheworldBloc
    extends Bloc<CitiesoftheworldEvent, CitiesoftheworldState> {
  final GetCitiesAndCountriesAtPage getCitiesAndCountriesAtPage; // usecase

  final List<City> _cities =
      []; //list of cities that will be returned from the ''Atpage'' event
  CitiesoftheworldBloc({
    @required @required GetCitiesAndCountriesAtPage citiesAndCountriesAtPage,
  })  : assert(citiesAndCountriesAtPage != null),
        getCitiesAndCountriesAtPage = citiesAndCountriesAtPage;

  @override
  CitiesoftheworldState get initialState =>
      const CitiesoftheworldState.emptyState(); //Initial State
  @override
  Stream<CitiesoftheworldState> mapEventToState(
    CitiesoftheworldEvent event,
  ) async* {
    if (event.page == 1) {
      //only for first page beacuse for the others pages is a widget in the UI
      yield const LoadingState();
    }
    final failureOrResponseData = await getCitiesAndCountriesAtPage(
        CitiesPageParams(page: event.page)); // get the data from the use case
    yield failureOrResponseData.fold(
      (failure) {
        return ErrorState(
            message: _mapFailureToMessage(
                failure)); // in case of error return a Error State
      },
      (responseData) {
        if (event.page > responseData.pagination.lastPage) {
          // check the page requested and the last page of the response
          // if the requested page is greater than the last page of the response
          // then return a LoadState saying that has reached last page and
          // return the same list of cities that previews state
          return LoadedState(cities: _cities, rachedLastPage: true);
        } else if (event.page == responseData.pagination.lastPage) {
          //if the requested page is equal to the last page of the response
          //then add the cities of the response to the list of cities
          //an return it, and say that reached last page is true
          _cities.addAll(responseData.items);
          return LoadedState(cities: _cities, rachedLastPage: true);
        } else {
          //if the requested page is not greater than the last of the response
          //then add the cities of the response to the list of cities
          // and return it
          // also say that reached last page is false
          _cities.addAll(responseData.items);
          return LoadedState(cities: _cities, rachedLastPage: false);
        }
      },
    );
  }

  // To check what message will be returned in case of error
  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return serverFailureMessage;
    } else if (failure is CacheFailure) {
      return cacheFailureMessage;
    } else if (failure is ConnectionFailure) {
      return connectionFailureMessage;
    } else {
      return 'Unexpected failure';
    }
  }
}
