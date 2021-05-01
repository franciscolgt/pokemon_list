import 'itemAttribute.dart';

class Item{
  int id;
  String name;
  String category;
  String effect;
  List<ItemAttribute> attributes;

  Item(this.id, this.name);
}