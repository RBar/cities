import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GGPhoto extends Equatable {
  final int height;
  final int width;
  final List<String> htmlAttributions;
  final String photoReference;

  const GGPhoto(
      {@required this.height,
      @required this.htmlAttributions,
      @required this.photoReference,
      @required this.width});
  // equatable thing, for data class purposes
  @override
  List<Object> get props => [height, width, htmlAttributions, photoReference];
}
