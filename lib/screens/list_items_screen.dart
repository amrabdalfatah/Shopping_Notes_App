import 'package:flutter/material.dart';
import 'package:shopping_notes_app/database/shopping_database.dart';
import 'package:shopping_notes_app/models/item_model.dart';
import 'package:shopping_notes_app/widgets/list_item_dialog.dart';
import '../models/list_model.dart';

class ListItems extends StatefulWidget {
  final Lists lists;

  const ListItems(this.lists, {Key? key}) : super(key: key);

  @override
  _ListItemsState createState() => _ListItemsState(this.lists);
}

class _ListItemsState extends State<ListItems> {
  ShoppingDatabase? shoppingDatabase;
  List<Items>? items;
  Lists lists;
  _ListItemsState(this.lists);

  Future showData(int idList) async {
    await shoppingDatabase?.openDB();
    items = await shoppingDatabase?.getItems(idList);
    setState(() {
      items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    ListItemDialog dialog = ListItemDialog();
    shoppingDatabase = ShoppingDatabase();
    showData(this.lists.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(lists.name),
      ),
      body: ListView.builder(
        itemCount: (items != null) ? items!.length : 0,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items![index].name),
            onDismissed: (direction) {
              String strName = items![index].name;
              shoppingDatabase?.deleteItem(items![index]);
              setState(() {
                items?.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(items![index].name),
              subtitle: Text(
                  'Quantity: ${items![index].quantity} - Note: ${items![index].note}'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        dialog.buildDialog(context, items![index], false),
                  );
                },
              ),
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
              Items(
                id: 0,
                idList: lists.id,
                name: '',
                quantity: '',
                note: '',
              ),
              true,
            ),
          );
        },
      ),
    );
  }
}
