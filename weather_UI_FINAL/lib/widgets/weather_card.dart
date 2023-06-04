import 'package:flutter/material.dart';
import '../model/model.dart';
import 'current_details_layout.dart';
import 'details_card.dart';
import 'min_max_card.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(
      {super.key, required this.fetchedData, required this.index});
  final List<Data?> fetchedData;
  final int index;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        CurrentDetailsLayout(fetchedData: fetchedData, index: index),
        SizedBox(height: mediaQuery.size.height / 50),
        MinMaxCard(fetchedData: fetchedData, index: index),
        SizedBox(height: mediaQuery.size.height / 50),
        Expanded(
          child: DetailsCard(fetchedData: fetchedData, index: index),
        ),
      ],
    );
  }
}
