import 'package:flutter/material.dart';
import 'list_items_screen.dart';
import '../models/list_model.dart';
import '../database/shopping_database.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  @override
  Widget build(BuildContext context) {
    ShoppingDatabase shoppingDatabase = ShoppingDatabase();
    shoppingDatabase.openDB();
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Notes Lists'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: listShopping.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text('${listShopping[index].priority}'),
              radius: 20,
            ),
            title: Text(listShopping[index].name),
            trailing: IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.purple,
              ),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ListItems();
                }),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
