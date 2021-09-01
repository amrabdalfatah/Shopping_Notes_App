import 'package:flutter/material.dart';
import 'list_items_screen.dart';
import '../models/list_model.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<Lists> listShopping = [
    Lists(
      id: 1,
      name: 'Fruits',
      priority: 3,
    ),
    Lists(
      id: 2,
      name: 'Vegetables',
      priority: 2,
    ),
    Lists(
      id: 3,
      name: 'Bread',
      priority: 5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Lists'),
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
