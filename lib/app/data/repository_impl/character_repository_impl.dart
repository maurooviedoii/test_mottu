import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../domain/entity/character_data.dart';
import '../../domain/repository/character_repository.dart';
import '../datasource/character_datasource.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl(this._datasource);

  final CharacterDatasource _datasource;

  @override
  Future<Either<Failure, CharacterData>> fetchCharacterList(int offset) async {
    try {
      final dynamic result = await _datasource.fetchCharacterList(offset);
      final CharacterData characterData = CharacterData.fromJson(result['data']);
      return Right(characterData);
    } catch (e) {
      return Left(Failure("Error not implemented"));
    }
  }
}
