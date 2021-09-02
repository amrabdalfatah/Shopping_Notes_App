import 'package:flutter/material.dart';
import 'widgets/shopping_list_dialog.dart';
import 'screens/list_items_screen.dart';
import '../models/list_model.dart';
import '../database/shopping_database.dart';
import '../widgets/shopping_list_dialog.dart';

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

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<Lists>? shoppingList;
  ShoppingDatabase shoppingDatabase = ShoppingDatabase();
  late ShoppingListDialog dialog;

  @override
  void initState() {
    dialog = ShoppingListDialog();
    super.initState();
  }

  Future showData() async {
    await shoppingDatabase.openDB();
    shoppingList = await shoppingDatabase.getLists();
    setState(() {
      shoppingList = shoppingList;
    });
  }

  @override
  Widget build(BuildContext context) {
    ShoppingListDialog dialog = ShoppingListDialog();
    showData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Notes Lists'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: shoppingList == null ? 0 : shoppingList?.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(shoppingList![index].name),
            onDismissed: (direction) {
              String strName = shoppingList![index].name;
              shoppingDatabase.deleteList(shoppingList![index]);
              setState(() {
                shoppingList?.removeAt(index);
              });
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text('${shoppingList![index].priority}'),
                radius: 20,
              ),
              title: Text(shoppingList![index].name),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.purple,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => dialog.buildDialog(
                      context,
                      shoppingList![index],
                      false,
                    ),
                  );
                },
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ListItems(shoppingList![index]);
                  }),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => dialog.buildDialog(
              context,
              Lists(id: 0, name: '', priority: 0),
              true,
            ),
          );
        },
      ),
    );
  }
}
