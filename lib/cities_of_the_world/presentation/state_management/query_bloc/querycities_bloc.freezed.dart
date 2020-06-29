// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'querycities_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$QuerycitiesEventTearOff {
  const _$QuerycitiesEventTearOff();

  GetFilteredCitiesWithCountriesEvent getFilteredCitiesWithCountriesEvent(
      {@required String filter}) {
    return GetFilteredCitiesWithCountriesEvent(
      filter: filter,
    );
  }

  GetFilteredCitiesWithCountriesAtPageEvent
      getFilteredCitiesWithCountriesAtPageEvent(
          {@required int page, @required String filter}) {
    return GetFilteredCitiesWithCountriesAtPageEvent(
      page: page,
      filter: filter,
    );
  }
}

// ignore: unused_element
const $QuerycitiesEvent = _$QuerycitiesEventTearOff();

mixin _$QuerycitiesEvent {
  String get filter;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getFilteredCitiesWithCountriesEvent(String filter),
    @required
        Result getFilteredCitiesWithCountriesAtPageEvent(
            int page, String filter),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getFilteredCitiesWithCountriesEvent(String filter),
    Result getFilteredCitiesWithCountriesAtPageEvent(int page, String filter),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result getFilteredCitiesWithCountriesEvent(
            GetFilteredCitiesWithCountriesEvent value),
    @required
        Result getFilteredCitiesWithCountriesAtPageEvent(
            GetFilteredCitiesWithCountriesAtPageEvent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getFilteredCitiesWithCountriesEvent(
        GetFilteredCitiesWithCountriesEvent value),
    Result getFilteredCitiesWithCountriesAtPageEvent(
        GetFilteredCitiesWithCountriesAtPageEvent value),
    @required Result orElse(),
  });

  $QuerycitiesEventCopyWith<QuerycitiesEvent> get copyWith;
}

abstract class $QuerycitiesEventCopyWith<$Res> {
  factory $QuerycitiesEventCopyWith(
          QuerycitiesEvent value, $Res Function(QuerycitiesEvent) then) =
      _$QuerycitiesEventCopyWithImpl<$Res>;
  $Res call({String filter});
}

class _$QuerycitiesEventCopyWithImpl<$Res>
    implements $QuerycitiesEventCopyWith<$Res> {
  _$QuerycitiesEventCopyWithImpl(this._value, this._then);

  final QuerycitiesEvent _value;
  // ignore: unused_field
  final $Res Function(QuerycitiesEvent) _then;

  @override
  $Res call({
    Object filter = freezed,
  }) {
    return _then(_value.copyWith(
      filter: filter == freezed ? _value.filter : filter as String,
    ));
  }
}

abstract class $GetFilteredCitiesWithCountriesEventCopyWith<$Res>
    implements $QuerycitiesEventCopyWith<$Res> {
  factory $GetFilteredCitiesWithCountriesEventCopyWith(
          GetFilteredCitiesWithCountriesEvent value,
          $Res Function(GetFilteredCitiesWithCountriesEvent) then) =
      _$GetFilteredCitiesWithCountriesEventCopyWithImpl<$Res>;
  @override
  $Res call({String filter});
}

class _$GetFilteredCitiesWithCountriesEventCopyWithImpl<$Res>
    extends _$QuerycitiesEventCopyWithImpl<$Res>
    implements $GetFilteredCitiesWithCountriesEventCopyWith<$Res> {
  _$GetFilteredCitiesWithCountriesEventCopyWithImpl(
      GetFilteredCitiesWithCountriesEvent _value,
      $Res Function(GetFilteredCitiesWithCountriesEvent) _then)
      : super(_value, (v) => _then(v as GetFilteredCitiesWithCountriesEvent));

  @override
  GetFilteredCitiesWithCountriesEvent get _value =>
      super._value as GetFilteredCitiesWithCountriesEvent;

  @override
  $Res call({
    Object filter = freezed,
  }) {
    return _then(GetFilteredCitiesWithCountriesEvent(
      filter: filter == freezed ? _value.filter : filter as String,
    ));
  }
}

