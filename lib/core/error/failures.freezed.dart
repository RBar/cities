// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FailureTearOff {
  const _$FailureTearOff();

  ServerFailure serverFailure() {
    return const ServerFailure();
  }

  CacheFailure cacheFailure() {
    return const CacheFailure();
  }

  ConnectionFailure connectionFailure() {
    return const ConnectionFailure();
  }

  UnexpectedFailure unexpectedFailure() {
    return const UnexpectedFailure();
  }
}

// ignore: unused_element
const $Failure = _$FailureTearOff();

mixin _$Failure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverFailure(),
    @required Result cacheFailure(),
    @required Result connectionFailure(),
    @required Result unexpectedFailure(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverFailure(),
    Result cacheFailure(),
    Result connectionFailure(),
    Result unexpectedFailure(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverFailure(ServerFailure value),
    @required Result cacheFailure(CacheFailure value),
    @required Result connectionFailure(ConnectionFailure value),
    @required Result unexpectedFailure(UnexpectedFailure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverFailure(ServerFailure value),
    Result cacheFailure(CacheFailure value),
    Result connectionFailure(ConnectionFailure value),
    Result unexpectedFailure(UnexpectedFailure value),
    @required Result orElse(),
  });
}

abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
}

class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;
}

abstract class $ServerFailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(
          ServerFailure value, $Res Function(ServerFailure) then) =
      _$ServerFailureCopyWithImpl<$Res>;
}

class _$ServerFailureCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(
      ServerFailure _value, $Res Function(ServerFailure) _then)
      : super(_value, (v) => _then(v as ServerFailure));

  @override
  ServerFailure get _value => super._value as ServerFailure;
}

class _$ServerFailure implements ServerFailure {
  const _$ServerFailure();

  @override
  String toString() {
    return 'Failure.serverFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverFailure(),
    @required Result cacheFailure(),
    @required Result connectionFailure(),
    @required Result unexpectedFailure(),
  }) {
    assert(serverFailure != null);
    assert(cacheFailure != null);
    assert(connectionFailure != null);
    assert(unexpectedFailure != null);
    return serverFailure();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverFailure(),
    Result cacheFailure(),
    Result connectionFailure(),
    Result unexpectedFailure(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverFailure != null) {
      return serverFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverFailure(ServerFailure value),
    @required Result cacheFailure(CacheFailure value),
    @required Result connectionFailure(ConnectionFailure value),
    @required Result unexpectedFailure(UnexpectedFailure value),
  }) {
    assert(serverFailure != null);
    assert(cacheFailure != null);
    assert(connectionFailure != null);
    assert(unexpectedFailure != null);
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverFailure(ServerFailure value),
    Result cacheFailure(CacheFailure value),
    Result connectionFailure(ConnectionFailure value),
    Result unexpectedFailure(UnexpectedFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements Failure {
  const factory ServerFailure() = _$ServerFailure;
}

abstract class $CacheFailureCopyWith<$Res> {
  factory $CacheFailureCopyWith(
          CacheFailure value, $Res Function(CacheFailure) then) =
      _$CacheFailureCopyWithImpl<$Res>;
}

class _$CacheFailureCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $CacheFailureCopyWith<$Res> {
  _$CacheFailureCopyWithImpl(
      CacheFailure _value, $Res Function(CacheFailure) _then)
      : super(_value, (v) => _then(v as CacheFailure));

  @override
  CacheFailure get _value => super._value as CacheFailure;
}

class _$CacheFailure implements CacheFailure {
  const _$CacheFailure();

  @override
  String toString() {
    return 'Failure.cacheFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CacheFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverFailure(),
    @required Result cacheFailure(),
    @required Result connectionFailure(),
    @required Result unexpectedFailure(),
  }) {
    assert(serverFailure != null);
    assert(cacheFailure != null);
    assert(connectionFailure != null);
    assert(unexpectedFailure != null);
    return cacheFailure();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverFailure(),
    Result cacheFailure(),
    Result connectionFailure(),
    Result unexpectedFailure(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cacheFailure != null) {
      return cacheFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverFailure(ServerFailure value),
    @required Result cacheFailure(CacheFailure value),
    @required Result connectionFailure(ConnectionFailure value),
    @required Result unexpectedFailure(UnexpectedFailure value),
  }) {
    assert(serverFailure != null);
    assert(cacheFailure != null);
    assert(connectionFailure != null);
    assert(unexpectedFailure != null);
    return cacheFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverFailure(ServerFailure value),
    Result cacheFailure(CacheFailure value),
    Result connectionFailure(ConnectionFailure value),
    Result unexpectedFailure(UnexpectedFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cacheFailure != null) {
      return cacheFailure(this);
    }
    return orElse();
  }
}

abstract class CacheFailure implements Failure {
  const factory CacheFailure() = _$CacheFailure;
}

abstract class $ConnectionFailureCopyWith<$Res> {
  factory $ConnectionFailureCopyWith(
          ConnectionFailure value, $Res Function(ConnectionFailure) then) =
      _$ConnectionFailureCopyWithImpl<$Res>;
}

class _$ConnectionFailureCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $ConnectionFailureCopyWith<$Res> {
  _$ConnectionFailureCopyWithImpl(
      ConnectionFailure _value, $Res Function(ConnectionFailure) _then)
      : super(_value, (v) => _then(v as ConnectionFailure));

  @override
  ConnectionFailure get _value => super._value as ConnectionFailure;
}

class _$ConnectionFailure implements ConnectionFailure {
  const _$ConnectionFailure();

  @override
  String toString() {
    return 'Failure.connectionFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ConnectionFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverFailure(),
    @required Result cacheFailure(),
    @required Result connectionFailure(),
    @required Result unexpectedFailure(),
  }) {
    assert(serverFailure != null);
    assert(cacheFailure != null);
    assert(connectionFailure != null);
    assert(unexpectedFailure != null);
    return connectionFailure();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverFailure(),
    Result cacheFailure(),
    Result connectionFailure(),
    Result unexpectedFailure(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connectionFailure != null) {
      return connectionFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverFailure(ServerFailure value),
    @required Result cacheFailure(CacheFailure value),
    @required Result connectionFailure(ConnectionFailure value),
    @required Result unexpectedFailure(UnexpectedFailure value),
  }) {
    assert(serverFailure != null);
    assert(cacheFailure != null);
    assert(connectionFailure != null);
    assert(unexpectedFailure != null);
    return connectionFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverFailure(ServerFailure value),
    Result cacheFailure(CacheFailure value),
    Result connectionFailure(ConnectionFailure value),
    Result unexpectedFailure(UnexpectedFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connectionFailure != null) {
      return connectionFailure(this);
    }
    return orElse();
  }
}

