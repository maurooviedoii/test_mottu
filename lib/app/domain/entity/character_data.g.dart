// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterData _$CharacterDataFromJson(Map<String, dynamic> json) =>
    CharacterData(
      json['offset'] as int,
      json['limit'] as int,
      json['total'] as int,
      json['count'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterDataToJson(CharacterData instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
      'results': instance.results,
    };
