// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'citiesoftheworld_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CitiesoftheworldEventTearOff {
  const _$CitiesoftheworldEventTearOff();

  GetCitiesWithCountriesAtPageEvent getCitiesWithCountriesAtPageEvent(
      {@required int page}) {
    return GetCitiesWithCountriesAtPageEvent(
      page: page,
    );
  }
}

// ignore: unused_element
const $CitiesoftheworldEvent = _$CitiesoftheworldEventTearOff();

mixin _$CitiesoftheworldEvent {
  int get page;

  $CitiesoftheworldEventCopyWith<CitiesoftheworldEvent> get copyWith;
}

abstract class $CitiesoftheworldEventCopyWith<$Res> {
  factory $CitiesoftheworldEventCopyWith(CitiesoftheworldEvent value,
          $Res Function(CitiesoftheworldEvent) then) =
      _$CitiesoftheworldEventCopyWithImpl<$Res>;
  $Res call({int page});
}

class _$CitiesoftheworldEventCopyWithImpl<$Res>
    implements $CitiesoftheworldEventCopyWith<$Res> {
  _$CitiesoftheworldEventCopyWithImpl(this._value, this._then);

  final CitiesoftheworldEvent _value;
  // ignore: unused_field
  final $Res Function(CitiesoftheworldEvent) _then;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
    ));
  }
}

abstract class $GetCitiesWithCountriesAtPageEventCopyWith<$Res>
    implements $CitiesoftheworldEventCopyWith<$Res> {
  factory $GetCitiesWithCountriesAtPageEventCopyWith(
          GetCitiesWithCountriesAtPageEvent value,
          $Res Function(GetCitiesWithCountriesAtPageEvent) then) =
      _$GetCitiesWithCountriesAtPageEventCopyWithImpl<$Res>;
  @override
  $Res call({int page});
}

class _$GetCitiesWithCountriesAtPageEventCopyWithImpl<$Res>
    extends _$CitiesoftheworldEventCopyWithImpl<$Res>
    implements $GetCitiesWithCountriesAtPageEventCopyWith<$Res> {
  _$GetCitiesWithCountriesAtPageEventCopyWithImpl(
      GetCitiesWithCountriesAtPageEvent _value,
      $Res Function(GetCitiesWithCountriesAtPageEvent) _then)
      : super(_value, (v) => _then(v as GetCitiesWithCountriesAtPageEvent));

  @override
  GetCitiesWithCountriesAtPageEvent get _value =>
      super._value as GetCitiesWithCountriesAtPageEvent;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(GetCitiesWithCountriesAtPageEvent(
      page: page == freezed ? _value.page : page as int,
    ));
  }
}

