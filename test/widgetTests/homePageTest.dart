import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_list/main.dart';

void main() {
  testWidgets('My Home Page has a AppBar and a PagedListView of pokemons',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();
    expect(find.byType(AppBar), findsOneWidget);
  });
}
