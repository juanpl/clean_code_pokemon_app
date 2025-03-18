import 'package:bloc/bloc.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:meta/meta.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:clean_code_pokemon_app/features/pokemon/domain/use_cases/search_pokemon.dart';


part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {

  final CapturePokemonUseCase _capturePokemonUseCase;
  final GetCapturedPokemonsUseCase _getCapturedsPokemonsUseCase;
  final SearchPokemonUseCase _searchPokemonUseCase;


  SearchPokemonBloc(
    this._capturePokemonUseCase, 
    this._getCapturedsPokemonsUseCase, 
    this._searchPokemonUseCase) 
    : super(SearchPokemonInitial()) {

    on<OnSearchPokemon>((event, emit) async{
      emit(searchPokemonLoad)
    });



    on<SearchPokemonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }


}
