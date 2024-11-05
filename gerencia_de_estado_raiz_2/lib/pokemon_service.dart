import 'package:gerencia_de_estado_raiz_2/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokemonService {
  final dio = Dio();

  Future<List<Pokemon>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Pokemon('Picachu'),
      Pokemon('Mewtwo'),
      Pokemon('Mew'),
      Pokemon('Rayquaza'),
      Pokemon('Lugia'),
      Pokemon('Giratina'),
      Pokemon('Kyurem'),
      Pokemon('Eternatus'),
    ];
  }
}
