import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_list/screens/pokemonList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Pokemon List',
      theme: ThemeData(
        primaryColor: Color(0xFF20233E),
        backgroundColor: Color(0xFF414B77),
        scaffoldBackgroundColor: Color(0xFF414B77)
      ),
      home: PokemonList(),
    );
  }
}
