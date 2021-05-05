import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_list/models/move.dart';
import 'package:pokemon_list/models/stat.dart';

import 'package:pokemon_list/utils/utils.dart';

import '../models/pokemon.dart';

var height;
var width;
var widget;
var dropdownValue;

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;
  PokemonDetails(this.pokemon, {Key key}) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  void initState() {
    super.initState();

    widget = this.widget;
    //dropdownValue = widget.pokemon.moves[0].name;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: Utils().getAppBar(context),
        body: Container(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, 0, width * 0.05, width * 0.05),
            child: ListView(children: [
              _getPokemonImage(),
              _getPokemonName(),
              _getInfoWidget(
                  widget.pokemon.experience.toString(),
                  widget.pokemon.height.toString(),
                  widget.pokemon.weight.toString()),
              _getStatsWidget(widget.pokemon.stats),
              Container(
                  height: height * 0.06,
                  padding: EdgeInsets.only(left: 10, right: 25),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(82, 94, 148, 1),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    dropdownColor: Color.fromRGBO(82, 94, 148, 1),
                    hint: Text('Select move',
                        style: TextStyle(color: Colors.white)),
                    value: dropdownValue,
                    icon: FaIcon(FontAwesomeIcons.chevronDown,
                        color: Colors.white),
                    isExpanded: true,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: widget.pokemon.moves
                        .map<DropdownMenuItem<String>>((Move move) {
                      return DropdownMenuItem<String>(
                        value: move.name,
                        child: Text(move.name,
                            style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  )))
            ])));
  }
}

Widget _getPokemonImage() {
  return Container(
    height: height * 0.5,
    width: height * 0.5,
    alignment: Alignment.center,
    child: Image.network(widget.pokemon.image, fit: BoxFit.fill),
  );
}

Widget _getPokemonName() {
  return Container(
      height: height * 0.1,
      alignment: Alignment.center,
      child: Text(widget.pokemon.name,
          style: GoogleFonts.lemonada(
              fontWeight: FontWeight.bold,
              fontSize: height * 0.05,
              color: Colors.white)));
}

Widget _getInfoWidget(String experience, String pokemonHeight, String weight) {
  return Container(
      margin: EdgeInsets.only(bottom: height * 0.02),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.only(right: 5),
            child: Text('XP',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.03,
                    color: Colors.white))),
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
      ]));
}

Widget _getAttributeText(String value) {
  return Text(value,
      style: GoogleFonts.ubuntu(fontSize: height * 0.025, color: Colors.white));
}

Widget _getStatsWidget(List<Stat> stats) {
  int hp = 0;
  int attack = 0;
  int defense = 0;
  int speed = 0;
  stats.forEach((s) {
    if (s.name == 'hp') hp = s.value;
    if (s.name == 'attack') attack = s.value;
    if (s.name == 'defense') defense = s.value;
    if (s.name == 'speed') speed = s.value;
  });
  return Container(
      height: 0.1 * height,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _getStatContainer(FontAwesomeIcons.heartbeat, hp, Colors.red),
            _getStatContainer(FontAwesomeIcons.fistRaised, attack, Colors.grey),
            _getStatContainer(FontAwesomeIcons.shieldAlt, defense, Colors.blue),
            _getStatContainer(FontAwesomeIcons.wind, speed, Colors.green)
          ]),
        ],
      ));
}

Widget _getStatContainer(IconData icon, int value, Color iconColor) {
  return Container(
    height: height * 0.045,
    width: width * 0.2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: FaIcon(icon, color: iconColor),
        ),
        Text(value.toString(),
            style: GoogleFonts.ubuntu(fontSize: height * 0.025))
      ],
    ),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16))),
  );
}
