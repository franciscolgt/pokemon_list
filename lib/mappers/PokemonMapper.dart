import 'package:pokemon_list/models/pokemon.dart';

import '../models/ability.dart';
import '../models/form.dart';
import '../models/gameIndice.dart';
import '../models/item.dart';
import '../models/move.dart';
import '../models/pokemon.dart';
import '../models/stat.dart';

class PokemonMapper {
  List<String> convertJsonToPokemonListName(dynamic pokemonJsonList) {
    List<String> pokemonList = [];
    pokemonJsonList['results'].forEach((pokemon) {
      pokemonList.add(pokemon['name']);
    });
    return pokemonList;
  }

  Pokemon convertJsonToPokemon(dynamic pokemonJson) {
    String nameLowerCase = pokemonJson['name'];
    String name = nameLowerCase[0].toUpperCase() + nameLowerCase.substring(1);
    int experience = int.parse(pokemonJson['base_experience'].toString());
    int height = int.parse(pokemonJson['height'].toString());
    int weight = int.parse(pokemonJson['weight'].toString());
    String image =
        pokemonJson['sprites']['other']['official-artwork']['front_default'];

    List<Ability> abilitiesList = [];
    pokemonJson['abilities'].forEach((abilityJson) {
      abilitiesList.add(Ability(abilityJson['ability']['name']));
    });

    List<Form> formsList = [];
    pokemonJson['forms'].forEach((formJson) {
      formsList.add(Form(formJson['name']));
    });

    List<GameIndice> gameIndicesList = [];
    pokemonJson['game_indices'].forEach((gameIndiceJson) {
      gameIndicesList.add(GameIndice(gameIndiceJson['version']['name']));
    });

    List<Item> itemsList = [];
    pokemonJson['held_items'].forEach((itemJson) {
      itemsList.add(Item(itemJson['item']['name']));
    });

    List<Move> movesList = [];
    pokemonJson['moves'].forEach((moveJson) {
      movesList.add(Move(moveJson['move']['name']));
    });

    List<Stat> statsList = [];
    pokemonJson['stats'].forEach((statJson) {
      statsList.add(Stat(
          statJson['stat']['name'],
          int.parse(statJson['base_stat'].toString()),
          int.parse(statJson['effort'].toString())));
    });

    List<String> typesList = [];
    pokemonJson['types'].forEach((typeJson) {
      var typeName = typeJson['type']['name'];
      typesList.add(typeName);
    });

    return Pokemon(name, experience, height, weight, image, abilitiesList,
        formsList, gameIndicesList, itemsList, movesList, statsList, typesList);
  }
}
