import 'dart:convert';

import 'package:followed/utils/requete.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfilController extends GetxController {
  //
  Requete requete = Requete();
  //
  putDataAgent(Map us, String token) async {
    //
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    //https://www.raidenexpresssolutions.com/public/api/v1/
    //Bearer 1|qLmLFboCFBCLO9RCrscyJuEYD4VNwxs4Tvg2vieV
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.raidenexpresssolutions.com/public/api/v1/user/update-password'));
    request.body = json.encode(us);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.back();
      Get.snackbar("Succès", "Mot de passe mise à jour avec succès");
    } else {
      print(response.reasonPhrase);
      Get.back();
      Get.snackbar("Oups", "Un problème est survenu lors de la mise à jour");
    }
  }
}
