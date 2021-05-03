import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_list/mappers/PokemonMapper.dart';
import 'package:tuple/tuple.dart';

import 'models/pokemon.dart';
import 'repository/PokeApiRepository.dart';
import 'repository/PokeApiRepository.dart';

var height;
var width;
final PagingController<int, Tuple2<Pokemon, Pokemon>> _pagingController = PagingController(firstPageKey: 0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Pokemon List',
      home: PokemonList(title: 'Pokemon List'),
    );
  }
}

class PokemonList extends StatefulWidget {
  PokemonList({Key key, this.title}) : super(key: key);
  final String title;

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
      final pokemonListName = PokemonMapper().convertJsonToPokemonListName(await PokeApiRepository().fetchPokemonList(_pageSize*2, pageKey));
      List<Tuple2<Pokemon,Pokemon>> pokemonList = [];
      for(var i=0; i<pokemonListName.length; i+=2){
        var pokemon1 = PokemonMapper().convertJsonToPokemon(await PokeApiRepository().fetchPokemonByName(pokemonListName[i]));
        var pokemon2 = PokemonMapper().convertJsonToPokemon(await PokeApiRepository().fetchPokemonByName(pokemonListName[i+1]));
        pokemonList.add(Tuple2(pokemon1, pokemon2));
      }
      print(pokemonList);
      _pagingController.appendLastPage(pokemonList);
      final isLastPage = pokemonList.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(pokemonList);
      } else {
        final nextPageKey = pageKey + pokemonList.length;
        _pagingController.appendPage(pokemonList, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _getAppBar(context),
      body: _getBody(context)
    );
  }
}

PreferredSizeWidget _getAppBar(BuildContext context){
  return AppBar(
    backgroundColor: Color.fromRGBO(16, 16, 16, 1),
    elevation: 0,
    title: Container(
      color: Color.fromRGBO(16, 16, 16, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.08,
            width: width * 0.08,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/appIcon/pokeball.png'),
              )
            )
          ),
          Text(
            'Pokemon List',
            style: TextStyle(fontSize: height * 0.025),
          )
        ],
      ),
    ),
  );
}

Widget _getBody(BuildContext context){
  var containerPadding = width * 0.05;
  return Container(
    color: Color.fromRGBO(30, 30, 30, 1),
    padding: EdgeInsets.fromLTRB(containerPadding, containerPadding, containerPadding, containerPadding),
    child: Container(
      color: Color.fromRGBO(30, 30, 30, 1),
      child: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Tuple2<Pokemon,Pokemon>>(
          itemBuilder: (context, pokemonPair, int) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height * 0.4, 
                width: width * 0.425,
                alignment: Alignment.center,
                child: Text(pokemonPair.item1.name, style: TextStyle(color: Colors.white)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Color.fromRGBO(30, 30, 30, 1), 
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  )
                ),
                margin: EdgeInsets.only(bottom: width * 0.05)
              ),
              Container(
                height: height * 0.4, 
                width: width * 0.425, 
                alignment: Alignment.center,
                child: Text(pokemonPair.item2.name, style: TextStyle(color: Colors.white)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Color.fromRGBO(30, 30, 30, 1), 
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  )
                ),
                margin: EdgeInsets.only(bottom: width * 0.05)
              ),
            ]
          ),
          ),
        ),
      ),
    );
}
