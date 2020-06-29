import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_filtered_cities_with_countries.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/usecases/get_filtered_cities_with_countries_at_page.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'querycities_event.dart';
part 'querycities_state.dart';
part 'querycities_bloc.freezed.dart';

// Messages constants for error state
const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String connectionFailureMessage = 'Check your internet connection';

//injectable is for depency injection purposes
@injectable
class QuerycitiesBloc extends Bloc<QuerycitiesEvent, QuerycitiesState> {
  final GetFilteredCitiesWithCountries getFilteredCitiesWithCountries; //usecase
  final GetFilteredCitiesAndCountriesAtPage
      getFilteredCitiesAndCountriesAtPage; //usecase
  final List<City> _cities =
      []; //list of cities that will be returned from the ''Atpage'' event
  QuerycitiesBloc(
      {@required
          GetFilteredCitiesWithCountries filteredCitiesWithCountries,
      @required
          GetFilteredCitiesAndCountriesAtPage filteredCitiesAndCountriesAtPage})
      : assert(filteredCitiesWithCountries != null),
        assert(filteredCitiesAndCountriesAtPage != null),
        getFilteredCitiesWithCountries = filteredCitiesWithCountries,
        getFilteredCitiesAndCountriesAtPage = filteredCitiesAndCountriesAtPage;

  @override
  QuerycitiesState get initialState =>
      const QuerycitiesState.emptyState(); //Initial State

  @override
  Stream<QuerycitiesState> mapEventToState(
    QuerycitiesEvent event,
  ) async* {
    yield* event.map(//switch for events
        getFilteredCitiesWithCountriesEvent: (event) async* {
      //* Event
      yield const LoadingQueryState();
      final failureOrResponseData = await getFilteredCitiesWithCountries(
          FilteredParams(filter: event.filter)); //get data from the use case

      yield failureOrResponseData.fold(
        (failure) {
          return ErrorQueryState(
              message: _mapFailureToMessage(
                  failure)); // in case of error return a Error State
        },
        (responseData) {
          //if the ddata is gotten sucessfully return loaded stated
          return LoadedQueryState(
              cities: responseData.items,
              reachedLastPage: false,
              results: responseData.pagination.total);
        },
      );
    }, getFilteredCitiesWithCountriesAtPageEvent: (event) async* {
      //* Event

      if (event.page == 1) {
        //only for first page beacuse for the others pages is a widget in the UI
        yield const LoadingQueryState();
        _cities.clear();
      }
      final failureOrResponseData = await getFilteredCitiesAndCountriesAtPage(
          FilteredCitiesPageParams(
              filter: event.filter,
              page: event.page)); // get the data from the use case
      yield failureOrResponseData.fold(
        (failure) {
          return ErrorQueryState(
              message: _mapFailureToMessage(
                  failure)); // in case of error return a Error State
        },
        (responseData) {
          if (event.page > responseData.pagination.lastPage) {
            // check the page requested and the last page of the response
            // if the requested page is greater than the last page of the response
            // then return a LoadState saying that has reached last page and
            // return the same list of cities that previews state
            return LoadedQueryState(
                cities: _cities,
                reachedLastPage: true,
                results: responseData.pagination.total);
          } else {
            //if the request page is not greater than the last of the response
            //then add the cities of the response to the list of cities
            // and return it
            // also say that reached last page is false
            _cities.addAll(responseData.items);
            return LoadedQueryState(
                cities: _cities,
                reachedLastPage: false,
                results: responseData.pagination.total);
          }
        },
      );
    });
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
