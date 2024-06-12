*****************************************요약*********************************************
nodePort(my-service.yml) 를 통해서 frontend Pod 와 backend Pod는 모두 외부로 노출이 되며 
frontend 는 http://192.168.59.105:30000
backend 는 http://192.168.59.105:30300 로 접근가능합니다. 

192.168.59.105 주소는 제 ${minikube ip}로, 하드코딩 된 것입니다
따라서 제 minikube 환경이 아닌 곳에서 실행한다면 backend는 정상작동하겠지만, 
하드코딩된 frontend는 실행은 되지만 의도대로 동작하지 않습니다 .

frontend Pod 에서 실행되는 flutter 앱 내부에서 http://192.168.59.105:30300 로 http 요청을 하여
backend Pod 로부터 json 형식의 static resource 를 받아 사용합니다.
참고로
backend Pod 가 사용하는 book_api 이미지의 소스코드가 있는 book_api 폴더 내의 main.js을 보시면
아시겠지만, 단순히 naver OpenApi를 사용하는 것이 backend Pod라고 보시면 됩니다.

******************************************************************************************

frontend 의 flutter 앱이 http 요청을 하는 소스코드(booksearch/lib/api/books_api.dart) 는 다음과 같습니다

import 'package:http/http.dart' as http;

class Books_Api {
  static const String baseUrl =
      "http://192.168.59.105:30300"; // ${minikube ip}:{nodePort}

  static Future<List<BookModel>> getSearchResults(String keyword) async {
    List<BookModel> bookInstances = [];
    final url = Uri.parse('$baseUrl/$keyword'); // url 에 keyword(검색어)를 포함하여 http 요청을 보냄
    final res = await http.get(url);



