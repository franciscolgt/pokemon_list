import 'ability.dart';
import 'form.dart';
import 'gameIndice.dart';
import 'item.dart';
import 'move.dart';
import 'stat.dart';

class Pokemon{
  String name;
  int experience;
  int height;
  int weight;
  String image;
  List<Ability> abilities;
  List<Form> forms;
  List<GameIndice> gameIndices;
  List<Item> items;
  List<Move> moves;
  List<Stat> stats;
  List<String> types;

  Pokemon(this.name, this.experience, this.height, this.weight, this.image, 
          this.abilities, this.forms, this.gameIndices, this.items, this.moves, this.stats, this.types);
}