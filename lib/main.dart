import 'package:flutter/material.dart';
import 'package:shopping_notes_app/screens/shopping_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Notes App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ShoppingListScreen(),
    );
  }
}
