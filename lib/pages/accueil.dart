import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:followed/main.dart';
import 'package:followed/pages/login/login.dart';
import 'package:followed/pages/recherche/recherche.dart';
import 'package:followed/pages/recherche/recherche_controller.dart';
import 'package:get/get.dart';
import 'historique/historique.dart';
import 'points/point_detail.dart';
import 'profil/profil.dart';
//import 'package:google_fonts/google_fonts.dart';

class Accueil extends StatelessWidget {
  //
  RechercheController rechercheController = Get.put(RechercheController());
  //
  Rx<Widget> vue = Rx(Recherche());
  //
  RxInt currentIndex = 0.obs;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 100,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 150,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                      "assets/monde.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Obx(() => vue.value),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Card(
          //       elevation: 1,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //       child: Container(
          //         height: 55,
          //         width: 120,
          //         decoration: BoxDecoration(
          //           color: Colors.grey.shade100,
          //           borderRadius: BorderRadius.circular(30),
          //         ),
          //         child: Stack(
          //           children: [
          //             Obx(
          //               () => AnimatedAlign(
          //                 duration: const Duration(milliseconds: 200),
          //                 alignment: choix.value
          //                     ? Alignment.centerLeft
          //                     : Alignment.centerRight,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(0),
          //                   child: Container(
          //                     height: 50,
          //                     width: 60,
          //                     alignment: Alignment.center,
          //                     decoration: BoxDecoration(
          //                       color: Colors.blue.shade900,
          //                       //color: Colors.amber.shade400,
          //                       borderRadius: BorderRadius.circular(25),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Align(
          //               alignment: Alignment.center,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                 children: [
          //                   InkWell(
          //                     onTap: () {
          //                       //
          //                       choix.value = true;
          //                     },
          //                     child: Obx(
          //                       () => Container(
          //                         height: 50,
          //                         width: 50,
          //                         alignment: Alignment.center,
          //                         decoration: BoxDecoration(
          //                           //color: Colors.amber.shade400,
          //                           borderRadius: BorderRadius.circular(25),
          //                         ),
          //                         child: SvgPicture.asset(
          //                             "assets/IcRoundSearch.svg",
          //                             color: choix.value
          //                                 ? Colors.white
          //                                 : Colors.black,
          //                             semanticsLabel: 'Acme Logo'),
          //                         // child: Icon(
          //                         //   Icons.abc,
          //                         //   size: 30,
          //                         //   color: Colors.black,
          //                         // ),
          //                       ),
          //                     ),
          //                   ),
          //                   InkWell(
          //                     onTap: () {
          //                       //
          //                       choix.value = false;
          //                     },
          //                     child: Obx(
          //                       () => Container(
          //                         height: 50,
          //                         width: 50,
          //                         alignment: Alignment.center,
          //                         decoration: BoxDecoration(
          //                           //color: Colors.grey,
          //                           borderRadius: BorderRadius.circular(25),
          //                         ),
          //                         child: SvgPicture.asset(
          //                           "assets/IcBaselineLocalShipping.svg",
          //                           color: choix.value
          //                               ? Colors.black
          //                               : Colors.white,
          //                           semanticsLabel: 'Acme Logo',
          //                         ),
          //                         // child: Icon(
          //                         //   Icons.abc,
          //                         //   size: 30,
          //                         //   color: Colors.black,
          //                         // ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (e) {
            currentIndex.value = e;
            //
            if (e == 0) {
              vue.value = Recherche();
            } else if (e == 1) {
              vue.value = Historique();
              // } else if (e == 2) {
              //   vue.value = PointDetails();
            } else {
              vue.value = Login();
            }
          },
          currentIndex: currentIndex.value,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.shade400,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Recherche"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "Historique"),
            //BottomNavigationBarItem(
            //  icon: Icon(Icons.category), label: "Points"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          ],
        ),
      ),
    );
  }
}
