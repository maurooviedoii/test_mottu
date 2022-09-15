import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  Image(this.path, this.extension);

  final String path;
  final String extension;

  String get imagePath => "$path.$extension";

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
