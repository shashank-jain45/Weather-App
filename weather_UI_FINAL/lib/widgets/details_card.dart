import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../bloc/fetch_bloc.dart';
import '../model/model.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard(
      {super.key, required this.fetchedData, required this.index});

  final List<Data?> fetchedData;
  final int index;

  @override
  Widget build(BuildContext context) {
    // MediaQueryData screen = MediaQuery.of(context);

    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.topLeft,
      height: double.infinity,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: constraints.maxWidth * 0.06),
                child: SizedBox(
                  height: constraints.maxHeight / 10,
                  child: const AutoSizeText(
                    'Weather Details',
                    style:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailsInside(
                          fetchedData: "${fetchedData[index]!.humidity} %",
                          icon: MdiIcons.waterPercent,
                          detail: "Humidity",
                          constraints: constraints,
                        ),
                        DetailsInside(
                          fetchedData:
                              "${fetchedData[index]!.wind!.toStringAsFixed(0)} km/h",
                          icon: MdiIcons.weatherWindy,
                          detail: "Wind",
                          constraints: constraints,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailsInside(
                          fetchedData:
                              "${(fetchedData[index]!.temperature! - 273.15).toStringAsFixed(0)} \u2103",
                          icon: MdiIcons.thermometer,
                          detail: "Feels Like",
                          constraints: constraints,
                        ),
                        DetailsInside(
                          fetchedData:
                              "${fetchedData[index]!.position.toString()} hPa",
                          icon: MdiIcons.arrowDownCircle,
                          detail: "Pressure",
                          constraints: constraints,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.2,
                      child: LayoutBuilder(builder: (context, cons) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: IconButton(
                            icon: Icon(Icons.delete_forever,
                                color: const Color.fromARGB(255, 189, 85, 77),
                                size: cons.maxHeight * 0.6),
                            onPressed: () {
                              context.read<FetchBloc>().add(
                                    DeleteData(index: index),
                                  );
                            },
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailsInside extends StatelessWidget {
  DetailsInside({
    super.key,
    required this.fetchedData,
    required this.constraints,
    required this.icon,
    required this.detail,
  });

  // ignore: prefer_typing_uninitialized_variables
  var fetchedData;

  final BoxConstraints constraints;
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
        height: constraints.maxHeight * 0.25,
        width: constraints.maxWidth * 0.45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,
                color: Colors.blue, size: constraints.maxHeight * 0.35 * 0.4),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints2) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: constraints2.maxHeight / 3,
                        width: constraints2.maxWidth / 1,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: AutoSizeText(
                            maxFontSize: 100,
                            maxLines: 1,
                            "$fetchedData",
                            style: const TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints2.maxHeight / 3,
                        width: constraints2.maxWidth,
                        child: AutoSizeText(
                          detail,
                          style: const TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
