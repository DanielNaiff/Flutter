import 'package:flutter/material.dart';
import 'package:gerencia_de_estado_raiz_2/pokemon_service.dart';
import 'package:gerencia_de_estado_raiz_2/pokemon_state.dart';

//classe responsivel por armazenar as propriedades que representam o estado

class PokemonStore extends ChangeNotifier {
  final service = PokemonService();

  var state = PokemonState.empty();

  getPokemons() async {
    state = state.copyWith(error: '', isLoading: true);
    notifyListeners();

    try {
      final pokemons = await service.fetchAll();
      state = state.copyWith(isLoading: false, pokemons: pokemons);
      notifyListeners();
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
      notifyListeners();
    }
  }
}

// class PokemonStore extends ChangeNotifier {
//   final service = PokemonService();

//   PokemonState state = EmptyPokemonState();

//   getPokemons() async {
//     state = LoadingPokemonState();
//     notifyListeners();

//     try {
//       final pokemons = await service.fetchAll();
//       state = GettedPokemonState(pokemons);
//       notifyListeners();
//     } catch (e) {
//       state = ErrorPokemonState(e.toString());
//       notifyListeners();
//     }
//   }
// }

