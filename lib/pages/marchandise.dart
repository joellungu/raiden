import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Marchandise extends StatelessWidget {
  //
  Map e;
  Marchandise(this.e) {
    print("items: ${e['items']}");
    print("items: ${e['items'].runtimeType}");
  }
  //
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: List.generate(jsonDecode(e['items']).length, (index) {
        String s = jsonDecode(e['items'])[index];
        print(s);
        //print(jsonDecode(s).runtimeType);
        Map item = jsonDecode(s);
        return ListTile(
          onTap: () {
            //
            Get.dialog(Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  height: Get.size.height / 1.3,
                  width: Get.size.width / 1.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        alignment: Alignment.centerRight,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' Iphone 14 Pro max',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage(
                                "assets/iphone-pro-max-14.jpeg",
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
          },
          leading: Container(
            height: 40,
            width: 40,
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
          title: Text(
            //"$s",
            '${item['description']}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // subtitle: Text(
          //   'Téléphone portable, couleur noir, 500g',
          //   style: TextStyle(
          //     fontSize: 17,
          //     fontWeight: FontWeight.normal,
          //   ),
          // ),
        );
      }),
    );
  }
}
