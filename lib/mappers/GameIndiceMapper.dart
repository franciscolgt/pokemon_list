import '../models/gameIndice.dart';

class GameIndiceMapper{

  GameIndice convertJsonToGameIndice(dynamic gameIndiceJson, GameIndice gameIndice) {
    gameIndiceJson['move_learn_methods'].forEach((moveLearnMethod) { 
      gameIndice.moveLearnMethods.add(moveLearnMethod['name']);
    });
    gameIndiceJson['podekexes'].forEach((pokedex) { 
      gameIndice.pokedexList.add(pokedex['name']);
    });
    return gameIndice;
  }
}