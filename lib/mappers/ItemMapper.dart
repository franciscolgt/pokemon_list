import '../models/item.dart';
import '../models/itemAttribute.dart';

class ItemMapper {

  Item convertJsonToItem(dynamic itemJson, Item item) {
    item.category = itemJson['category']['name'];
    itemJson['attributes'].forEach((itemAttribute) { 
        item.attributes.add(ItemAttribute(itemAttribute['name']));
    });
    return item;
  }
}