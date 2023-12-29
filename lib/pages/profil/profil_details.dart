import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'profil_controller.dart';

class ProfileDetails extends StatelessWidget {
  //
  ProfilController profilController = Get.find();
  //
  var box = GetStorage();
  Map user = {};
  ProfileDetails() {
    //
    Map us = jsonDecode(box.read("user"));
    print("us: $us");
    print("us: ${us.runtimeType}");
    user = us["data"] ?? {};
    print(user);
  }
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
              //fontSize: 30,
              color: Colors.white),
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
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ListTile(

            //   title: Text(
            //     "Profile",
            //     style: TextStyle(
            //
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   //trailing: Icon(Icons.person),
            // ),
            // ListTile(
            //   onTap: () {
            //     //
            //   },
            //   title: const Text(
            //     "Nom",
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   subtitle: Text(
            //     "${user['name']}",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.blue,
            //     ),
            //   ),
            //   trailing: const Icon(Icons.edit),
            // ),
            ListTile(
              onTap: () {
                //
              },
              title: const Text(
                "Nom",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${user['first_name']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              //trailing: const Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
              },
              title: const Text(
                "Nom",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${user['last_name']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              //trailing: const Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
              },
              title: const Text(
                "Genre",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${user['gender']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              //trailing: const Icon(Icons.edit),
            ),
            // ListTile(
            //   onTap: () {
            //     //
            //   },
            //   title: const Text(
            //     "Age",
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   subtitle: Text(
            //     "18 à 30 ans",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.blue,
            //     ),
            //   ),
            //   trailing: const Icon(Icons.edit),
            // ),
            ListTile(
              onTap: () {
                //
              },
              title: const Text(
                "Téléphone",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${user['phone_number']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              //trailing: const Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
              },
              title: const Text(
                "Email",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${user['email']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              //trailing: const Icon(Icons.edit),
            ),
            ListTile(
              onTap: () {
                //
                TextEditingController text = TextEditingController();
                //
                modifierInfo(user, context, text, 'Mot de passe');
              },
              title: const Text(
                "Mot de passe",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "**************",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              trailing: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }

  //
  modifierInfo(
    Map e,
    BuildContext context,
    TextEditingController text,
    String nom,
  ) async {
    print("es: $e");
    text.text = "";
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("${nom.capitalize}"),
          contentPadding: const EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 250,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        //prefixIcon: const Icon(Icons.person),
                        hintText: '*************'.tr,
                        labelText: 'Mot de passe'.tr,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez saisir le nouveau mot de passe'.tr;
                        }
                        if (value.length < 8) {
                          return 'Nombre de charactère inferieur à 8'.tr;
                        }

                        return null;
                      },
                      onChanged: (value) {
                        //print("Password value $value");
                      },
                    ),
                    InkWell(
                      onTap: () {
                        //e[nom] = text.text;
                        Get.dialog(
                          const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        Map us = {"password": text.text};
                        profilController.putDataAgent(us, e['token']);
                        //Mise ) jour ici...
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 2,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 2,
                          ),
                          child: Text(
                            "Enregistrer".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade900,
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                            // ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
