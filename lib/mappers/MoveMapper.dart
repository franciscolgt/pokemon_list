import '../models/move.dart';

class MoveMapper{

  Move convertJsonToMove(dynamic moveJson, Move move) {
    moveJson['effect_entries'].forEach((effectEntry) { 
      if(effectEntry['language']['name'].equals('en')){
        move.effect = effectEntry['effect'];
      }
    });
    return move;
  }
}