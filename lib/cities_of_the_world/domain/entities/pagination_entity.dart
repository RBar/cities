import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Pagination extends Equatable {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const Pagination({
    @required this.currentPage,
    @required this.lastPage,
    @required this.perPage,
    @required this.total,
  });
  // equatable thing, for data class purposes
  @override
  List<Object> get props => [currentPage, lastPage, perPage, total];
}
