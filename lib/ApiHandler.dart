import 'package:http/http.dart' as http;
import 'dart:convert';

import './model.dart';

String _apiKey = 'c9e5ef4c-613b-4f4b-8221-b1a907145ad5';

class ApiConstants {
  static String _baseUrl = 'https://todoapp-api.apps.k8s.gu.se/';
  static String _getTodosEndpoint = 'todos?key=$_apiKey';
  static String _postEndpoint = 'todos?key=$_apiKey';
}

class ApiHandler {
  static Future<List<TodoItem>?> fetchItems() async {
    http.Response response = await http
        .get(Uri.parse(ApiConstants._baseUrl + ApiConstants._getTodosEndpoint));

    if (response.statusCode == 200) {
      return responseHandler(response);
    } else {
      throw Exception('Failed to load Item');
    }
  }

  static Future<List<TodoItem>?> postItem(TodoItem item) async {
    http.Response response = await http.post(
      Uri.parse(ApiConstants._baseUrl + ApiConstants._postEndpoint),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, dynamic>{
          'title': item.label,
          'done': item.isDone,
        },
      ),
    );

    if (response.statusCode == 200) {
      return responseHandler(response);
    } else {
      throw Exception('Failed to create TodoItem');
    }
  }

  static Future<List<TodoItem>?> updateItem(TodoItem item) async {
    http.Response response = await http.put(
      Uri.parse(ApiConstants._baseUrl + 'todos/${item.id}?key=$_apiKey'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, dynamic>{'title': item.label, 'done': !item.isDone},
      ),
    );
    if (response.statusCode == 200) {
      return responseHandler(response);
    } else {
      throw Exception('Failed to update TodoItem');
    }
  }

  static Future<List<TodoItem>?> deleteItem(TodoItem item) async {
    http.Response response = await http.delete(
      Uri.parse(ApiConstants._baseUrl + 'todos/${item.id}?key=$_apiKey'),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return responseHandler(response);
    } else {
      throw Exception('Failed to delete TodoItem');
    }
  }

  static List<TodoItem> responseHandler(var response) {
    var jsonData = jsonDecode(response.body);
    List<TodoItem> items = [];
    for (var item in jsonData) {
      TodoItem newItem = TodoItem.fromJson(item);
      items.add(newItem);
    }
    return items;
  }
}
