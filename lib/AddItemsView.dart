import 'package:flutter/material.dart';
import '/model.dart';

class AddItemsView extends StatefulWidget {
  const AddItemsView({super.key});

  @override
  State<AddItemsView> createState() {
    return AddItemsViewState();
  }
}

class AddItemsViewState extends State<AddItemsView> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TIG333 TODO"),
      ),
      body: Column(
        children: [
          _todoInputField(),
          Container(height: 24),
          _addButton(),
        ],
      ),
    );
  }

  Widget _todoInputField() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: TextField(
        controller: myController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "What are you going to do?",
          labelStyle: TextStyle(fontSize: 22),
          isDense: true,
        ),
      ),
    );
  }

  Widget _addButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text(
            "ADD",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pop(
                context, TodoItem(label: myController.text, isDone: false));
          },
        ),
      ],
    );
  }
}
