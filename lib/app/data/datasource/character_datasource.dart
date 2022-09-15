import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class CharacterDatasource {
  CharacterDatasource(this.service);

  final Dio service;

  Future<dynamic> fetchCharacterList(int offset) async {
    try {
      final dynamic result = await service.get("characters", queryParameters: _buildQueryParams(offset));
      return result.data;
    } catch (_) {
      rethrow;
    }
  }

  Map<String, dynamic> _buildQueryParams(int offset) {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    const String key1 = "336515f6dd3384a1e3d3c7cf16bcc6c20d25cae7";
    const String key2 = "ad9c2fa2fa52e0cbfeaf826924782934";
    final String hash = md5.convert(utf8.encode(timestamp.toString() + key1 + key2)).toString();

    return {"ts": timestamp, "apikey": key2, "hash": hash, "orderBy": "name", "limit": 20, "offset": offset};
  }
}
