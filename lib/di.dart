
import 'package:clean_code_pokemon_app/features/pokemon/data/datasource/pokemons_local_data_source.dart';
import 'package:clean_code_pokemon_app/features/pokemon/data/datasource/pokemons_remote_data_source.dart';
import 'package:clean_code_pokemon_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:clean_code_pokemon_app/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {

  //Bloc
  di.registerFactory(() => SearchPokemonBloc(di(), di(), di()));

  //USe cases
  di.registerLazySingleton(()=> CapturePokemonUseCase(repository: di()));
  di.registerLazySingleton(()=> GetCapturedPokemonsUseCase(repository: di()));
  di.registerLazySingleton(()=> SearchPokemonUseCase(repository: di()));

  //Repositories
  di.registerLazySingleton<PokemonsRepository>(() => PokemonsRepositoryImpl(
    pokemonsLocalDataSource: di(), 
    pokemonsRemoteDataSource: di()
  ));

  //Datasources 
  di.registerLazySingleton<PokemonsLocalDataSource>(() => HivePokemonLocalDataSourceImpl());
  di.registerLazySingleton<PokemonsRemoteDataSource>(() => PokemonsRemoteDataSourceImpl());

}
