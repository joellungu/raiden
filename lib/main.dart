import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/accueil.dart';
import 'pages/historique/historique.dart';
import 'pages/login/login.dart';
import 'pages/login/login_controller.dart';
import 'pages/profil/profil_controller.dart';
import 'utils/traduction.dart';

//
RxBool choix = true.obs;

void main() async {
  await GetStorage.init();
  //
  LoginController loginController = Get.put(LoginController());
  //
  ProfilController profilController = Get.put(ProfilController());
  //
  runApp(Raiden());
}

class Raiden extends StatelessWidget {
  Raiden({super.key}) {
    var box = GetStorage();
    String langue = box.read("langue") ?? "fr";
    locale = langue == "fr" ? Locale('fr', 'FR') : Locale('en', 'US');
    //
  }
  var locale;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FolloWed',
      debugShowCheckedModeBanner: false,

      translations: Traduction(),
      locale: locale, // translations will be displayed in that locale
      fallbackLocale: const Locale('en', 'US'), //en_US
      //primarySwatch: white,

      theme: ThemeData(primarySwatch: Colors.blue),
      home:
          //Login()
          //Historique()
          Accueil(),
    );
  }
}
