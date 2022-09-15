import 'package:json_annotation/json_annotation.dart';

import 'comic_summary.dart';

part 'comic.g.dart';

@JsonSerializable()
class Comic {
  Comic(this.items);

  final List<ComicSummary> items;

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);
}
