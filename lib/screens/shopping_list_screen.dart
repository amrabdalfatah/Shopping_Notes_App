import 'package:flutter/material.dart';
import 'list_items_screen.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Lists'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text('1'),
              radius: 40,
            ),
            title: Text('Fruit'),
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
    );
  }
}
