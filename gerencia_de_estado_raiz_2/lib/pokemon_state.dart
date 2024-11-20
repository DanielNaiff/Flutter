import 'package:gerencia_de_estado_raiz_2/pokemon_model.dart';

class PokemonState {
  final bool isLoading;
  final String error;
  final List<Pokemon> pokemons;

  PokemonState(
      {required this.isLoading, required this.error, required this.pokemons});

  factory PokemonState.empty() {
    return PokemonState(error: '', isLoading: false, pokemons: []);
  }

  PokemonState copyWith({
    bool? isLoading,
    String? error,
    List<Pokemon>? pokemons,
  }) {
    return PokemonState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        pokemons: pokemons ?? this.pokemons);
  }
}

// sealed class PokemonState {}

// class EmptyPokemonState implements PokemonState {}

// class LoadingPokemonState implements PokemonState {}

// class ErrorPokemonState implements PokemonState {
//   final String message;

//   ErrorPokemonState(this.message);
// }

// class GettedPokemonState implements PokemonState {
//   final List<Pokemon> pokemons;

//   GettedPokemonState(this.pokemons);
// }


