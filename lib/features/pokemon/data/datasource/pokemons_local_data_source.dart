import 'package:clean_code_pokemon_app/core/error/failures.dart';
import 'package:clean_code_pokemon_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PokemonsLocalDataSource {

  Future<bool> capturePokemon( Pokemon pokemon);
  Future<List<PokemonModel>> getCapturePokemonList();

}

class HivePokemonLocalDataSourceImpl implements PokemonsLocalDataSource {
  

  //Constructor
  HivePokemonLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> capturePokemon(Pokemon pokemon) async{
    try {

      Box<dynamic> box = await Hive.openBox('pokemons');
      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());

      return true;

    } catch (error) {
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturePokemonList() async{
    try {

      Box<dynamic> box = await Hive.openBox('pokemons');
      return box.values.map((p) => PokemonModel.fromJson(p)).toList();


    } catch (error) {
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

}