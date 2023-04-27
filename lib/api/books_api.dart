import 'dart:convert';

import 'package:booksearch/models/book_model.dart';
import 'package:http/http.dart' as http;

class Books_Api {
  // CORS required!!!
  static const String baseUrl =
      "https://port-0-book-api-3zspi2nlgabdoxu.sel3.cloudtype.app";

  static Future<List<BookModel>> getSearchResults(String keyword) async {
    List<BookModel> bookInstances = [];
    final url = Uri.parse('$baseUrl/$keyword');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      // jsonDecode : String type 'body' -> json
      final books = jsonDecode(res.body);
      // response.body -> List<BookModel> ->List<Map<String, dynamic>>
      for (var book in books) {
        //data fetching
        final instance = BookModel.fromJson(book);
        bookInstances.add(instance);
      }
      return bookInstances;
    }
    throw Error();
  }
}
