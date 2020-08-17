import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class Country extends Equatable {
  final int id;
  final String name;
  final String code;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int continentId;

  const Country({
    @required this.id,
    @required this.name,
    @required this.code,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.continentId,
  });
  // equatable thing, for data class purposes
  @override
  List<Object> get props => [id, name, code, createdAt, updatedAt, continentId];
}