class _$GetFilteredCitiesWithCountriesEvent
    implements GetFilteredCitiesWithCountriesEvent {
  const _$GetFilteredCitiesWithCountriesEvent({@required this.filter})
      : assert(filter != null);

  @override
  final String filter;

  @override
  String toString() {
    return 'QuerycitiesEvent.getFilteredCitiesWithCountriesEvent(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetFilteredCitiesWithCountriesEvent &&
            (identical(other.filter, filter) ||
                const DeepCollectionEquality().equals(other.filter, filter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filter);

  @override
  $GetFilteredCitiesWithCountriesEventCopyWith<
          GetFilteredCitiesWithCountriesEvent>
      get copyWith => _$GetFilteredCitiesWithCountriesEventCopyWithImpl<
          GetFilteredCitiesWithCountriesEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getFilteredCitiesWithCountriesEvent(String filter),
    @required
        Result getFilteredCitiesWithCountriesAtPageEvent(
            int page, String filter),
  }) {
    assert(getFilteredCitiesWithCountriesEvent != null);
    assert(getFilteredCitiesWithCountriesAtPageEvent != null);
    return getFilteredCitiesWithCountriesEvent(filter);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getFilteredCitiesWithCountriesEvent(String filter),
    Result getFilteredCitiesWithCountriesAtPageEvent(int page, String filter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getFilteredCitiesWithCountriesEvent != null) {
      return getFilteredCitiesWithCountriesEvent(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result getFilteredCitiesWithCountriesEvent(
            GetFilteredCitiesWithCountriesEvent value),
    @required
        Result getFilteredCitiesWithCountriesAtPageEvent(
            GetFilteredCitiesWithCountriesAtPageEvent value),
  }) {
    assert(getFilteredCitiesWithCountriesEvent != null);
    assert(getFilteredCitiesWithCountriesAtPageEvent != null);
    return getFilteredCitiesWithCountriesEvent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getFilteredCitiesWithCountriesEvent(
        GetFilteredCitiesWithCountriesEvent value),
    Result getFilteredCitiesWithCountriesAtPageEvent(
        GetFilteredCitiesWithCountriesAtPageEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getFilteredCitiesWithCountriesEvent != null) {
      return getFilteredCitiesWithCountriesEvent(this);
    }
    return orElse();
  }
}

abstract class GetFilteredCitiesWithCountriesEvent implements QuerycitiesEvent {
  const factory GetFilteredCitiesWithCountriesEvent({@required String filter}) =
      _$GetFilteredCitiesWithCountriesEvent;

  @override
  String get filter;
  @override
  $GetFilteredCitiesWithCountriesEventCopyWith<
      GetFilteredCitiesWithCountriesEvent> get copyWith;
}

abstract class $GetFilteredCitiesWithCountriesAtPageEventCopyWith<$Res>
    implements $QuerycitiesEventCopyWith<$Res> {
  factory $GetFilteredCitiesWithCountriesAtPageEventCopyWith(
          GetFilteredCitiesWithCountriesAtPageEvent value,
          $Res Function(GetFilteredCitiesWithCountriesAtPageEvent) then) =
      _$GetFilteredCitiesWithCountriesAtPageEventCopyWithImpl<$Res>;
  @override
  $Res call({int page, String filter});
}

class _$GetFilteredCitiesWithCountriesAtPageEventCopyWithImpl<$Res>
    extends _$QuerycitiesEventCopyWithImpl<$Res>
    implements $GetFilteredCitiesWithCountriesAtPageEventCopyWith<$Res> {
  _$GetFilteredCitiesWithCountriesAtPageEventCopyWithImpl(
      GetFilteredCitiesWithCountriesAtPageEvent _value,
      $Res Function(GetFilteredCitiesWithCountriesAtPageEvent) _then)
      : super(_value,
            (v) => _then(v as GetFilteredCitiesWithCountriesAtPageEvent));

  @override
  GetFilteredCitiesWithCountriesAtPageEvent get _value =>
      super._value as GetFilteredCitiesWithCountriesAtPageEvent;

  @override
  $Res call({
    Object page = freezed,
    Object filter = freezed,
  }) {
    return _then(GetFilteredCitiesWithCountriesAtPageEvent(
      page: page == freezed ? _value.page : page as int,
      filter: filter == freezed ? _value.filter : filter as String,
    ));
  }
}

class _$GetFilteredCitiesWithCountriesAtPageEvent
    implements GetFilteredCitiesWithCountriesAtPageEvent {
  const _$GetFilteredCitiesWithCountriesAtPageEvent(
      {@required this.page, @required this.filter})
      : assert(page != null),
        assert(filter != null);

  @override
  final int page;
  @override
  final String filter;

  @override
  String toString() {
    return 'QuerycitiesEvent.getFilteredCitiesWithCountriesAtPageEvent(page: $page, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetFilteredCitiesWithCountriesAtPageEvent &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.filter, filter) ||
                const DeepCollectionEquality().equals(other.filter, filter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(filter);

  @override
  $GetFilteredCitiesWithCountriesAtPageEventCopyWith<
          GetFilteredCitiesWithCountriesAtPageEvent>
      get copyWith => _$GetFilteredCitiesWithCountriesAtPageEventCopyWithImpl<
          GetFilteredCitiesWithCountriesAtPageEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getFilteredCitiesWithCountriesEvent(String filter),
    @required
        Result getFilteredCitiesWithCountriesAtPageEvent(
            int page, String filter),
  }) {
    assert(getFilteredCitiesWithCountriesEvent != null);
    assert(getFilteredCitiesWithCountriesAtPageEvent != null);
    return getFilteredCitiesWithCountriesAtPageEvent(page, filter);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getFilteredCitiesWithCountriesEvent(String filter),
    Result getFilteredCitiesWithCountriesAtPageEvent(int page, String filter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getFilteredCitiesWithCountriesAtPageEvent != null) {
      return getFilteredCitiesWithCountriesAtPageEvent(page, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result getFilteredCitiesWithCountriesEvent(
            GetFilteredCitiesWithCountriesEvent value),
    @required
        Result getFilteredCitiesWithCountriesAtPageEvent(
            GetFilteredCitiesWithCountriesAtPageEvent value),
  }) {
    assert(getFilteredCitiesWithCountriesEvent != null);
    assert(getFilteredCitiesWithCountriesAtPageEvent != null);
    return getFilteredCitiesWithCountriesAtPageEvent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getFilteredCitiesWithCountriesEvent(
        GetFilteredCitiesWithCountriesEvent value),
    Result getFilteredCitiesWithCountriesAtPageEvent(
        GetFilteredCitiesWithCountriesAtPageEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getFilteredCitiesWithCountriesAtPageEvent != null) {
      return getFilteredCitiesWithCountriesAtPageEvent(this);
    }
    return orElse();
  }
}

abstract class GetFilteredCitiesWithCountriesAtPageEvent
    implements QuerycitiesEvent {
  const factory GetFilteredCitiesWithCountriesAtPageEvent(
      {@required int page,
      @required String filter}) = _$GetFilteredCitiesWithCountriesAtPageEvent;

  int get page;
  @override
  String get filter;
  @override
  $GetFilteredCitiesWithCountriesAtPageEventCopyWith<
      GetFilteredCitiesWithCountriesAtPageEvent> get copyWith;
}

class _$QuerycitiesStateTearOff {
  const _$QuerycitiesStateTearOff();

  EmptyQueryState emptyState() {
    return const EmptyQueryState();
  }

  LoadingQueryState loadingState() {
    return const LoadingQueryState();
  }

  LoadedQueryState loadedState(
      {@required List<City> cities,
      @required bool reachedLastPage,
      @required int results}) {
    return LoadedQueryState(
      cities: cities,
      reachedLastPage: reachedLastPage,
      results: results,
    );
  }

  ErrorQueryState errorState({@required String message}) {
    return ErrorQueryState(
      message: message,
    );
  }
}

// ignore: unused_element
const $QuerycitiesState = _$QuerycitiesStateTearOff();

mixin _$QuerycitiesState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required
        Result loadedState(
            List<City> cities, bool reachedLastPage, int results),
    @required Result errorState(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyState(),
    Result loadingState(),
    Result loadedState(List<City> cities, bool reachedLastPage, int results),
    Result errorState(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyState(EmptyQueryState value),
    @required Result loadingState(LoadingQueryState value),
    @required Result loadedState(LoadedQueryState value),
    @required Result errorState(ErrorQueryState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyState(EmptyQueryState value),
    Result loadingState(LoadingQueryState value),
    Result loadedState(LoadedQueryState value),
    Result errorState(ErrorQueryState value),
    @required Result orElse(),
  });
}

abstract class $QuerycitiesStateCopyWith<$Res> {
  factory $QuerycitiesStateCopyWith(
          QuerycitiesState value, $Res Function(QuerycitiesState) then) =
      _$QuerycitiesStateCopyWithImpl<$Res>;
}

class _$QuerycitiesStateCopyWithImpl<$Res>
    implements $QuerycitiesStateCopyWith<$Res> {
  _$QuerycitiesStateCopyWithImpl(this._value, this._then);

  final QuerycitiesState _value;
  // ignore: unused_field
  final $Res Function(QuerycitiesState) _then;
}

abstract class $EmptyQueryStateCopyWith<$Res> {
  factory $EmptyQueryStateCopyWith(
          EmptyQueryState value, $Res Function(EmptyQueryState) then) =
      _$EmptyQueryStateCopyWithImpl<$Res>;
}

class _$EmptyQueryStateCopyWithImpl<$Res>
    extends _$QuerycitiesStateCopyWithImpl<$Res>
    implements $EmptyQueryStateCopyWith<$Res> {
  _$EmptyQueryStateCopyWithImpl(
      EmptyQueryState _value, $Res Function(EmptyQueryState) _then)
      : super(_value, (v) => _then(v as EmptyQueryState));

  @override
  EmptyQueryState get _value => super._value as EmptyQueryState;
}

class _$EmptyQueryState implements EmptyQueryState {
  const _$EmptyQueryState();

  @override
  String toString() {
    return 'QuerycitiesState.emptyState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmptyQueryState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required
        Result loadedState(
            List<City> cities, bool reachedLastPage, int results),
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
    Result loadedState(List<City> cities, bool reachedLastPage, int results),
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
    @required Result emptyState(EmptyQueryState value),
    @required Result loadingState(LoadingQueryState value),
    @required Result loadedState(LoadedQueryState value),
    @required Result errorState(ErrorQueryState value),
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
    Result emptyState(EmptyQueryState value),
    Result loadingState(LoadingQueryState value),
    Result loadedState(LoadedQueryState value),
    Result errorState(ErrorQueryState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyState != null) {
      return emptyState(this);
    }
    return orElse();
  }
}

abstract class EmptyQueryState implements QuerycitiesState {
  const factory EmptyQueryState() = _$EmptyQueryState;
}

abstract class $LoadingQueryStateCopyWith<$Res> {
  factory $LoadingQueryStateCopyWith(
          LoadingQueryState value, $Res Function(LoadingQueryState) then) =
      _$LoadingQueryStateCopyWithImpl<$Res>;
}

class _$LoadingQueryStateCopyWithImpl<$Res>
    extends _$QuerycitiesStateCopyWithImpl<$Res>
    implements $LoadingQueryStateCopyWith<$Res> {
  _$LoadingQueryStateCopyWithImpl(
      LoadingQueryState _value, $Res Function(LoadingQueryState) _then)
      : super(_value, (v) => _then(v as LoadingQueryState));

  @override
  LoadingQueryState get _value => super._value as LoadingQueryState;
}

class _$LoadingQueryState implements LoadingQueryState {
  const _$LoadingQueryState();

  @override
  String toString() {
    return 'QuerycitiesState.loadingState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingQueryState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required
        Result loadedState(
            List<City> cities, bool reachedLastPage, int results),
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
    Result loadedState(List<City> cities, bool reachedLastPage, int results),
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
    @required Result emptyState(EmptyQueryState value),
    @required Result loadingState(LoadingQueryState value),
    @required Result loadedState(LoadedQueryState value),
    @required Result errorState(ErrorQueryState value),
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
    Result emptyState(EmptyQueryState value),
    Result loadingState(LoadingQueryState value),
    Result loadedState(LoadedQueryState value),
    Result errorState(ErrorQueryState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class LoadingQueryState implements QuerycitiesState {
  const factory LoadingQueryState() = _$LoadingQueryState;
}

abstract class $LoadedQueryStateCopyWith<$Res> {
  factory $LoadedQueryStateCopyWith(
          LoadedQueryState value, $Res Function(LoadedQueryState) then) =
      _$LoadedQueryStateCopyWithImpl<$Res>;
  $Res call({List<City> cities, bool reachedLastPage, int results});
}

class _$LoadedQueryStateCopyWithImpl<$Res>
    extends _$QuerycitiesStateCopyWithImpl<$Res>
    implements $LoadedQueryStateCopyWith<$Res> {
  _$LoadedQueryStateCopyWithImpl(
      LoadedQueryState _value, $Res Function(LoadedQueryState) _then)
      : super(_value, (v) => _then(v as LoadedQueryState));

  @override
  LoadedQueryState get _value => super._value as LoadedQueryState;

  @override
  $Res call({
    Object cities = freezed,
    Object reachedLastPage = freezed,
    Object results = freezed,
  }) {
    return _then(LoadedQueryState(
      cities: cities == freezed ? _value.cities : cities as List<City>,
      reachedLastPage: reachedLastPage == freezed
          ? _value.reachedLastPage
          : reachedLastPage as bool,
      results: results == freezed ? _value.results : results as int,
    ));
  }
}

class _$LoadedQueryState implements LoadedQueryState {
  const _$LoadedQueryState(
      {@required this.cities,
      @required this.reachedLastPage,
      @required this.results})
      : assert(cities != null),
        assert(reachedLastPage != null),
        assert(results != null);

  @override
  final List<City> cities;
  @override
  final bool reachedLastPage;
  @override
  final int results;

  @override
  String toString() {
    return 'QuerycitiesState.loadedState(cities: $cities, reachedLastPage: $reachedLastPage, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedQueryState &&
            (identical(other.cities, cities) ||
                const DeepCollectionEquality().equals(other.cities, cities)) &&
            (identical(other.reachedLastPage, reachedLastPage) ||
                const DeepCollectionEquality()
                    .equals(other.reachedLastPage, reachedLastPage)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cities) ^
      const DeepCollectionEquality().hash(reachedLastPage) ^
      const DeepCollectionEquality().hash(results);

  @override
  $LoadedQueryStateCopyWith<LoadedQueryState> get copyWith =>
      _$LoadedQueryStateCopyWithImpl<LoadedQueryState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required
        Result loadedState(
            List<City> cities, bool reachedLastPage, int results),
    @required Result errorState(String message),
  }) {
    assert(emptyState != null);
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return loadedState(cities, reachedLastPage, results);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyState(),
    Result loadingState(),
    Result loadedState(List<City> cities, bool reachedLastPage, int results),
    Result errorState(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(cities, reachedLastPage, results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyState(EmptyQueryState value),
    @required Result loadingState(LoadingQueryState value),
    @required Result loadedState(LoadedQueryState value),
    @required Result errorState(ErrorQueryState value),
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
    Result emptyState(EmptyQueryState value),
    Result loadingState(LoadingQueryState value),
    Result loadedState(LoadedQueryState value),
    Result errorState(ErrorQueryState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class LoadedQueryState implements QuerycitiesState {
  const factory LoadedQueryState(
      {@required List<City> cities,
      @required bool reachedLastPage,
      @required int results}) = _$LoadedQueryState;

  List<City> get cities;
  bool get reachedLastPage;
  int get results;
  $LoadedQueryStateCopyWith<LoadedQueryState> get copyWith;
}

abstract class $ErrorQueryStateCopyWith<$Res> {
  factory $ErrorQueryStateCopyWith(
          ErrorQueryState value, $Res Function(ErrorQueryState) then) =
      _$ErrorQueryStateCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorQueryStateCopyWithImpl<$Res>
    extends _$QuerycitiesStateCopyWithImpl<$Res>
    implements $ErrorQueryStateCopyWith<$Res> {
  _$ErrorQueryStateCopyWithImpl(
      ErrorQueryState _value, $Res Function(ErrorQueryState) _then)
      : super(_value, (v) => _then(v as ErrorQueryState));

  @override
  ErrorQueryState get _value => super._value as ErrorQueryState;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(ErrorQueryState(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$ErrorQueryState implements ErrorQueryState {
  const _$ErrorQueryState({@required this.message}) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'QuerycitiesState.errorState(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorQueryState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $ErrorQueryStateCopyWith<ErrorQueryState> get copyWith =>
      _$ErrorQueryStateCopyWithImpl<ErrorQueryState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyState(),
    @required Result loadingState(),
    @required
        Result loadedState(
            List<City> cities, bool reachedLastPage, int results),
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
    Result loadedState(List<City> cities, bool reachedLastPage, int results),
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
    @required Result emptyState(EmptyQueryState value),
    @required Result loadingState(LoadingQueryState value),
    @required Result loadedState(LoadedQueryState value),
    @required Result errorState(ErrorQueryState value),
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
    Result emptyState(EmptyQueryState value),
    Result loadingState(LoadingQueryState value),
    Result loadedState(LoadedQueryState value),
    Result errorState(ErrorQueryState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class ErrorQueryState implements QuerycitiesState {
  const factory ErrorQueryState({@required String message}) = _$ErrorQueryState;

  String get message;
  $ErrorQueryStateCopyWith<ErrorQueryState> get copyWith;
}
