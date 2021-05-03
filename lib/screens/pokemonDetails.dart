import 'package:flutter/material.dart';

import 'package:pokemon_list/utils/utils.dart';

import '../models/pokemon.dart';
import 'package:pokemon_list/utils/globalVars.dart';

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
    color: screenColor,
    padding: EdgeInsets.fromLTRB(width * 0.05,0,width * 0.05,width * 0.05),
    child: ListView(
      children: [
        _getPokemonImage(),
        _getPokemonName(),
        _getSimpleFieldText('Experience', widget.pokemon.experience.toString()),
        _getSimpleFieldText('Height', widget.pokemon.height.toString()),
        _getSimpleFieldText('Weight', widget.pokemon.weight.toString()),
        _getStatsWidget(),
        _getTypesWidget(),
        _getAbilitiesWidget(),
        _getMovesWidget(),
        _getItemsWidget(),
        _getFormsWidget(),
        _getIndicesWidget()
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
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height * 0.05,
        color: Colors.white
      ),
    )
  );
}

Widget _getSimpleFieldText(String field, String value){
  return Container(
    margin: EdgeInsets.only(bottom: height * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          field,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: height * 0.03,
            color: Colors.white
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: height * 0.03,
            color: Colors.white
          )
        )
      ]
    )
  );
}

Widget _getStatsWidget(){
  return Container(
    height: height * 0.08,
    margin: EdgeInsets.only(left: width * 0.075, right: width * 0.075, bottom: height * 0.02),
    alignment: Alignment.center,
    child: Text(
      'Stats',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height * 0.03,
        color: Colors.white
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: screenColor, 
      border: Border.all(
        color: Colors.white,
        width: 1,
      )
    ),
  );
}

Widget _getTypesWidget(){
  return Container(
    height: height * 0.08,
    margin: EdgeInsets.only(left: width * 0.075, right: width * 0.075, bottom: height * 0.02),
    alignment: Alignment.center,
    child: Text(
      'Types',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height * 0.03,
        color: Colors.white
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: screenColor, 
      border: Border.all(
        color: Colors.white,
        width: 1,
      )
    ),
  );
}

Widget _getAbilitiesWidget(){
  return Container(
    height: height * 0.08,
    margin: EdgeInsets.only(left: width * 0.075, right: width * 0.075, bottom: height * 0.02),
    alignment: Alignment.center,
    child: Text(
      'Abilities',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height * 0.03,
        color: Colors.white
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: screenColor, 
      border: Border.all(
        color: Colors.white,
        width: 1,
      )
    ),
  );
}

Widget _getMovesWidget(){
  return Container(
    height: height * 0.08,
    margin: EdgeInsets.only(left: width * 0.075, right: width * 0.075, bottom: height * 0.02),
    alignment: Alignment.center,
    child: Text(
      'Moves',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height * 0.03,
        color: Colors.white
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: screenColor, 
      border: Border.all(
        color: Colors.white,
        width: 1,
      )
    ),
  );
}

Widget _getItemsWidget(){
  return Container(
    height: height * 0.08,
    margin: EdgeInsets.only(left: width * 0.075, right: width * 0.075, bottom: height * 0.02),
    alignment: Alignment.center,
    child: Text(
      'Items',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height * 0.03,
        color: Colors.white
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: screenColor, 
      border: Border.all(
        color: Colors.white,
        width: 1,
      )
    ),
  );
}

Widget _getFormsWidget(){
  return Container(
    height: height * 0.08,
    margin: EdgeInsets.only(left: width * 0.075, right: width * 0.075, bottom: height * 0.02),
    alignment: Alignment.center,
    child: Text(
      'Forms',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height * 0.03,
        color: Colors.white
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: screenColor, 
      border: Border.all(
        color: Colors.white,
        width: 1,
      )
    ),
  );
}

Widget _getIndicesWidget(){
  return Container(
    height: height * 0.08,
    margin: EdgeInsets.only(left: width * 0.075, right: width * 0.075, bottom: height * 0.02),
    alignment: Alignment.center,
    child: Text(
      'Indices',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: height * 0.03,
        color: Colors.white
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: screenColor, 
      border: Border.all(
        color: Colors.white,
        width: 1,
      )
    ),
  );
}