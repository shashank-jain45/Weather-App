import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/bloc/fetch_bloc.dart';
import 'package:weather_app/bloc/switch_bloc.dart';
import 'package:weather_app/widgets/text_field.dart';
import 'package:weather_app/widgets/weather_card.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();
  final pageController = PageController(viewportFraction: 1, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchBloc, FetchState>(
      listener: (context, state) {
        if (state.snackBar == true) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Invalid city name"),
            duration: Duration(seconds: 1),
          ));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                  child: LayoutBuilder(builder: (context, c) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocBuilder<SwitchBloc, SwitchState>(
                          builder: (context, state) {
                            return Transform.scale(
                              alignment: Alignment.center,
                              scale: c.maxHeight * 0.03,
                              child: Switch(
                                value: state.darkMode,
                                onChanged: (newValue) {
                                  context
                                      .read<SwitchBloc>()
                                      .add(DarkMode(darkMode: newValue));
                                },
                              ),
                            );
                          },
                        ),
                        IconButton(
                          onPressed: () async {
                            context
                                .read<FetchBloc>()
                                .add(FetchCurrentLocation());
                          },
                          icon: Icon(
                            Icons.gps_fixed_rounded,
                            size: c.maxHeight,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            context.read<FetchBloc>().add(
                                  RefreshData(),
                                );
                          },
                          icon: Icon(
                            Icons.refresh,
                            size: c.maxHeight,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 55,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: state.fetchedData.length,
                    effect: WormEffect(
                      dotHeight: MediaQuery.of(context).size.height / 55,
                      dotWidth: MediaQuery.of(context).size.width / 25,
                      type: WormType.thinUnderground,
                    ),
                  ),
                ),
                state.fetchedData.isEmpty
                    ? const Text(
                        "No data Available ",
                        style: TextStyle(fontSize: 30),
                      )
                    : Expanded(
                        child: PageView.builder(
                        allowImplicitScrolling: true,
                        controller: pageController,
                        itemCount: state.fetchedData.length,
                        itemBuilder: (context, index) => WeatherCard(
                            fetchedData: state.fetchedData, index: index),
                      )),
              ],
            ),
          ),
        );
      },
    );
  }
}
