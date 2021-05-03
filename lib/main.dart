import 'package:flutter/material.dart';
import 'package:pokemon_list/screens/pokemonList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Pokemon List',
      home: PokemonList(),
    );
  }
}
