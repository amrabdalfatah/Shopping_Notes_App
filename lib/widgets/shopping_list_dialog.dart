import 'package:flutter/material.dart';
import '../models/list_model.dart';
import '../database/shopping_database.dart';

class ShoppingListDialog {
  final textName = TextEditingController();
  final textPriority = TextEditingController();

  Widget buildDialog(BuildContext context, Lists list, bool isNew) {
    ShoppingDatabase shoppingDatabase = ShoppingDatabase();
    if (!isNew) {
      textName.text = list.name;
      textPriority.text = list.priority.toString();
    }
    return AlertDialog(
      title: Text(isNew ? 'New Shopping List' : 'Edit Shopping List'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: textName,
              decoration: InputDecoration(
                hintText: 'List Name',
              ),
            ),
            TextField(
              controller: textPriority,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Priority',
              ),
            ),
            TextButton(
              child: Text(
                'Save Shopping List',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                list.name = textName.text;
                list.priority = int.parse(textPriority.text);
                shoppingDatabase.insertList(list);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
