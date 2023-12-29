import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timelines/timelines.dart';

class ItineranceItem extends StatelessWidget {
  //
  Map e;
  ItineranceItem(this.e);
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      //child: Timeline.custom(childrenDelegate: childrenDelegate),
      //color: Colors.green,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          color: Colors.black,
          //nodePosition: 0.5,
          //nodeItemOverlap: false,
          indicatorTheme: const IndicatorThemeData(
            color: Colors.black,
            size: 0.5,
          ),
        ),
        builder: TimelineTileBuilder.fromStyle(
          connectorStyle: ConnectorStyle.solidLine,
          contentsAlign: ContentsAlign.alternating,
          endConnectorStyle: ConnectorStyle.transparent,
          indicatorPositionBuilder: (context, index) => 1,
          oppositeContentsBuilder: (context, index) {
            Map step = jsonDecode(e['pacakge_info']['step'])[index];
            return Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              child: Icon(
                Icons.location_on,
                size: 40,
                color: step['isCompleted']
                    ? Colors.red.shade700
                    : Colors.grey.shade400,
              ),
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: ExactAssetImage(
              //       "assets/carton.png",
              //     ),
              //     fit: BoxFit.fill,
              //   ),
              // ),
            );
          },
          contentsBuilder: (context, index) {
            //String s = jsonDecode(e['step'])[index];
            Map step = jsonDecode(e['pacakge_info']['step'])[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Opacity(
                opacity: step['isCompleted'] ? 0.2 : 1,
                child: Container(
                  //height: 100,
                  decoration: BoxDecoration(
                    //color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      '${step['country']},',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Port de St Pasteur Beni',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: jsonDecode(e['pacakge_info']['step']).length,
        ),
      ),
    );
  }
}
