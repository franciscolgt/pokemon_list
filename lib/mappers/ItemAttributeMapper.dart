import '../models/itemAttribute.dart';

class ItemAttributeMapper {

  ItemAttribute convertJsonToItemAttribute(dynamic itemAttributeJson, ItemAttribute itemAttribute) {
    itemAttributeJson['effect_entries'].forEach((description) { 
      if(description['language']['name'].equals('en')){
        itemAttribute.description = description['description'];
      }
    });
    return itemAttribute;
  }
}