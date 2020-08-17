//@lazysingleton for dependency injection purposes
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/gg_photo.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/repositories/c_o_w_repositories.dart';
import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetGGPhoto {
  final CitiesOfTheWorldRepository repository;

  GetGGPhoto(this.repository);

  //call method
  Future<Either<Failure, GGPhoto>> call(GGPhotoParams params) async {
    return repository.getggPhoto(params.place);
  }
}

//Params of the usecase
class GGPhotoParams extends Equatable {
  final String place;
  const GGPhotoParams({
    @required this.place,
  });
  //equatable thing for data classes
  @override
  List<Object> get props => [place];
}
