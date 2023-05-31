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
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  final TextStyle _style2 = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.grey[700],
    fontSize: 16,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.place_outlined),
            Text(
              fetchedData[index]!.city.toString(),
              style: _style1,
            ),
          ],
        ),
        Text(
          DateFormat.MMMEd().add_jm().format(DateTime.now()),
          style: _style2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(IconGenerator(fetchedData[index]!.icon),
                color: Colors.blue, size: 55),
            const SizedBox(width: 15),
            Text(
              '${(fetchedData[index]!.temperature! - 273.15).toStringAsFixed(0)}\u2103',
              style: const TextStyle(fontSize: 55, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Text(
          fetchedData[index]!.discription.toString(),
          style: const TextStyle(fontSize: 25),
        ),
      ],
    );
  }
}
