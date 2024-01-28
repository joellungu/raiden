import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Requete extends GetConnect {
  String url = "http://10.0.2.2:8080/";
  static String urlSt = "http://10.0.2.2:8080/";
  //String url = "https://elitestudiodatabase.herokuapp.com/";
  //static String urlSt = "https://elitestudiodatabase.herokuapp.com/";
  Future<Response> getE(
    String path,
  ) async {
    return get("$url$path");
  }

//
  //
  Future<http.Response> postLogin(String path, var object) async {
    print("https://www.raidenexpresssolutions.com/public/api/v1/auth/login");
    return http.post(
        Uri.parse(
            "https://www.raidenexpresssolutions.com/public/api/v1/auth/login"),
        body: object);
  }

  Future<http.Response> postE(String path, var object) async {
    print("https://www.raidenexpresssolutions.com/public/api/v1/check-coli");
    /*
var url = Uri.https('example.com', 'whatsit/create');
var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    */
    return http.post(
        Uri.parse(
            "https://www.raidenexpresssolutions.com/public/api/v1/check-coli"),
        body: object);
  }

  //
  Future<Response> putE(String path, var object) async {
    return put("$url$path", object);
  }

  //
  Future<Response> postEE(String path, var object) async {
    return post("$url$path", object);
  }

  //
  Future<Response> deleteE(String path) async {
    return delete("$url$path");
  }
}
