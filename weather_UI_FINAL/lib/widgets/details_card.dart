import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../model/model.dart';

class DetailsCard extends StatelessWidget {
  DetailsCard({
    super.key,
    required this.fetchedData,
    required this.index,
  });

  final List<Data?> fetchedData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Weather Details',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
        Container(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 5,
              child: SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Icon(MdiIcons.waterPercent,
                        color: Colors.blue, size: 50),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${fetchedData[index]!.humidity.toString()}%",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          const Text("Humidity",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 5,
              child: SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Icon(MdiIcons.weatherWindy,
                        color: Colors.blue, size: 50),
                    const SizedBox(
                      width: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${fetchedData[index]!.wind!.toStringAsFixed(0)} km/h",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          const Text("Wind",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 5,
              child: SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Icon(MdiIcons.thermometer,
                        color: Colors.blue, size: 50),
                    const SizedBox(
                      width: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${(fetchedData[index]!.temperature! - 273.15).toStringAsFixed(0)} \u2103",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          const Text("Feels Like",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 5,
              child: SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Icon(MdiIcons.arrowDownCircle,
                        color: Colors.blue, size: 50),
                    const SizedBox(
                      width: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${fetchedData[index]!.position.toString()} hPa",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          const Text("Pressure",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
