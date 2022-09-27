import 'package:flutter/material.dart';
import './ApiHandler.dart';

class TodoItem {
  String label;
  bool isDone;
  String? id;

  TodoItem({required this.label, required this.isDone, this.id});

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json["id"] ?? "",
      label: json["title"] ?? "",
      isDone: json["done"],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  String _filterBy = 'all';
  bool _loading = false;

  List<TodoItem> get list => _list;
  String get filterBy => _filterBy;
  bool get loading => _loading;

  MyState() {
    fetchItems();
  }

  void addItem(TodoItem item) async {
    _loading = true;
    notifyListeners();
    _list = (await ApiHandler.postItem(item))!;
    _loading = false;
    notifyListeners();
  }

  void removeItem(TodoItem item) async {
    _loading = true;
    notifyListeners();
    _list = (await ApiHandler.deleteItem(item))!;
    _loading = false;
    notifyListeners();
  }

  void setIsDone(TodoItem item) async {
    _list = (await ApiHandler.updateItem(item))!;
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  void fetchItems() async {
    _loading = true;
    notifyListeners();

    _list = (await ApiHandler.fetchItems())!;
    _loading = false;
    notifyListeners();
  }
}
