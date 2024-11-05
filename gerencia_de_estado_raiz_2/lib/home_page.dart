import 'package:flutter/material.dart';
import 'package:gerencia_de_estado_raiz_2/pokemon_model.dart';
import 'package:gerencia_de_estado_raiz_2/pokemon_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = PokemonService();

  var isLoading = false;
  var error = '';
  var pokemons = <Pokemon>[];

  getPokemons() async {
    setState(() {
      isLoading = true;
      error = '';
    });

    try {
      final fetchedPokemons = await service.fetchAll();
      setState(() {
        pokemons = fetchedPokemons;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (isLoading) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (error.isNotEmpty) {
      body = Center(
        child: ElevatedButton(
          onPressed: getPokemons,
          child: Text('Erro: $error. Toque para tentar novamente'),
        ),
      );
    } else if (pokemons.isEmpty) {
      body = Center(
        child: ElevatedButton(
          onPressed: getPokemons,
          child: const Text("Toque aqui para carregar os Pokémons"),
        ),
      );
    } else {
      body = ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return ListTile(
            title: Text(pokemon.name),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon"),
      ),
      body: body,
    );
  }
}
