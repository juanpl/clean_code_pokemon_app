import 'package:clean_code_pokemon_app/core/error/failures.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';

class CapturePokemonUseCase {

  final PokemonsRepository repository;

  CapturePokemonUseCase({required this.repository});

  Future<Either<Failure, bool>> call(Pokemon pokemon) {
    return repository.capturePokemon(pokemon); 
  }

}