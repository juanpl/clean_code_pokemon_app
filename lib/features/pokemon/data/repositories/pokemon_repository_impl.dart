import 'package:clean_code_pokemon_app/core/error/failures.dart';
import 'package:clean_code_pokemon_app/features/pokemon/data/datasource/pokemons_local_data_source.dart';
import 'package:clean_code_pokemon_app/features/pokemon/data/datasource/pokemons_remote_data_source.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {


  //Inversión de Dependencias

  final PokemonsLocalDataSource pokemonsLocalDataSource;
  final PokemonsRemoteDataSource pokemonsRemoteDataSource;

  PokemonsRepositoryImpl({
    required this.pokemonsLocalDataSource, 
    required this.pokemonsRemoteDataSource
  }); 

  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {

    try {
      final bool resp = await pokemonsLocalDataSource.capturePokemon(pokemon);
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    } 

  }

  @override
  Future<Either<Failure, List<Pokemon>>> getCapturePokemons() async {
    try {
      final List<Pokemon> resp = await pokemonsLocalDataSource.getCapturePokemonList();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    } 
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    try {
      final Pokemon resp = await pokemonsRemoteDataSource.getPokemon(id);
      return Right(resp);
    } on DioException {
      return Left(ServerFailure());
    } 
  }



}