import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'creer_compte.dart';
import 'login_controller.dart';

class Login extends StatelessWidget {
  //
  final formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  /**
   * {
  "username":"Lupaka@gmail.com",
  "password":"Lupalupa"
}
   */
  RxBool vue = true.obs;

  LoginController loginController = Get.find();
  RxBool masquer = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Connexion",
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
                      "Connectez-vous pour voir vos points",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: username,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Veuilliez inserer votre email";
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
                          "username": username.text,
                          "password": password.text,
                        };
                        //Get.back();
                        loginController.login(e);
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
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      //
                      Get.to(CreerCompte());
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size(
                          double.maxFinite,
                          45,
                        ),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                      //backgroundColor:
                      //  MaterialStateProperty.all(Colors.red.shade900),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      child: const Text(
                        "Créer un compte",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              //)
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 70,
      //   alignment: Alignment.center,
      //   child: SvgPicture.asset(
      //     "assets/PhUserDuotone.svg",
      //     colorFilter: ColorFilter.mode(Langi.base2, BlendMode.srcIn),

      //     //semanticsLabel: e["titre"],
      //     height: 30,
      //     width: 30,
      //   ),
      // ),
      // RichText(
      //   textAlign: TextAlign.center,
      //   text: TextSpan(
      //     text: "Power by\n",
      //     style: const TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     children: [
      //       TextSpan(
      //         text: "SkyTechnologie",
      //         style: TextStyle(
      //           color: Colors.grey.shade700,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
