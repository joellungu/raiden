import 'package:get/get.dart';

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
  Future<Response> postE(String path, var object) async {
    print("https://www.raidenexpresssolutions.com/public/api/v1/check-coli");
    return post(
        "https://www.raidenexpresssolutions.com/public/api/v1/check-coli",
        object);
  }

  //
  Future<Response> putE(String path, var object) async {
    return put("$url$path", object);
  }

  //
  Future<Response> deleteE(String path) async {
    return delete("$url$path");
  }
}
