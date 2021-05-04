import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pokemon_list/utils/utils.dart';

import '../models/pokemon.dart';

var height;
var width;
var widget;

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;
  PokemonDetails(this.pokemon, {Key key}) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    widget = this.widget;
    return Scaffold(
      appBar: Utils().getAppBar(context),
      body: _getBody(context),
    );
  }
}

Widget _getBody(BuildContext context){
  return Container(
    padding: EdgeInsets.fromLTRB(width * 0.05,0,width * 0.05,width * 0.05),
    child: ListView(
      children: [
        _getPokemonImage(),
        _getPokemonName(),
        _getStatsWidget(widget.pokemon.experience.toString(), widget.pokemon.height.toString(), widget.pokemon.weight.toString())
      ],
    )
  );
}

Widget _getPokemonImage(){
  return Container(
    height: height * 0.5,
    width: height * 0.5,
    alignment: Alignment.center,
    child: Image.network(widget.pokemon.image, fit: BoxFit.fill),
  );
}

Widget _getPokemonName(){
  return Container(
    height: height * 0.1,
    alignment: Alignment.center,
    child: Text(
      widget.pokemon.name,
      style: GoogleFonts.lemonada(
      fontWeight: FontWeight.bold,
        fontSize: height * 0.05,
        color: Colors.white
      )
    )
  );
}

Widget _getStatsWidget(String experience, String pokemonHeight, String weight){
  return Container(
    margin: EdgeInsets.only(bottom: height * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: Text(
            'XP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: height * 0.03,
              color: Colors.white
            )
          )
        ),
        _getAttributeText(experience),
        Container(
          margin: EdgeInsets.fromLTRB(25, 0, 5, 0),
          child: FaIcon(FontAwesomeIcons.weight, color: Colors.white),
        ),
        _getAttributeText(weight),
        Container(
          margin: EdgeInsets.fromLTRB(25, 0, 5, 0),
          child: FaIcon(FontAwesomeIcons.rulerVertical, color: Colors.white),
        ),
        _getAttributeText(pokemonHeight),
      ]
    )
  );
}

Widget _getAttributeText(String value){
  return Text(
    value,
    style: GoogleFonts.ubuntu(
      fontSize: height * 0.025,
      color: Colors.white
    )
  );
}