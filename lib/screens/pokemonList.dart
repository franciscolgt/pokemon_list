import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_list/mappers/PokemonMapper.dart';
import 'package:pokemon_list/screens/pokemonDetails.dart';
import 'package:pokemon_list/utils/enterExitRoute.dart';
import 'package:pokemon_list/utils/typeIconsMap.dart';
import 'package:pokemon_list/utils/utils.dart';
import 'package:tuple/tuple.dart';

import 'package:pokemon_list/models/pokemon.dart';
import 'package:pokemon_list/repository/PokeApiRepository.dart';

var height;
var width;
var widget;
final PagingController<int, Tuple2<Pokemon, Pokemon>> _pagingController =
    PagingController(firstPageKey: 0);

class PokemonList extends StatefulWidget {
  PokemonList({Key key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  static const _pageSize = 10;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final pokemonListName = PokemonMapper().convertJsonToPokemonListName(
          await PokeApiRepository().fetchPokemonList(_pageSize * 2, pageKey));
      List<Tuple2<Pokemon, Pokemon>> pokemonList = [];
      for (var i = 0; i < pokemonListName.length; i += 2) {
        var pokemon1 = PokemonMapper().convertJsonToPokemon(
            await PokeApiRepository().fetchPokemonByName(pokemonListName[i]));
        var pokemon2 = PokemonMapper().convertJsonToPokemon(
            await PokeApiRepository()
                .fetchPokemonByName(pokemonListName[i + 1]));
        pokemonList.add(Tuple2(pokemon1, pokemon2));
      }
      final isLastPage = pokemonList.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(pokemonList);
      } else {
        final nextPageKey = pageKey + pokemonList.length * 2;
        _pagingController.appendPage(pokemonList, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    widget = this.widget;
    return Scaffold(
        appBar: Utils().getAppBar(context), body: _getBody(context));
  }
}

Widget _getBody(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(width * 0.05),
    child: Container(
      child: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Tuple2<Pokemon, Pokemon>>(
          itemBuilder: (context, pokemonPair, int) =>
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _getPokemonContainer(context, pokemonPair.item1),
            _getPokemonContainer(context, pokemonPair.item2)
          ]),
        ),
      ),
    ),
  );
}

Widget _getPokemonContainer(BuildContext context, Pokemon pokemon) {
  return Container(
      height: height * 0.31,
      width: width * 0.425,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: height * 0.025),
      child: MaterialButton(
          splashColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
                context,
                EnterExitRoute(
                    exitPage: widget, enterPage: PokemonDetails(pokemon)));
          },
          child: Column(
            children: [
              Image.network(pokemon.image, fit: BoxFit.fill),
              Container(
                child: Text(pokemon.name,
                    style: GoogleFonts.lemonada(
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.02,
                        color: Colors.white)),
              ),
              _getTypeIcons(pokemon.types)
            ],
          )),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Color.fromRGBO(82, 94, 148, 1),
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.only(bottom: width * 0.05));
}

Widget _getTypeIcons(List<String> types) {
  List<Widget> typeIconsList = [];
  for (var i = 0; i < types.length; i++) {
    typeIconsList.add(_getTypeIcon(types[i]));
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: typeIconsList,
  );
}

Widget _getTypeIcon(String type) {
  return Container(
      height: height * 0.06,
      width: width * 0.06,
      margin: EdgeInsets.only(left: height * 0.01, right: height * 0.01),
      child: CircleAvatar(
        child: SvgPicture.asset(
          icons[type][0],
        ),
        backgroundColor: Colors.transparent,
      ),
      decoration: BoxDecoration(
        color: icons[type][1],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: icons[type][2], spreadRadius: 4),
        ],
      ));
}
