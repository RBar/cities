import 'package:cities_of_the_world_demo/cities_of_the_world/domain/entities/gg_photo.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'ggphoto_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable(anyMap: true, fieldRename: FieldRename.snake)
class GGPhotoModel extends Equatable {
  @HiveField(0)
  final int height;
  @HiveField(1)
  final int width;
  @HiveField(2)
  final List<String> htmlAttributions;
  @HiveField(3)
  final String photoReference;
  const GGPhotoModel({
    @required this.height,
    @required this.width,
    @required this.htmlAttributions,
    @required this.photoReference,
  });

  factory GGPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$GGPhotoModelFromJson(json);
  Map<String, dynamic> toJson() => _$GGPhotoModelToJson(this);

  GGPhoto toDomain() => GGPhoto(
        width: width,
        height: height,
        htmlAttributions: htmlAttributions,
        photoReference: photoReference,
      );

  @override
  List<Object> get props => [width, height, htmlAttributions, photoReference];
}
