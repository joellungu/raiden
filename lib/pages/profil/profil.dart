import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'profil_controller.dart';
import 'profil_details.dart';

class Profile extends StatelessWidget {
  //
  var box = GetStorage();
  Map user = {};
  //
  @override
  Widget build(BuildContext context) {
    //
    Map us = jsonDecode(box.read("user"));
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: const Text(
          "Profil",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            //
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                //
                Get.to(ProfileDetails());
              },
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //trailing: Icon(Icons.person),
            ),
            ListTile(
              title: Text(
                "Vos points",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${us['data']['raiden_point']} Points",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            // ListTile(
            //   onTap: () {
            //     //
            //     //Get.to(Favorit());
            //   },
            //   title: const Text(
            //     "Favorits",
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   subtitle: const Text("Voir ses realisations"),
            //   //trailing: Icon(Icons.favorite),
            // ),
            ListTile(
              title: const Text(
                "Condition d'utilisations",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //subtitle: Text("À 5 min de vous"),
              //trailing: Icon(Icons.copyright),
            ),
            ListTile(
              title: const Text(
                "À propos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Mission & objectif"),
              //trailing: Icon(Icons.text_decrease),
            ),
            ListTile(
              title: const Text(
                "Se déconnecter",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //subtitle: Text("Quitter l'application"),
              trailing: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }

  //
}
