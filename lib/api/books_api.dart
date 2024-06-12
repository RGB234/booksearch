import 'dart:convert';

import 'package:booksearch/models/book_model.dart';
import 'package:http/http.dart' as http;

// abstract class Constants {
//   static const String k8sNodeIPaddress = String.fromEnvironment(
//     'K8SNODE_IP_ADDRESS',
//     defaultValue: 'localhost',
//   );
// }

class Books_Api {
  // CORS required!!!
  // https://medium.com/@su_bak/docker-compose-%EC%82%AC%EC%9A%A9%EC%8B%9C-%EC%84%9C%EB%A1%9C-%EB%8B%A4%EB%A5%B8-%EC%BB%A8%ED%85%8C%EC%9D%B4%EB%84%88%EA%B0%80-%ED%86%B5%EC%8B%A0%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95-158318d7a39
  static const String baseUrl =
      //
      // k8s Service : ooksearch\k8s_yaml\my-service.yml
      // ${minikube ip}:{nodePort}
      "http://192.168.59.105:30300";
  // "http://backend.book-search.default.svc.cluster.local:30300";
  // "http://${Constants.k8sNodeIPaddress}:30300";

  // when the server is hosted by cloudtype
  // "https://port-0-book-api-3zspi2nlgabdoxu.sel3.cloudtype.app";

  // refer to the computer which is running the Android simulator
  // "http://10.0.2.2:3000";

  // localhost
  // "http://127.0.0.1:3000";

  static Future<List<BookModel>> getSearchResults(String keyword) async {
    List<BookModel> bookInstances = [];
    final url = Uri.parse('$baseUrl/$keyword');
    final res = await http.get(url);

    print(url);

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
