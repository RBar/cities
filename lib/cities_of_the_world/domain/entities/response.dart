import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/city_entity.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/pagination_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ResponseDataClass extends Equatable {
  final List<City> items;
  final Pagination pagination;

  const ResponseDataClass({
    @required this.items,
    @required this.pagination,
  });
  // equatable thing, for data class purposes
  @override
  List<Object> get props => [items, pagination];
}
