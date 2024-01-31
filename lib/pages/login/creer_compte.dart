import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class CreerCompte extends StatelessWidget {
  //
  final formKey = GlobalKey<FormState>();
  final noms = TextEditingController();
  final postnom = TextEditingController();
  final prenom = TextEditingController();
  final email = TextEditingController();
  final telephone = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  //
  RxBool vue = true.obs;
  RxInt sexe = 0.obs;

  LoginController loginController = Get.find();
  RxBool masquer = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            //
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Creer compte",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/raiden.png",
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Créez un compte pour plus d'avantage",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: noms,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Nom";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Nom",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: postnom,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Veuilliez inserer Postnom";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Postnom",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: prenom,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Prenom";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Prenom",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 48,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade500, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton(
                                onChanged: (e) {
                                  sexe.value = e as int;
                                },
                                value: sexe.value,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Femme"),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Homme"),
                                    value: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: telephone,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Veuilliez votre téléphone";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.phone_android),
                      hintText: "Téléphone",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Veuilliez votre email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: const Icon(Icons.email_rounded),
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => TextFormField(
                      controller: password,
                      obscureText: masquer.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Please put your password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Obx(
                          () => IconButton(
                            icon: vue.value
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.remove_red_eye),
                            onPressed: () {
                              //
                              masquer.value = !masquer.value;
                            },
                          ),
                        ),
                        hintText: "Password",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //Get.off(Accueil());

                        Get.dialog(Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        ));

                        // Timer(Duration(seconds: 3), () {
                        //   Get.back();
                        //   Get.off(Accueil());
                        // });
                        Map e = {
                          "first_name": noms.text,
                          "middle_name": postnom.text,
                          "last_name": prenom.text,
                          "phone_number": telephone.text,
                          "email": email.text,
                          "gender": ["F", "M"][sexe.value],
                          "password": password.text,
                        };
                        /**
                         * {
  "first_name": "Hobed",
  "middle_name": "Mwadi",
  "last_name": "Mwadi",
  "phone_number": "0825135297",
  "email": "Lupaka@gmail.com",
  "gender": "F",
  "password": "Lupalupa"
}
                         */
                        //
                        // Map es = {
                        //   "username": username.text,
                        //   "password": password.text,
                        // };
                        //Get.back();
                        loginController.creerCompte(e);
                        //Get.to(Cours());
                        //loginController.deja.value = true;
                      }
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        const Size(
                          double.maxFinite,
                          45,
                        ),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      child: const Text(
                        "Enregistrer",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              //)
            ),
          ),
        ),
      ),
    );
  }
}
