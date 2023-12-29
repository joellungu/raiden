import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Detail extends StatelessWidget {
  double taille = 13;
  Map e;
  Detail(this.e);
  //
  @override
  Widget build(BuildContext context) {
    //
    print("resultat: $e");
    //
    List exp = jsonDecode(e['receives']);
    // print("--------------------------------");

    // print(exp[0].runtimeType);
    // print(jsonDecode(e['receives']));
    // print(jsonDecode(e['receives']).runtimeType);
    // print(jsonDecode(e['receives'])[0].runtimeType);
    // print(jsonDecode(jsonDecode(e['receives'])[0])["fullname"]);
    // DateTime created_at = DateTime.parse(e['created_at']);
    // print(created_at);
    //
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 200,
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
                      height: 190,
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
                            style: TextStyle(
                              fontSize: 20,
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
                        height: 190,
                        width: 270,
                        decoration: BoxDecoration(
                          //color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  "${e['destination']}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "OTP ",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${e['otp']}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.teal.shade700,
                                      fontWeight: FontWeight.bold),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Expediteur ",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  jsonDecode("${e['sender']}")['names'],
                                  style: TextStyle(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Destinateur ",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  jsonDecode(
                                      jsonDecode(e['receives'])[0])["fullname"],
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Raiden Point",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${e['raiden_point'] ?? ''}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date d'expedition",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                ///
                                Text(
                                  "${e['departure_date'] ?? ''}",
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
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 105,
            width: 200,
            decoration: BoxDecoration(
              //color: Colors.blue.shade700.withOpacity(0.5),
              //color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 210,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              //color: Colors.amber.shade300,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            // child: SvgPicture.asset(
                            //     "assets/IcBaselineDirectionsBoatFilled.svg",
                            //     color: Colors.white,
                            //     width: 50,
                            //     height: 50,
                            //     semanticsLabel: 'Acme Logo'),
                            child: Icon(
                              CupertinoIcons.arrow_up,
                              size: 55,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
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
                        height: 210,
                        width: 270,
                        decoration: BoxDecoration(
                          //color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Expéditeur ",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Nom",
                                  style: TextStyle(
                                    fontSize: taille,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  jsonDecode("${e['sender']}")['names'],
                                  style: TextStyle(
                                    fontSize: taille,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Téléphone",
                                  style: TextStyle(
                                    fontSize: taille,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  jsonDecode("${e['sender']}")['phone_number'],
                                  style: TextStyle(
                                    fontSize: taille,
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
        const SizedBox(
          height: 10,
        ),
        Column(
          children: List.generate(exp.length, (index) {
            String expMap = exp[index];
            Map ep = jsonDecode(expMap);
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 105,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  //color: Colors.blue.shade700.withOpacity(0.5),
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 210,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.teal.shade900,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  //color: Colors.amber.shade300,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                // child: SvgPicture.asset(
                                //     "assets/IcBaselineDirectionsBoatFilled.svg",
                                //     color: Colors.white,
                                //     width: 50,
                                //     height: 50,
                                //     semanticsLabel: 'Acme Logo'),
                                child: Icon(
                                  CupertinoIcons.arrow_down,
                                  size: 55,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
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
                            //height: 210,
                            width: 270,
                            decoration: BoxDecoration(
                              //color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Recepteur ",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Nom",
                                      style: TextStyle(
                                        fontSize: taille,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${ep['fullname']}",
                                      style: TextStyle(
                                        fontSize: taille,
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
                                      "Téléphone",
                                      style: TextStyle(
                                        fontSize: taille,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${ep['phone']}",
                                      style: TextStyle(
                                        fontSize: taille,
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
            );
          }),
        ),
        SizedBox(
          height: 20,
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     //
        //   },
        //   style: ButtonStyle(
        //     backgroundColor: MaterialStateProperty.all(Colors.black),
        //     shape: MaterialStateProperty.all(
        //       RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //     ),
        //   ),
        //   child: Container(
        //     alignment: Alignment.center,
        //     width: 250,
        //     height: 50,
        //     child: const Text(
        //       "J'ai réçu",
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 20,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
