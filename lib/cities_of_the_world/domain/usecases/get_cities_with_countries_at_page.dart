import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/repositories/c_o_w_repositories.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:cities_of_the_world_demo/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

// This usecase gets the cities with the country information at a certaing pag

//@lazysingleton for dependency injection purposes
@lazySingleton
class GetCitiesAndCountriesAtPage
    extends UseCase<ResponseDataClass, CitiesPageParams> {
  final CitiesOfTheWorldRepository repository;

  GetCitiesAndCountriesAtPage(this.repository);

  //call method
  @override
  Future<Either<Failure, ResponseDataClass>> call(
      CitiesPageParams params) async {
    return repository.getCitiesAndCountriesAtPage(params.page);
  }
}

//Params of the usecase
class CitiesPageParams extends Equatable {
  final int page;
  const CitiesPageParams({
    @required this.page,
  });
  //equatable thing for data classes
  @override
  List<Object> get props => [page];
}
