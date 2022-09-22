import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './AddItemsView.dart';
import './ItemsList.dart';
import './model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TIG 333 TODO"),
        actions: [
          Consumer<MyState>(
            builder: (context, state, child) => Row(
              children: [
                Text(
                  state.filterBy,
                  style: const TextStyle(fontSize: 18),
                ),
                _popupMenuButton(context),
              ],
            ),
          )
        ],
      ),
      body: Consumer<MyState>(builder: (context, state, child) {
        if (state.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.list.isEmpty) {
          return _textContainer();
        }
        return ItemsList(_filterList(state.list, state.filterBy));
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 42,
        ),
        onPressed: () async {
          var newItem = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddItemsView()));
          if (newItem != null) {
            Provider.of<MyState>(context, listen: false).addItem(newItem);
          }
        },
      ),
    );
  }

  List<TodoItem> _filterList(list, filterBy) {
    if (filterBy == 'all') {
      return list;
    }
    if (filterBy == 'done') {
      return list.where((item) => item.isDone == true).toList();
    }
    if (filterBy == 'undone') {
      return list.where((item) => item.isDone == false).toList();
    }
    return list;
  }

  Widget _popupMenuButton(context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) => Provider.of<MyState>(context, listen: false)
          .setFilterBy(value as String),
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'all', child: Text("All")),
        const PopupMenuItem(value: 'done', child: Text("Done")),
        const PopupMenuItem(value: 'undone', child: Text("Undone")),
      ],
    );
  }

  Widget _textContainer() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: const Center(
        child: Text(
          "Add something to do",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
