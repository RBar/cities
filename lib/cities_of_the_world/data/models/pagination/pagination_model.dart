import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/pagination_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'pagination_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(anyMap: true, fieldRename: FieldRename.snake)
class PaginationModel extends Equatable {
  @HiveField(0)
  final int currentPage;
  @HiveField(1)
  final int lastPage;
  @HiveField(2)
  final int perPage;
  @HiveField(3)
  final int total;

  const PaginationModel({
    @required this.currentPage,
    @required this.lastPage,
    @required this.perPage,
    @required this.total,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Pagination toDomain() => Pagination(
      currentPage: currentPage,
      lastPage: lastPage,
      perPage: perPage,
      total: total);
  @override
  List<Object> get props => [currentPage, lastPage, perPage, total];
}
