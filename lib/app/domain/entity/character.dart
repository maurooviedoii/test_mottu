import 'package:json_annotation/json_annotation.dart';

import 'comic.dart';
import 'image.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  Character(this.id, this.name, this.description, this.thumbnail, this.comics);

  final int id;
  final String name;
  final String description;
  final Image thumbnail;
  final Comic comics;

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
}
