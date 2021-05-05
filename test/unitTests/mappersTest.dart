import 'package:pokemon_list/mappers/PokemonMapper.dart';
import 'package:test/test.dart';
import 'dart:convert' as convert;

void main() {
  test('PokemonMapper should convert a json to a list of pokemons', () async {
    var pokemonList = await convert.jsonDecode(pokemonListJson());
    var pokemonListResult =
        PokemonMapper().convertJsonToPokemonListName(pokemonList);

    expect(pokemonListResult, ['bulbasaur', 'ivysaur', 'venusaur']);
  });

  test('PokemonMapper should convert a json to a Pokemon', () async {
    var pokemon = await convert.jsonDecode(pokemonJson());
    var pokemonResult = PokemonMapper().convertJsonToPokemon(pokemon);

    expect(pokemonResult.name, 'Rillaboom-gmax');
  });
}

dynamic pokemonListJson() {
  return '''
  {
    "count": 1118,
    "next": "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
    "previous": null,
    "results": [
      {
          "name": "bulbasaur",
          "url": "https://pokeapi.co/api/v2/pokemon/1/"
      },
      {
          "name": "ivysaur",
          "url": "https://pokeapi.co/api/v2/pokemon/2/"
      },
      {
          "name": "venusaur",
          "url": "https://pokeapi.co/api/v2/pokemon/3/"
      }
    ]
  }
  ''';
}

dynamic pokemonJson() {
  return '''
  {
    "abilities": [
        {
            "ability": {
                "name": "overgrow",
                "url": "https://pokeapi.co/api/v2/ability/65/"
            },
            "is_hidden": false,
            "slot": 1
        },
        {
            "ability": {
                "name": "grassy-surge",
                "url": "https://pokeapi.co/api/v2/ability/229/"
            },
            "is_hidden": true,
            "slot": 3
        }
    ],
    "base_experience": 265,
    "forms": [
        {
            "name": "rillaboom-gmax",
            "url": "https://pokeapi.co/api/v2/pokemon-form/10427/"
        }
    ],
    "game_indices": [],
    "height": 280,
    "held_items": [],
    "id": 10200,
    "is_default": false,
    "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/10200/encounters",
    "moves": [],
    "name": "rillaboom-gmax",
    "order": -1,
    "past_types": [],
    "sprites": {
        "other": {
            "official-artwork": {
                "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10200.png"
            }
        }
    },
    "stats": [
        {
            "base_stat": 100,
            "effort": 0,
            "stat": {
                "name": "hp",
                "url": "https://pokeapi.co/api/v2/stat/1/"
            }
        },
        {
            "base_stat": 125,
            "effort": 3,
            "stat": {
                "name": "attack",
                "url": "https://pokeapi.co/api/v2/stat/2/"
            }
        },
        {
            "base_stat": 90,
            "effort": 0,
            "stat": {
                "name": "defense",
                "url": "https://pokeapi.co/api/v2/stat/3/"
            }
        },
        {
            "base_stat": 60,
            "effort": 0,
            "stat": {
                "name": "special-attack",
                "url": "https://pokeapi.co/api/v2/stat/4/"
            }
        },
        {
            "base_stat": 70,
            "effort": 0,
            "stat": {
                "name": "special-defense",
                "url": "https://pokeapi.co/api/v2/stat/5/"
            }
        },
        {
            "base_stat": 85,
            "effort": 0,
            "stat": {
                "name": "speed",
                "url": "https://pokeapi.co/api/v2/stat/6/"
            }
        }
    ],
    "types": [
        {
            "slot": 1,
            "type": {
                "name": "grass",
                "url": "https://pokeapi.co/api/v2/type/12/"
            }
        }
    ],
    "weight": 10000
  }
  ''';
}
