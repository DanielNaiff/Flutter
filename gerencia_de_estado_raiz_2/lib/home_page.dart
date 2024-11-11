import 'package:flutter/material.dart';
import 'package:gerencia_de_estado_raiz_2/pokemon_state.dart';
import 'package:gerencia_de_estado_raiz_2/pokemon_store.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final store = PokemonStore();

  // @override
  // void initState() {
  //   super.initState();

  //   store.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: store,
        builder: (context, child) {
          Widget body = Container();
          final state = store.state;

          if (state is LoadingPokemonState) {
            body = const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorPokemonState) {
            body = Center(
              child: ElevatedButton(
                onPressed: store.getPokemons,
                child: Text('Erro: $store.error. Toque para tentar novamente'),
              ),
            );
          } else if (state is EmptyPokemonState) {
            body = Center(
              child: ElevatedButton(
                onPressed: store.getPokemons,
                child: const Text("Toque aqui para carregar os Pokémons"),
              ),
            );
          } else if (state is GettedPokemonState) {
            body = ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokemons[index];
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
        });
  }
}


// import 'package:flutter/material.dart';
// import 'package:gerencia_de_estado_raiz_2/pokemon_store.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final store = PokemonStore();

//   // @override
//   // void initState() {
//   //   super.initState();

//   //   store.addListener(() {
//   //     setState(() {});
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return ListenableBuilder(
//         listenable: store,
//         builder: (context, child) {
//           Widget body = Container();
//           final state = store.state;

//           if (state.isLoading) {
//             body = const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state.error.isNotEmpty) {
//             body = Center(
//               child: ElevatedButton(
//                 onPressed: store.getPokemons,
//                 child: Text('Erro: $store.error. Toque para tentar novamente'),
//               ),
//             );
//           } else if (state.pokemons.isEmpty) {
//             body = Center(
//               child: ElevatedButton(
//                 onPressed: store.getPokemons,
//                 child: const Text("Toque aqui para carregar os Pokémons"),
//               ),
//             );
//           } else {
//             body = ListView.builder(
//               itemCount: state.pokemons.length,
//               itemBuilder: (context, index) {
//                 final pokemon = state.pokemons[index];
//                 return ListTile(
//                   title: Text(pokemon.name),
//                 );
//               },
//             );
//           }
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text("Pokemon"),
//             ),
//             body: body,
//           );
//         });
//   }
// }
