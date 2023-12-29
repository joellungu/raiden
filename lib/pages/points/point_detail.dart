import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PointDetails extends StatelessWidget {
  //
  var box = GetStorage();
  Map user = {};
  RxSet listContact = RxSet();
  //
  PointDetails() {
    //
    var us = box.read("user") ?? {};
    user = us["data"] ?? {};
    //
    List historiques = box.read("historiques") ?? [];
    historiques.forEach((element) {
      //['phone_number']
      Map sender = jsonDecode(element['sender']);
      //[0]['phone_number']
      listContact.add({"phone_number": sender['phone_number']});
    });
    //
    listContact.forEach((x) {
      //
      historiques.forEach((element) {
        //
        Map sender = jsonDecode(element['sender']);
        //listContact.add(element['sender']['phone_number']);
        if (sender['phone_number'] == x['phone_number']) {
          //
          x['raiden_point'] = element['raiden_point'];
          print("sender:phone_number: ${sender['phone_number']}");
        }
      });
    });
    //
    print("listContact: $listContact");
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                color: Colors.blue,
              ),
              Expanded(
                flex: 8,
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, right: 5, left: 5),
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                elevation: 3,
                color: Colors.white,
                child: Container(
                  height: 70,
                  child: const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListTile(
                          title: Text(
                            "Vos points ",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          subtitle: Text(
                            "Pour plus de détails contacter le service",
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, right: 5, left: 5),
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                elevation: 0,
                color: Colors.white,
                child: SizedBox(
                  height: Get.size.height / 1.5,
                  child: Obx(
                    () => ListView(
                      children: List.generate(listContact.length, (index) {
                        Map e = listContact.elementAt(index);
                        return Container(
                          height: 70,
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            leading: const Icon(Icons.category),
                            title: Text("${e['phone_number']}"),
                            subtitle: Text("${e['raiden_point'] ?? ''}"),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/**
 * ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Text("${e['contenu']}\n\n"),
          Text("Date: ${e['dateTime']}"),
        ],
      ),
 */