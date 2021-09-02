import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../database/shopping_database.dart';

class ListItemDialog {
  final textName = TextEditingController();
  final textQuantity = TextEditingController();
  final textNote = TextEditingController();

  Widget buildDialog(BuildContext context, Items items, bool isNew) {
    ShoppingDatabase shoppingDatabase = ShoppingDatabase();
    if (!isNew) {
      textName.text = items.name;
      textQuantity.text = items.quantity;
      textNote.text = items.note;
    }
    return AlertDialog(
      title: Text(isNew ? 'New Item' : 'Edit Item'),
      content: Column(
        children: [
          TextField(
            controller: textName,
            decoration: InputDecoration(
              hintText: 'Item Name',
            ),
          ),
          TextField(
            controller: textQuantity,
            decoration: InputDecoration(
              hintText: 'Quantity',
            ),
          ),
          TextField(
            controller: textNote,
            decoration: InputDecoration(
              hintText: 'Note',
            ),
          ),
          TextButton(
            child: Text(
              'Save Item',
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: () {
              items.name = textName.text;
              items.quantity = textQuantity.text;
              items.note = textNote.text;
              shoppingDatabase.insertItem(items);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
