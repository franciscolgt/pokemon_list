import '../models/ability.dart';

class AbilityMapper {

  Ability convertJsonToAbility(dynamic abilityJson, Ability ability) {
    abilityJson['effect_entries'].forEach((effectEntry) { 
      if(effectEntry['language']['name'].equals('en')){
        ability.effect = effectEntry['effect'];
      }
    });
    return ability;
  }
}