class _$GetCitiesWithCountriesAtPageEvent
    implements GetCitiesWithCountriesAtPageEvent {
  const _$GetCitiesWithCountriesAtPageEvent({@required this.page})
      : assert(page != null);

  @override
  final int page;

  @override
  String toString() {
    return 'CitiesoftheworldEvent.getCitiesWithCountriesAtPageEvent(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetCitiesWithCountriesAtPageEvent &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @override
  $GetCitiesWithCountriesAtPageEventCopyWith<GetCitiesWithCountriesAtPageEvent>
      get copyWith => _$GetCitiesWithCountriesAtPageEventCopyWithImpl<
          GetCitiesWithCountriesAtPageEvent>(this, _$identity);
}

abstract class GetCitiesWithCountriesAtPageEvent
    implements CitiesoftheworldEvent {
  const factory GetCitiesWithCountriesAtPageEvent({@required int page}) =
      _$GetCitiesWithCountriesAtPageEvent;

  @override
  int get page;
  @override
  $GetCitiesWithCountriesAtPageEventCopyWith<GetCitiesWithCountriesAtPageEvent>
      get copyWith;
}

class _$CitiesoftheworldStateTearOff {
  const _$CitiesoftheworldStateTearOff();

  EmptyState emptyState() {
    return const EmptyState();
  }

  LoadingState loadingState() {
    return const LoadingState();
  }

  LoadedState loadedState(
      {@required List<City> cities, @required bool rachedLastPage}) {
    return LoadedState(
      cities: cities,
      rachedLastPage: rachedLastPage,
    );
  }

  ErrorState errorState({@required String message}) {
    return ErrorState(
      message: message,
    );
  }
}

// ignore: unused_element
const $CitiesoftheworldState = _$CitiesoftheworldStateTearOff();

mixin _$CitiesoftheworldState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required Result loadedState(List<City> cities, bool rachedLastPage),
    @required Result errorState(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyState(),
    Result loadingState(),
    Result loadedState(List<City> cities, bool rachedLastPage),
    Result errorState(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyState(EmptyState value),
    @required Result loadingState(LoadingState value),
    @required Result loadedState(LoadedState value),
    @required Result errorState(ErrorState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyState(EmptyState value),
    Result loadingState(LoadingState value),
    Result loadedState(LoadedState value),
    Result errorState(ErrorState value),
    @required Result orElse(),
  });
}

abstract class $CitiesoftheworldStateCopyWith<$Res> {
  factory $CitiesoftheworldStateCopyWith(CitiesoftheworldState value,
          $Res Function(CitiesoftheworldState) then) =
      _$CitiesoftheworldStateCopyWithImpl<$Res>;
}

class _$CitiesoftheworldStateCopyWithImpl<$Res>
    implements $CitiesoftheworldStateCopyWith<$Res> {
  _$CitiesoftheworldStateCopyWithImpl(this._value, this._then);

  final CitiesoftheworldState _value;
  // ignore: unused_field
  final $Res Function(CitiesoftheworldState) _then;
}

abstract class $EmptyStateCopyWith<$Res> {
  factory $EmptyStateCopyWith(
          EmptyState value, $Res Function(EmptyState) then) =
      _$EmptyStateCopyWithImpl<$Res>;
}

class _$EmptyStateCopyWithImpl<$Res>
    extends _$CitiesoftheworldStateCopyWithImpl<$Res>
    implements $EmptyStateCopyWith<$Res> {
  _$EmptyStateCopyWithImpl(EmptyState _value, $Res Function(EmptyState) _then)
      : super(_value, (v) => _then(v as EmptyState));

  @override
  EmptyState get _value => super._value as EmptyState;
}

class _$EmptyState implements EmptyState {
  const _$EmptyState();

  @override
  String toString() {
    return 'CitiesoftheworldState.emptyState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required Result loadedState(List<City> cities, bool rachedLastPage),
    @required Result errorState(String message),
  }) {
    assert(emptyState != null);
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return emptyState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyState(),
    Result loadingState(),
    Result loadedState(List<City> cities, bool rachedLastPage),
    Result errorState(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyState != null) {
      return emptyState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyState(EmptyState value),
    @required Result loadingState(LoadingState value),
    @required Result loadedState(LoadedState value),
    @required Result errorState(ErrorState value),
  }) {
    assert(emptyState != null);
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return emptyState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyState(EmptyState value),
    Result loadingState(LoadingState value),
    Result loadedState(LoadedState value),
    Result errorState(ErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyState != null) {
      return emptyState(this);
    }
    return orElse();
  }
}

abstract class EmptyState implements CitiesoftheworldState {
  const factory EmptyState() = _$EmptyState;
}

abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
}

class _$LoadingStateCopyWithImpl<$Res>
    extends _$CitiesoftheworldStateCopyWithImpl<$Res>
    implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(
      LoadingState _value, $Res Function(LoadingState) _then)
      : super(_value, (v) => _then(v as LoadingState));

  @override
  LoadingState get _value => super._value as LoadingState;
}

class _$LoadingState implements LoadingState {
  const _$LoadingState();

