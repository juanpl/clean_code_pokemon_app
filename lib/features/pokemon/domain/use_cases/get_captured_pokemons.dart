import 'package:clean_code_pokemon_app/core/error/failures.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';

class GetCapturedPokemonsUseCase {

  final PokemonsRepository repository;

  GetCapturedPokemonsUseCase({required this.repository});

  Future<Either<Failure, List<Pokemon>>> call() {
    return repository.getCapturePokemons();
  }


}