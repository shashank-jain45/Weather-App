import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/model.dart';

import '../model/icon_convert.dart';

class CurrentDetailsLayout extends StatelessWidget {
  CurrentDetailsLayout({
    super.key,
    required this.fetchedData,
    required this.index,
  });

  final List<Data?> fetchedData;
  final int index;
  final TextStyle _style1 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 100,
  );
  final TextStyle _style2 = TextStyle(
    fontWeight: FontWeight.w300,
    color: Colors.grey[700],
    fontSize: 100,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      height: MediaQuery.of(context).size.height / 6,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.place_outlined,
                  size: constraints.maxHeight / 4,
                ),
                SizedBox(
                  height: constraints.maxHeight / 4,
                  child: AutoSizeText(
                    fetchedData[index]!.city.toString(),
                    style: _style1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: constraints.maxHeight / 8,
              child: AutoSizeText(
                DateFormat.MMMEd().add_jm().format(DateTime.now()),
                style: _style2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(IconGenerator(fetchedData[index]!.icon),
                    color: Colors.blue, size: constraints.maxHeight / 3),
                SizedBox(
                  height: constraints.maxHeight / 3,
                  child: AutoSizeText(
                    '${(fetchedData[index]!.temperature! - 273.15).toStringAsFixed(0)}\u2103',
                    style: const TextStyle(
                        fontSize: 100, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: constraints.maxHeight / 4,
              child: AutoSizeText(
                fetchedData[index]!.discription.toString(),
                style: const TextStyle(fontSize: 100),
              ),
            ),
          ],
        );
      }),
    );
  }
}
