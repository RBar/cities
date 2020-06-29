part of 'querycities_bloc.dart';

@freezed
abstract class QuerycitiesEvent with _$QuerycitiesEvent {
  const factory QuerycitiesEvent.getFilteredCitiesWithCountriesEvent(
      {@required String filter}) = GetFilteredCitiesWithCountriesEvent;
  const factory QuerycitiesEvent.getFilteredCitiesWithCountriesAtPageEvent(
      {@required int page,
      @required String filter}) = GetFilteredCitiesWithCountriesAtPageEvent;
}
