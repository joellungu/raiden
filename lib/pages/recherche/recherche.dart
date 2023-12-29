import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:followed/main.dart';
import 'package:followed/pages/recherche/recherche_controller.dart';
import 'package:get/get.dart';

class Recherche extends StatelessWidget {
  //
  // bool choix;
  // Recherche(this.choix);
  //
  RechercheController rechercheController = Get.find();
  //
  TextEditingController code = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.amber,
                color: Colors.blue.shade200,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    50,
                  ),
                  bottomRight: Radius.circular(
                    50,
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "Suivez vos colis partout dans le monde\n",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        // style: GoogleFonts.lato(
                        //   color: Colors.black,
                        //   fontSize: 35,
                        //   fontWeight: FontWeight.bold,
                        // ),
                        children: [
                          TextSpan(
                            text: "Votre meilleur partenaire",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                            // style: GoogleFonts.roboto(
                            //   color: Colors.black,
                            //   fontSize: 30,
                            //   fontWeight: FontWeight.w500,
                            // ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //color: Colors.amber.shade300,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: SvgPicture.asset(
                              "assets/IcBaselineDirectionsBoatFilled.svg",
                              color: Colors.black,
                              width: 50,
                              height: 50,
                              semanticsLabel: 'Acme Logo'),
                          // child: Icon(
                          //   Icons.abc,
                          //   size: 30,
                          //   color: Colors.black,
                          // ),
                        ),
                        const SizedBox(
                          width: 10,
                          //child: Icons(Icons.search),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //color: Colors.amber.shade300,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: SvgPicture.asset(
                              "assets/IcBaselineLocalShipping.svg",
                              color: Colors.black,
                              width: 50,
                              height: 50,
                              semanticsLabel: 'Acme Logo'),
                          // child: Icon(
                          //   Icons.abc,
                          //   size: 30,
                          //   color: Colors.black,
                          // ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //color: Colors.amber.shade300,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: SvgPicture.asset(
                              "assets/PhAirplaneTakeoffFill.svg",
                              color: Colors.black,
                              semanticsLabel: 'Acme Logo'),
                          // child: Icon(
                          //   Icons.airplanemode_on,
                          //   size: 30,
                          //   color: Colors.black,
                          // ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: code,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 40,
                            ),
                            prefixText: 'Code',
                            prefixStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            //
                            Get.dialog(
                              const Center(
                                child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                            //
                            await rechercheController
                                .getColisItemDetails(code.text);

                            //
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            height: 50,
                            child: Text(
                              "recherche".tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
