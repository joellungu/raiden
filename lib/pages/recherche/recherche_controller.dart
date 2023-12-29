import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:followed/pages/produit.dart';
import 'package:followed/utils/requete.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../produit_item.dart';

class RechercheController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  Set resulats = Set();
  //
  List historiques = [];
  //
  getColisItemDetails(String code) async {
    //
    http.Response response = await requete.postE(
      "",
      {"code_parcel": code},
    );
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("erreur: ${response.statusCode}");
      print("erreur: ${response.body}");
      //
      Map e = await jsonDecode(response.body);
      print("resultat: $e");
      //
      if (!e["error"] && e['data'] != null) {
        //
        //resulats = box.read("resulats") ?? {};
        historiques = box.read("historiques") ?? [];
        historiques.forEach((element) {
          //
          resulats.add(element["id"]);
          //
        });
        //
        Map ee = e['data'];
        //
        if (resulats.add(ee['id'])) {
          //
          ee["is_item"] = e['is_item'];
          //
          if (ee["is_item"]) {
            //Si c'est un item alors...
            //
            //ee["raiden_point"] = e["raiden_point"];
            ee["id_item"] = code;
            ee["pacakge_info"] = e['pacakge_info'];
          }
          //
          ee["raiden_point"] = e["raiden_point"];
          print("raiden_point: ${e["raiden_point"]}");
          //
          historiques.add(ee);
          //
          //box.write("resulats", resulats);
          box.write("historiques", historiques);
          //
          Get.back();
          //
          if (ee["is_item"]) {
            //Get.back();
            Get.to(ProduitItem(ee));
          } else {
            //Get.back();
            Get.to(Produit(ee));
          }
          //
        } else {
          //
          Get.back();
          print("eee: $e");
          //
          if (e["is_item"]) {
            //Get.back();
            Get.to(ProduitItem(ee));
          } else {
            //Get.back();
            Get.to(Produit(ee));
          }
          //
        }
      } else {
        //
        Get.back();
        Get.snackbar(
          "erreur".tr,
          "${e["message"]}",
          backgroundColor: Colors.white,
        );
        //
        return false;
      }
      //
    } else {
      print("erreur: ${response.statusCode}");
      print("erreur: ${response.body}");
      //
      Get.back();
      Get.snackbar(
        "erreur".tr,
        "erreur_serveur",
        backgroundColor: Colors.white,
      );
      //
      return false;
    }
  }

  checkElement(String code, Map es, bool item, index) async {
    //
    print("resultat: $code");
    //
    http.Response response = await requete.postE(
      "",
      {"code_parcel": code},
    );
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      //
      Map e = await jsonDecode(response.body);
      print(e);
      //
      if (!e["error"] && e['data'] != null) {
        //
        resulats = box.read("resulats") ?? {};
        historiques = box.read("historiques") ?? [];
        //
        Map ee = e['data'];
        //
        if (resulats.add(ee['id'])) {
          //
          ee["is_item"] = e['is_item'];
          //
          if (ee["is_item"]) {
            //Si c'est un item alors...
            //
            ee["id_item"] = code;
            ee["pacakge_info"] = e['pacakge_info'];
          }
          //
          ee["raiden_point"] = e["raiden_point"];
          print("raiden_point: ${e["raiden_point"]}");
          //
          historiques.clear();
          historiques = box.read("historiques") ?? [];
          if (historiques.isNotEmpty) {
            historiques[index] = ee;
          } else {
            historiques.add(ee);
          }

          box.write("historiques", historiques);
          //
          if (item) {
            Get.back();
            Get.to(ProduitItem(ee));
          } else {
            Get.back();
            Get.to(Produit(ee));
          }
          //
        } else {
          //
          if (item) {
            Get.back();
            Get.to(ProduitItem(es));
          } else {
            Get.back();
            Get.to(Produit(es));
          }
          //
        }
      } else {
        //
        if (item) {
          Get.back();
          Get.to(ProduitItem(es));
        } else {
          Get.back();
          Get.to(Produit(es));
        }
        //
        //return false;
      }
      //
    } else {
      //
      if (item) {
        Get.back();
        Get.to(ProduitItem(es));
      } else {
        Get.back();
        Get.to(Produit(es));
      }
      //
      //return false;
    }
  }
}
