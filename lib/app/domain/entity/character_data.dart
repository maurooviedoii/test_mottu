import 'package:json_annotation/json_annotation.dart';

import 'character.dart';

part 'character_data.g.dart';

@JsonSerializable()
class CharacterData {
  CharacterData(this.offset, this.limit, this.total, this.count, this.results);

  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Character> results;

  factory CharacterData.fromJson(Map<String, dynamic> json) => _$CharacterDataFromJson(json);
}
