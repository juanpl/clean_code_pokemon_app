import 'package:clean_code_pokemon_app/core/error/failures.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:dartz/dartz.dart';

abstract class PokemonsRepository {

  Future<Either<Failure, Pokemon>> getPokemon(int id);
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon);
  Future<Either<Failure, List<Pokemon>>> getCapture(int id);

}