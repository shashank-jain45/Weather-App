import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../model/model.dart';

class MinMaxCard extends StatelessWidget {
  const MinMaxCard({
    super.key,
    required this.fetchedData,
    required this.index,
  });

  final List<Data?> fetchedData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 70,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.005),
        child: Row(
          children: [
            const Icon(MdiIcons.thermometerLow, size: 40, color: Colors.blue),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Min Temp',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                  Text(
                    " ${(fetchedData[index]!.minTemp! - 273.15).toStringAsFixed(1)} \u2103",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              height: 65.0,
              child: const VerticalDivider(
                color: Colors.black,
                indent: 10.0,
                endIndent: 10.0,
              ),
            ),
            const Icon(MdiIcons.thermometer, size: 40, color: Colors.blue),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Max Temp',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                  Text(
                    " ${(fetchedData[index]!.minTemp! - 273.15).toStringAsFixed(1)} \u2103",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
