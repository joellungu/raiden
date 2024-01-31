import 'dart:convert';
import 'package:followed/pages/profil/profil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:followed/pages/accueil.dart';
import 'package:followed/utils/requete.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //
  var box = GetStorage();
  //
  Requete requete = Requete();
  //
  Future<void> login(Map e) async {
    //pseudo,pwd,profil, etat

    //utilisateur/login/${e['pwd']}/${e['telephone']}
    http.Response rep = await requete.postLogin("", e);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("rep: ${rep.body}");
      Map e = jsonDecode(rep.body);

      print(rep.body);
      //
      box.write("user", rep.body);
      //
      Get.back();
      Get.to(Profile());
      //
    } else {
      print("rep: ${rep.statusCode}");
      print("rep: ${rep.body}");
      Get.back();
      Get.snackbar(
        "Error",
        "No account with this information",
        colorText: Colors.white,
        backgroundColor: Colors.red.shade900,
      );
    }
    //
  }
  //

  Future<void> creerCompte(Map e) async {
    //pseudo,pwd,profil, etat

    //utilisateur/login/${e['pwd']}/${e['telephone']}
    // var headers = {'Content-Type': 'application/json'};
    // var request = http.Request(
    //     'POST',
    //     Uri.parse(
    //         'https://www.raidenexpresssolutions.com/public/api/v1/signup'));
    // request.body = json.encode(e);
    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();
    print(e);
    //Uri.parse(
    Response response = await requete.post(
      "https://www.raidenexpresssolutions.com/public/api/v1/signup",
      headers: {'Content-Type': 'application/json'},
      e,
    );

    if (response.statusCode == 200) {
      Map rep = response.body;
      print(rep);
      Get.back();
      Get.back();
      Get.snackbar("Succes", "${rep['message']}");
    } else {
      Map rep = response.body ?? {"message": "Erreur"};
      Get.back();
      Get.snackbar("Erreur", "${rep['message']}");
      print(response.body);
    }

    // print("rep: ${rep.statusCode}");
    // print("rep: ${rep.body}");
    // Get.back();
    // Get.snackbar(
    //   "Error",
    //   "No account with this information",
    //   colorText: Colors.white,
    //   backgroundColor: Colors.red.shade900,
    // );

    //
  }
}
