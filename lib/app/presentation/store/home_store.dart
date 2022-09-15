import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/failure/failure.dart';
import '../../domain/entity/character.dart';
import '../../domain/entity/character_data.dart';
import '../../domain/use_case/fetch_character_list_use_case.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase(this._fetchCharacterListUseCase);

  final FetchCharacterListUseCase _fetchCharacterListUseCase;

  int totalCharacters = 0;
  int offset = 0;
  final Set<Character> allCharacters = <Character>{};

  @observable
  List<Character> characters = <Character>[];

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  Future<void> fetchCharacters() async {
    _updateLoading();

    if (totalCharacters != 0 && offset == totalCharacters) return;

    if (offset > totalCharacters) {
      offset = offset - totalCharacters;
    }

    final Either<Failure, CharacterData> result = await _fetchCharacterListUseCase(offset: offset);

    result.fold((Failure failure) {
     updateError(value: failure.message);
    }, (CharacterData data) {
      totalCharacters = data.total;
      allCharacters.addAll(data.results);
      characters = allCharacters.toList();
      _updateLoading();
      updateOffset();
    });
  }

  @action
  void updateOffset({int? value}) {
    if (value == null) {
      offset += 20;
    } else {
      offset = value;
    }
  }

  void _updateLoading() {
    isLoading = !isLoading;
  }

  @action
  void findCharacter(String name) {
    if (name.isEmpty) {
      characters = allCharacters.toList();
    }

    List<Character> aux = <Character>[];

    aux = allCharacters.where((Character element) => element.name.toLowerCase().contains(name.toLowerCase())).toList();

    characters = aux;
  }

  @action
  void updateError({String? value}) {
    error = value;
  }
}
