import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../entity/character_data.dart';

abstract class CharacterRepository {
  Future<Either<Failure, CharacterData>> fetchCharacterList(int offset);
}
