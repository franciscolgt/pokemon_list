import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PokeApiRepository{
  String url = "pokeapi.co";

  // Method to fetch the pokemons list with an offset and a size limit
  Future<Map<String, dynamic>> fetchPokemonList(int limit, int offset) async {
    String path = 'api/v2/pokemon';
    var queryParameters = {
      'limit': limit.toString(),
      'offset': offset.toString(),
    };
    var uri = Uri.https(url, path, queryParameters);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Pokemon list request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Method to fetch the detailed info of a pokemon through his id
  Future<Map<String, dynamic>> fetchPokemonById(int pokemonId) async {
    String path = 'api/v2/pokemon/' + pokemonId.toString();
    var uri = Uri.https(url, path);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Pokemon request by id failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Method to fetch the detailed info of a pokemon through his name
  Future<Map<String, dynamic>> fetchPokemonByName(String pokemonName) async {
    String path = 'api/v2/pokemon/' + pokemonName;
    var uri = Uri.https(url, path);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Pokemon request by name failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Method to fetch the detailed info of an ability
  Future<Map<String, dynamic>> fetchPokemonAbility(String abilityName) async {
    String path = 'api/v2/ability/' + abilityName;
    var uri = Uri.https(url, path);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Ability request by name failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Method to fetch the detailed info of a form
  Future<Map<String, dynamic>> fetchPokemonForm(String formName) async {
    String path = 'api/v2/pokemon-form/' + formName;
    var uri = Uri.https(url, path);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Form request by name failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Method to fetch the detailed info of a game indice version
  Future<Map<String, dynamic>> fetchPokemonGameIndiceVersion(String versionName) async {
    String path = 'api/v2/version/' + versionName;
    var uri = Uri.https(url, path);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var versionGroupName = await jsonResponse['version_group']['name'];
      var versionGroupJsonResponse = fetchPokemonGameIndiceVersionGroup(versionGroupName.toString());
      return versionGroupJsonResponse;
    } else {
      print('Game Indice version request by name failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Method to fetch the detailed info of a game indice group version
  Future<Map<String, dynamic>> fetchPokemonGameIndiceVersionGroup(String versionGroupName) async {
    String path = 'api/v2/version-group/' + versionGroupName;
    var uri = Uri.https(url, path);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Game Indice group version request by name failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Method to fetch the detailed info of an item
  Future<Map<String, dynamic>> fetchPokemonItem(String itemName) async {
    String path = 'api/v2/item/' + itemName;
    var uri = Uri.https(url, path);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Item request by name failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Method to fetch the detailed info of an item attribute
  Future<Map<String, dynamic>> fetchPokemonItemAttribute(String itemAttributeName) async {
    String path = 'api/v2/item-attribute/' + itemAttributeName;
    var uri = Uri.https(url, path);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Item attribute request by name failed with status: ${response.statusCode}.');
      return null;
    }
  }

  // Method to fetch the detailed info of a move
  Future<Map<String, dynamic>> fetchPokemonMove(String moveName) async {
    String path = 'api/v2/move/' + moveName;
    var uri = Uri.https(url, path);

    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Move request by name failed with status: ${response.statusCode}.');
      return null;
    }
  }
}