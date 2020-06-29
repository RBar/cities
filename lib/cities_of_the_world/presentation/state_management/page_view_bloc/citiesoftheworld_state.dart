part of 'citiesoftheworld_bloc.dart';

//@freezed is for union classes purposes
@freezed
abstract class CitiesoftheworldState with _$CitiesoftheworldState {
  const factory CitiesoftheworldState.emptyState() = EmptyState;
  const factory CitiesoftheworldState.loadingState() = LoadingState;
  const factory CitiesoftheworldState.loadedState(
      {@required List<City> cities,
      @required bool rachedLastPage}) = LoadedState;
  const factory CitiesoftheworldState.errorState({@required String message}) =
      ErrorState;
}
