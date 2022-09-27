import 'package:flutter/material.dart';
import './ItemView.dart';
import './model.dart';
import 'package:provider/provider.dart';

void main() {
  var state = MyState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: const TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steg 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
