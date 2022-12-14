import 'package:flutter/material.dart';
import 'package:template/AddItemsView.dart';

import './model.dart';
import 'package:provider/provider.dart';

class ItemsList extends StatelessWidget {
  final List<TodoItem> list;

  ItemsList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        top: 20,
        bottom: kFloatingActionButtonMargin + 55,
      ),
      children: list.map((item) => _listItem(context, item)).toList(),
    );
  }

  Widget _listItem(context, TodoItem item) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: item.isDone,
            onChanged: (value) {
              Provider.of<MyState>(context, listen: false).setIsDone(item);
            },
          ),
          title: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddItemsView())),
            child: Text(
              item.label,
              style: item.isDone
                  ? const TextStyle(
                      fontSize: 25, decoration: TextDecoration.lineThrough)
                  : const TextStyle(fontSize: 25),
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Provider.of<MyState>(context, listen: false).removeItem(item);
            },
          ),
        ),
        const Divider(height: 20, thickness: 3),
      ],
    );
  }
}
