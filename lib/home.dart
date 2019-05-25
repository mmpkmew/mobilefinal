import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }
}

class API2 {
  static Future getUsers() {
    var url = baseUrl + "/todos?user={{id}}";
    return http.get(url);
  }
}