import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../app/data/datasource/character_datasource.dart';
import '../../app/data/repository_impl/character_repository_impl.dart';
import '../../app/domain/repository/character_repository.dart';
import '../../app/domain/use_case/fetch_character_list_use_case.dart';
import '../../app/presentation/store/home_store.dart';

final GetIt di = GetIt.I;

Future<void> initDi() async {
  //Store
  di.registerFactory<HomeStore>(() => HomeStore(di<FetchCharacterListUseCase>()));
  //UseCase
  di.registerFactory<FetchCharacterListUseCase>(() => FetchCharacterListUseCase(di<CharacterRepository>()));
  //Repository
  di.registerFactory<CharacterRepository>(() => CharacterRepositoryImpl(di<CharacterDatasource>()));

  //Datasource
  di.registerFactory<CharacterDatasource>(() => CharacterDatasource(di<Dio>()));

  //HttpService
  di.registerLazySingleton<Dio>(() => Dio()..options.baseUrl = "http://gateway.marvel.com/v1/public/");
}
