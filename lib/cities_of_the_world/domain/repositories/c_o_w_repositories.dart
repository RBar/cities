import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CitiesOfTheWorldRepository {
  // gets the cities with the country information filtered by the query, only gets the first page
  Future<Either<Failure, ResponseDataClass>> getFilteredCitiesWithCountries(
      String filter);
  // gets the cities with the country information at a certaing page
  Future<Either<Failure, ResponseDataClass>> getCitiesAndCountriesAtPage(
      int page);
  // gets the cities with the country information filtered by the query at a certaing page
  Future<Either<Failure, ResponseDataClass>>
      getFilteredCitiesAndCountriesAtPage(int page, String filter);
}
