import 'package:cities_of_the_world_demo/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'usecase.freezed.dart';

//abstract class for usecases

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

//in case that the usecase dont recive params
@freezed
abstract class NoParams with _$NoParams {
  const factory NoParams() = _NoParams;
}