abstract class ConnectionFailure implements Failure {
  const factory ConnectionFailure() = _$ConnectionFailure;
}

abstract class $UnexpectedFailureCopyWith<$Res> {
  factory $UnexpectedFailureCopyWith(
          UnexpectedFailure value, $Res Function(UnexpectedFailure) then) =
      _$UnexpectedFailureCopyWithImpl<$Res>;
}

class _$UnexpectedFailureCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $UnexpectedFailureCopyWith<$Res> {
  _$UnexpectedFailureCopyWithImpl(
      UnexpectedFailure _value, $Res Function(UnexpectedFailure) _then)
      : super(_value, (v) => _then(v as UnexpectedFailure));

  @override
  UnexpectedFailure get _value => super._value as UnexpectedFailure;
}

class _$UnexpectedFailure implements UnexpectedFailure {
  const _$UnexpectedFailure();

  @override
  String toString() {
    return 'Failure.unexpectedFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnexpectedFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverFailure(),
    @required Result cacheFailure(),
    @required Result connectionFailure(),
    @required Result unexpectedFailure(),
  }) {
    assert(serverFailure != null);
    assert(cacheFailure != null);
    assert(connectionFailure != null);
    assert(unexpectedFailure != null);
    return unexpectedFailure();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverFailure(),
    Result cacheFailure(),
    Result connectionFailure(),
    Result unexpectedFailure(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpectedFailure != null) {
      return unexpectedFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverFailure(ServerFailure value),
    @required Result cacheFailure(CacheFailure value),
    @required Result connectionFailure(ConnectionFailure value),
    @required Result unexpectedFailure(UnexpectedFailure value),
  }) {
    assert(serverFailure != null);
    assert(cacheFailure != null);
    assert(connectionFailure != null);
    assert(unexpectedFailure != null);
    return unexpectedFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverFailure(ServerFailure value),
    Result cacheFailure(CacheFailure value),
    Result connectionFailure(ConnectionFailure value),
    Result unexpectedFailure(UnexpectedFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpectedFailure != null) {
      return unexpectedFailure(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements Failure {
  const factory UnexpectedFailure() = _$UnexpectedFailure;
}