  @override
  String toString() {
    return 'CitiesoftheworldState.loadingState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required Result loadedState(List<City> cities, bool rachedLastPage),
    @required Result errorState(String message),
  }) {
    assert(emptyState != null);
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return loadingState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyState(),
    Result loadingState(),
    Result loadedState(List<City> cities, bool rachedLastPage),
    Result errorState(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyState(EmptyState value),
    @required Result loadingState(LoadingState value),
    @required Result loadedState(LoadedState value),
    @required Result errorState(ErrorState value),
  }) {
    assert(emptyState != null);
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyState(EmptyState value),
    Result loadingState(LoadingState value),
    Result loadedState(LoadedState value),
    Result errorState(ErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements CitiesoftheworldState {
  const factory LoadingState() = _$LoadingState;
}

abstract class $LoadedStateCopyWith<$Res> {
  factory $LoadedStateCopyWith(
          LoadedState value, $Res Function(LoadedState) then) =
      _$LoadedStateCopyWithImpl<$Res>;
  $Res call({List<City> cities, bool rachedLastPage});
}

class _$LoadedStateCopyWithImpl<$Res>
    extends _$CitiesoftheworldStateCopyWithImpl<$Res>
    implements $LoadedStateCopyWith<$Res> {
  _$LoadedStateCopyWithImpl(
      LoadedState _value, $Res Function(LoadedState) _then)
      : super(_value, (v) => _then(v as LoadedState));

  @override
  LoadedState get _value => super._value as LoadedState;

  @override
  $Res call({
    Object cities = freezed,
    Object rachedLastPage = freezed,
  }) {
    return _then(LoadedState(
      cities: cities == freezed ? _value.cities : cities as List<City>,
      rachedLastPage: rachedLastPage == freezed
          ? _value.rachedLastPage
          : rachedLastPage as bool,
    ));
  }
}

class _$LoadedState implements LoadedState {
  const _$LoadedState({@required this.cities, @required this.rachedLastPage})
      : assert(cities != null),
        assert(rachedLastPage != null);

  @override
  final List<City> cities;
  @override
  final bool rachedLastPage;

  @override
  String toString() {
    return 'CitiesoftheworldState.loadedState(cities: $cities, rachedLastPage: $rachedLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedState &&
            (identical(other.cities, cities) ||
                const DeepCollectionEquality().equals(other.cities, cities)) &&
            (identical(other.rachedLastPage, rachedLastPage) ||
                const DeepCollectionEquality()
                    .equals(other.rachedLastPage, rachedLastPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cities) ^
      const DeepCollectionEquality().hash(rachedLastPage);

  @override
  $LoadedStateCopyWith<LoadedState> get copyWith =>
      _$LoadedStateCopyWithImpl<LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required Result loadedState(List<City> cities, bool rachedLastPage),
    @required Result errorState(String message),
  }) {
    assert(emptyState != null);
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return loadedState(cities, rachedLastPage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyState(),
    Result loadingState(),
    Result loadedState(List<City> cities, bool rachedLastPage),
    Result errorState(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(cities, rachedLastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyState(EmptyState value),
    @required Result loadingState(LoadingState value),
    @required Result loadedState(LoadedState value),
    @required Result errorState(ErrorState value),
  }) {
    assert(emptyState != null);
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return loadedState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyState(EmptyState value),
    Result loadingState(LoadingState value),
    Result loadedState(LoadedState value),
    Result errorState(ErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class LoadedState implements CitiesoftheworldState {
  const factory LoadedState(
      {@required List<City> cities,
      @required bool rachedLastPage}) = _$LoadedState;

  List<City> get cities;
  bool get rachedLastPage;
  $LoadedStateCopyWith<LoadedState> get copyWith;
}

abstract class $ErrorStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(
          ErrorState value, $Res Function(ErrorState) then) =
      _$ErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorStateCopyWithImpl<$Res>
    extends _$CitiesoftheworldStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(ErrorState _value, $Res Function(ErrorState) _then)
      : super(_value, (v) => _then(v as ErrorState));

  @override
  ErrorState get _value => super._value as ErrorState;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(ErrorState(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$ErrorState implements ErrorState {
  const _$ErrorState({@required this.message}) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'CitiesoftheworldState.errorState(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $ErrorStateCopyWith<ErrorState> get copyWith =>
      _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required Result loadedState(List<City> cities, bool rachedLastPage),
    @required Result errorState(String message),
  }) {
    assert(emptyState != null);
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return errorState(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyState(),
    Result loadingState(),
    Result loadedState(List<City> cities, bool rachedLastPage),
    Result errorState(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (errorState != null) {
      return errorState(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyState(EmptyState value),
    @required Result loadingState(LoadingState value),
    @required Result loadedState(LoadedState value),
    @required Result errorState(ErrorState value),
  }) {
    assert(emptyState != null);
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyState(EmptyState value),
    Result loadingState(LoadingState value),
    Result loadedState(LoadedState value),
    Result errorState(ErrorState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements CitiesoftheworldState {
  const factory ErrorState({@required String message}) = _$ErrorState;

  String get message;
  $ErrorStateCopyWith<ErrorState> get copyWith;
}
