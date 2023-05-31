import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/fetch_bloc.dart';
import '../model/model.dart';
import 'current_details_layout.dart';
import 'details_card.dart';
import 'min_max_card.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({super.key, required this.fetchedData, required this.index});
  final List<Data?> fetchedData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
      child: Column(
        children: [
          CurrentDetailsLayout(fetchedData: fetchedData, index: index),
          const SizedBox(height: 30),
          MinMaxCard(fetchedData: fetchedData, index: index),
          const SizedBox(height: 30),
          DetailsCard(fetchedData: fetchedData, index: index),
          const SizedBox(height: 30),
          IconButton(
            icon: const Icon(Icons.delete_forever,
                color: Color.fromARGB(255, 189, 85, 77), size: 40),
            onPressed: () {
              context.read<FetchBloc>().add(
                    DeleteData(index: index),
                  );
            },
          ),
        ],
      ),
    );
  }
}
