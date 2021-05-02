import '../models/form.dart';

class FormMapper{

  Form convertJsonToForm(dynamic formJson, Form form) {
    form.formImage = formJson['sprites']['front_default'];
    return form;
  }
}