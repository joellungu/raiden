import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:followed/pages/produit.dart';
import 'package:followed/pages/produit_item.dart';
import 'package:followed/pages/recherche/recherche_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Historique extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Historique();
  }
}

class _Historique extends State<Historique> {
  //
  var box = GetStorage();
  //
  RechercheController rechercheController = Get.find();
  //
  List historiques = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    historiques = box.read("historiques") ?? [];
    print("data: ${historiques}");
  }

  //
  RxDouble vis = 1.0.obs;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Raiden",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: List.generate(historiques.length, (index) {
          //
          Map e = historiques[index];
          print("resultat: ${e['is_item']}");
          //
          if (!e["is_item"]) {
            //
            List exp = jsonDecode(e['receives']);
            // print("--------------------------------");

            // print(exp[0].runtimeType);
            // print(jsonDecode(e['receives']));
            // print(jsonDecode(e['receives']).runtimeType);
            // print(jsonDecode(e['receives'])[0].runtimeType);
            // print(
            //     jsonDecode(jsonDecode(e['receives'])[0])["fullname"]);
            DateTime created_at = DateTime.parse(e['created_at']);
            print(created_at);
            DateTime arrival_date = DateTime.parse(e['arrival_date']);
            print(arrival_date);
            //
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () async {
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if (connectivityResult == ConnectivityResult.mobile ||
                      connectivityResult == ConnectivityResult.bluetooth ||
                      connectivityResult == ConnectivityResult.wifi) {
                    // I am connected to a mobile network.
                    Get.dialog(
                      const Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                    rechercheController.checkElement(
                        "${e['parcel_code']}", e, false, index);
                    //Get.to(Produit(e));
                    //
                  } else {
                    //
                    if (e["is_item"]) {
                      Get.to(ProduitItem(e));
                    } else {
                      Get.to(Produit(e));
                    }
                  }
                },
                child: Container(
                  height: 160,
                  width: 200,
                  decoration: BoxDecoration(
                    //color: Colors.amber,
                    //color: Colors.blue.shade700.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                        "assets/carton.png",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${e['name_package']}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 150,
                              width: 270,
                              decoration: BoxDecoration(
                                //color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Pays des. ",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${e['destination']}",
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Expediteur ",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        jsonDecode("${e['sender']}")['names'],
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                      // Container(
                                      //   height: 50,
                                      //   width: 50,
                                      //   alignment: Alignment.center,
                                      //   decoration: BoxDecoration(
                                      //     //color: Colors.amber.shade300,
                                      //     borderRadius:
                                      //         BorderRadius.circular(25),
                                      //   ),
                                      //   child: SvgPicture.asset(
                                      //       "assets/paris.svg",
                                      //       color: Colors.black,
                                      //       width: 50,
                                      //       height: 50,
                                      //       semanticsLabel:
                                      //           'Acme Logo'),
                                      //   // child: Icon(
                                      //   //   Icons.abc,
                                      //   //   size: 30,
                                      //   //   color: Colors.black,
                                      //   // ),
                                      // ),
                                      // Text(
                                      //   "",
                                      //   style: TextStyle(
                                      //     fontSize: 30,
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Destinateur ",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        jsonDecode(jsonDecode(
                                            e['receives'])[0])["fullname"],
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                      // Container(
                                      //   height: 50,
                                      //   width: 50,
                                      //   alignment: Alignment.center,
                                      //   decoration: BoxDecoration(
                                      //     //color: Colors.amber.shade300,
                                      //     borderRadius:
                                      //         BorderRadius.circular(25),
                                      //   ),
                                      //   child: SvgPicture.asset(
                                      //       "assets/paris.svg",
                                      //       color: Colors.black,
                                      //       width: 50,
                                      //       height: 50,
                                      //       semanticsLabel:
                                      //           'Acme Logo'),
                                      //   // child: Icon(
                                      //   //   Icons.abc,
                                      //   //   size: 30,
                                      //   //   color: Colors.black,
                                      //   // ),
                                      // ),
                                      // Text(
                                      //   "",
                                      //   style: TextStyle(
                                      //     fontSize: 30,
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Date d'expedition",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${created_at.day}-${created_at.month}-${created_at.year}",
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Date d'arrivée",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${arrival_date.day}-${arrival_date.month}-${arrival_date.year}",
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            print("data: $e");
            //
            return Card(
              elevation: 1,
              child: InkWell(
                onTap: () async {
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if (connectivityResult == ConnectivityResult.mobile ||
                      connectivityResult == ConnectivityResult.bluetooth ||
                      connectivityResult == ConnectivityResult.wifi) {
                    // I am connected to a mobile network.
                    Get.dialog(
                      const Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                    rechercheController.checkElement(
                        e['id_item'], e, true, index);
                    //Get.to(Produit(e));
                    //
                  } else {
                    // I am connected to a wifi network.
                    Get.to(ProduitItem(e));
                  }
                },
                child: Container(
                  height: 160,
                  width: 200,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                        "assets/carton.png",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${e['description']}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 150,
                              width: 270,
                              decoration: BoxDecoration(
                                //color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pays des. ",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${e['pacakge_info']['destination']}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment
                                  //           .spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       "Expediteur ",
                                  //       style: TextStyle(
                                  //         fontSize: 11,
                                  //         color: Colors.grey,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       jsonDecode(
                                  //               "${e['pacakge_info']}")[
                                  //           'sender'],
                                  //       style: TextStyle(
                                  //         fontSize: 20,
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //     // Container(
                                  //     //   height: 50,
                                  //     //   width: 50,
                                  //     //   alignment: Alignment.center,
                                  //     //   decoration: BoxDecoration(
                                  //     //     //color: Colors.amber.shade300,
                                  //     //     borderRadius:
                                  //     //         BorderRadius.circular(25),
                                  //     //   ),
                                  //     //   child: SvgPicture.asset(
                                  //     //       "assets/paris.svg",
                                  //     //       color: Colors.black,
                                  //     //       width: 50,
                                  //     //       height: 50,
                                  //     //       semanticsLabel:
                                  //     //           'Acme Logo'),
                                  //     //   // child: Icon(
                                  //     //   //   Icons.abc,
                                  //     //   //   size: 30,
                                  //     //   //   color: Colors.black,
                                  //     //   // ),
                                  //     // ),
                                  //     // Text(
                                  //     //   "",
                                  //     //   style: TextStyle(
                                  //     //     fontSize: 30,
                                  //     //     color: Colors.black,
                                  //     //   ),
                                  //     // ),
                                  //   ],
                                  // ),

                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment
                                  //           .spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       "Destinateur ",
                                  //       style: TextStyle(
                                  //         fontSize: 11,
                                  //         color: Colors.grey,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       jsonDecode(
                                  //           jsonDecode(e['receives'])[
                                  //               0])["fullname"],
                                  //       style: const TextStyle(
                                  //         fontSize: 20,
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //     // Container(
                                  //     //   height: 50,
                                  //     //   width: 50,
                                  //     //   alignment: Alignment.center,
                                  //     //   decoration: BoxDecoration(
                                  //     //     //color: Colors.amber.shade300,
                                  //     //     borderRadius:
                                  //     //         BorderRadius.circular(25),
                                  //     //   ),
                                  //     //   child: SvgPicture.asset(
                                  //     //       "assets/paris.svg",
                                  //     //       color: Colors.black,
                                  //     //       width: 50,
                                  //     //       height: 50,
                                  //     //       semanticsLabel:
                                  //     //           'Acme Logo'),
                                  //     //   // child: Icon(
                                  //     //   //   Icons.abc,
                                  //     //   //   size: 30,
                                  //     //   //   color: Colors.black,
                                  //     //   // ),
                                  //     // ),
                                  //     // Text(
                                  //     //   "",
                                  //     //   style: TextStyle(
                                  //     //     fontSize: 30,
                                  //     //     color: Colors.black,
                                  //     //   ),
                                  //     // ),
                                  //   ],
                                  // ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Expéditeur",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        jsonDecode(
                                                "${e['pacakge_info']['sender']}")[
                                            "names"],
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Téléphone exp.",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        jsonDecode(
                                                "${e['pacakge_info']['sender']}")[
                                            "phone_number"],
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Code item",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${e['id_item']}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
