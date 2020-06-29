part of 'querycities_bloc.dart';

@freezed
abstract class QuerycitiesState with _$QuerycitiesState {
  const factory QuerycitiesState.emptyState() = EmptyQueryState;
  const factory QuerycitiesState.loadingState() = LoadingQueryState;
  const factory QuerycitiesState.loadedState(
      {@required List<City> cities,
      @required bool reachedLastPage,
      @required int results}) = LoadedQueryState;
  const factory QuerycitiesState.errorState({@required String message}) =
      ErrorQueryState;
}
