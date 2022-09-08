import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steg 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TIG 333 TODO"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: _todoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddItemsView()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _todoList() {
  var todoItems = [
    "Diska",
    "Städa",
    "Plugga",
    "Laga mat",
    "Arbeta",
    "Gå ut med hunden",
    "Spela boll",
    "Läsa tidningen",
    "Springa",
    "Dricka öl",
  ];

  var list = List.generate(todoItems.length, (index) => todoItems[index]);

  return ListView.builder(
    padding: const EdgeInsets.only(
      top: 20,
      bottom: kFloatingActionButtonMargin + 55,
    ),
    itemCount: todoItems.length,
    itemBuilder: (context, index) {
      return Column(
        children: <Widget>[
          _listItem(list[index]),
          const Divider(height: 20, thickness: 3),
        ],
      );
    },
  );
}

Widget _listItem(text) {
  return ListTile(
    leading: Checkbox(
      value: false,
      onChanged: (val) {},
    ),
    title: Text(
      text,
      style: const TextStyle(fontSize: 25),
    ),
    trailing: IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {},
    ),
  );
}

class AddItemsView extends StatelessWidget {
  const AddItemsView({Key? key}) : super(key: key);

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
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "What are you going to do?",
          labelStyle: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _addButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        const Text(
          "ADD",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
