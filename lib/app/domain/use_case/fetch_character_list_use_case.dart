import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../entity/character_data.dart';
import '../repository/character_repository.dart';

class FetchCharacterListUseCase {
  FetchCharacterListUseCase(this._repo);

  final CharacterRepository _repo;

  Future<Either<Failure, CharacterData>> call({int offset = 0}) async {
    try {
      final Either<Failure, CharacterData> result = await _repo.fetchCharacterList(offset);

      return result.fold((Failure failure) => Left(failure), (CharacterData data) => Right(data));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
