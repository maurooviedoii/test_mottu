import 'package:json_annotation/json_annotation.dart';

part 'comic_summary.g.dart';

@JsonSerializable()
class ComicSummary {
  ComicSummary(this.name);

  final String name;

  factory ComicSummary.fromJson(Map<String, dynamic> json) => _$ComicSummaryFromJson(json);
}
