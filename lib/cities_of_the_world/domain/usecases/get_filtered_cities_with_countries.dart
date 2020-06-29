import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/repositories/c_o_w_repositories.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:cities_of_the_world_demo/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

//This usecase gets the cities with the country information filtered by the query, only gets the first page

//@lazysingleton for dependency injection purposes
@lazySingleton
class GetFilteredCitiesWithCountries
    extends UseCase<ResponseDataClass, FilteredParams> {
  final CitiesOfTheWorldRepository repository;

  GetFilteredCitiesWithCountries(this.repository);

  @override
  Future<Either<Failure, ResponseDataClass>> call(FilteredParams params) async {
    return repository.getFilteredCitiesWithCountries(params.filter);
  }
}

//Params of the usecase
class FilteredParams extends Equatable {
  final String filter;
  const FilteredParams({@required this.filter});
  //equatable thing for data classes
  @override
  List<Object> get props => [filter];
}
