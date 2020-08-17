import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

// Failures of the app

//@freezed is to create unions classses
@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverFailure() = ServerFailure;
  const factory Failure.cacheFailure() = CacheFailure;
  const factory Failure.connectionFailure() = ConnectionFailure;
  const factory Failure.unexpectedFailure() = UnexpectedFailure;
}
