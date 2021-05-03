import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;
  PokemonDetails(this.pokemon, {Key key}) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}