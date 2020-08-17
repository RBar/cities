import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/city/city_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/data/models/pagination/pagination_model.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/response.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'response_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(anyMap: true, fieldRename: FieldRename.snake)
class ResponseDataClassModel extends Equatable {
  @HiveField(0)
  final List<CityModel> items;
  @HiveField(1)
  final PaginationModel pagination;

  const ResponseDataClassModel({
    @required this.items,
    @required this.pagination,
  });
  factory ResponseDataClassModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataClassModelFromJson(json);
  ResponseDataClass toDomain() => ResponseDataClass(
        items: items.map((citiesModel) => citiesModel.toDomain()).toList(),
        pagination: pagination.toDomain(),
      );
  @override
  List<Object> get props => [items, pagination];
}
