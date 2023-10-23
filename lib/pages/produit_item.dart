import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail.dart';
import 'detail_item.dart';
import 'itinerance.dart';
import 'itinerance_item.dart';
import 'marchandise.dart';

// ignore: must_be_immutable
class ProduitItem extends StatelessWidget {
  RxBool det = true.obs;
  RxBool iti = false.obs;
  RxBool march = false.obs;
  ////
  Rx<Widget> vue = Rx<Widget>(Container());
  Map e;

  ProduitItem(this.e) {
    //
    vue.value = Detail(e);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Raiden"),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 2,
            labelColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.edit_document),
                text: "Détails",
              ),
              Tab(
                icon: Icon(Icons.production_quantity_limits),
                text: "Itinérance",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   //height: 55,
              //   //width: Get.size.width / 1.3,

              // ),
              // Container(
              //   height: 50,
              //   alignment: Alignment.center,
              //   child: Obx(
              //     () => ToggleButtons(
              //       onPressed: (r) {
              //         //
              //         print(r);
              //         if (r == 0) {
              //           det.value = true;
              //           iti.value = false;
              //           march.value = false;
              //           vue.value = Detail(e);
              //         } else if (r == 1) {
              //           det.value = false;
              //           iti.value = true;
              //           march.value = false;
              //           vue.value = Itinerance(e);
              //         } else {
              //           det.value = false;
              //           iti.value = false;
              //           march.value = true;
              //           vue.value = Marchandise(e);
              //         }
              //       },
              //       borderWidth: 3,
              //       isSelected: [det.value, iti.value, march.value],
              //       selectedColor: Colors.white,
              //       color: Colors.black,
              //       //fillColor: Colors.amber,
              //       fillColor: Colors.blue.shade900,
              //       borderRadius: BorderRadius.circular(20),
              //       textStyle: const TextStyle(
              //         fontSize: 15,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       children: const [
              //         Text(" Détails "),
              //         Text(" Itinérance "),
              //         Text(" Marchandise(s) "),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  //physics: BouncingScrollPhysics(),
                  children: [
                    DetailItem(e),
                    ItineranceItem(e),
                    //Marchandise(e),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
