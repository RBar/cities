part of 'citiesoftheworld_bloc.dart';

//@freezed for union classes purposes
@freezed
abstract class CitiesoftheworldEvent with _$CitiesoftheworldEvent {
  const factory CitiesoftheworldEvent.getCitiesWithCountriesAtPageEvent(
          {@required int page}) =
      GetCitiesWithCountriesAtPageEvent; //event to get the cities at a certain page
}
