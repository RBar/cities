import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/repositories/c_o_w_repositories.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:cities_of_the_world_demo/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

//This usecase gets the cities with the country information filtered by the query at a certaing page

//@lazysingleton for dependency injection purposes
@lazySingleton
class GetFilteredCitiesAndCountriesAtPage
    extends UseCase<ResponseDataClass, FilteredCitiesPageParams> {
  final CitiesOfTheWorldRepository repository;

  GetFilteredCitiesAndCountriesAtPage(this.repository);

  @override
  Future<Either<Failure, ResponseDataClass>> call(
      FilteredCitiesPageParams params) async {
    return repository.getFilteredCitiesAndCountriesAtPage(
        params.page, params.filter);
  }
}

//Params of the usecase
class FilteredCitiesPageParams extends Equatable {
  final int page;
  final String filter;
  const FilteredCitiesPageParams({
    @required this.page,
    @required this.filter,
  });
  //equatable thing for data classes
  @override
  List<Object> get props => [page, filter];
}
