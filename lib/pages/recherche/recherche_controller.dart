import 'dart:convert';

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
    Response response = await requete.postE(
      "",
      {"code_parcel": code},
    );
    //
    if (response.isOk) {
      //
      Map e = await response.body;
      print("resultat: $e");
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
          historiques.add(ee);
          //
          box.write("historiques", historiques);
          //
          Get.back();
          return true;
          //
        } else {
          //
          Get.back();
          return true;
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
    Response response = await requete.postE(
      "",
      {"code_parcel": code},
    );
    //
    if (response.isOk) {
      //
      Map e = await response.body;
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
