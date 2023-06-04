import 'package:auto_size_text/auto_size_text.dart';
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
    MediaQueryData screen = MediaQuery.of(context);
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 5, 15, 5),
        child: SizedBox(
          width: screen.size.width / 1.2,
          height: screen.size.height * 0.09,
          child: LayoutBuilder(builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth / 2.1,
                  child: Row(
                    children: [
                      Icon(MdiIcons.thermometerLow,
                          color: Colors.blue,
                          size: constraints.maxHeight * 0.8),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints2) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: constraints2.maxHeight / 2,
                                  width: constraints2.maxWidth,
                                  child: const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: AutoSizeText(
                                      maxFontSize: 100,
                                      maxLines: 1,
                                      'Min Temp',
                                      style: TextStyle(
                                        fontSize: 70,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: constraints2.maxHeight / 2,
                                  width: constraints2.maxWidth,
                                  child: AutoSizeText(
                                    " ${(fetchedData[index]!.minTemp! - 273.15).toStringAsFixed(1)} \u2103",
                                    style: const TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.w400,
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
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: const SizedBox(
                    height: double.infinity,
                    child: VerticalDivider(
                      width: 0,
                      thickness: 1,
                      color: Colors.black,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth / 2.1,
                  child: Row(
                    children: [
                      Icon(MdiIcons.thermometerLow,
                          color: Colors.blue,
                          size: constraints.maxHeight * 0.8),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints3) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: constraints3.maxHeight / 2,
                                  width: constraints3.maxWidth,
                                  child: const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: AutoSizeText(
                                      maxLines: 1,
                                      'Max Temp',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 70),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: constraints3.maxHeight / 2,
                                  width: constraints3.maxWidth,
                                  child: AutoSizeText(
                                    " ${(fetchedData[index]!.maxTemp! - 273.15).toStringAsFixed(1)} \u2103",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 80),
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
              ],
            );
          }),
        ),
      ),
    );
  }
}
