import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/fetch_bloc.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 25, horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 5,
          child: TextField(
            enableSuggestions: true,
            onTapOutside: (event) {
              controller.clear();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              icon: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
              contentPadding: EdgeInsets.only(
                left: 0,
                bottom: 11,
                top: 11,
                right: 15,
              ),
              hintText: "Search Location",
            ),
            controller: controller,
            onEditingComplete: () async {
              context.read<FetchBloc>().add(
                    FetchWeather(
                      cityName: controller.text,
                    ),
                  );
              FocusManager.instance.primaryFocus?.unfocus();

              controller.clear();
            },
          ),
        ),
      ),
    );
  }
}
