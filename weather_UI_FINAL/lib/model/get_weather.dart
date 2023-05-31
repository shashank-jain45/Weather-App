import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/bloc/fetch_bloc.dart';
import 'get_location.dart';
import 'model.dart';

Future getCurrentWeather(String? cityName) async {
  http.Response response;
  FetchWeather event = FetchWeather();
  cityName = cityName!.replaceAll(RegExp(r"\s+\b|\b\s"), "");
  Uri url1 = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=56bae0fe92162262a26656aa0ec852b1");

  response = await http.get(url1);
  if (response.statusCode == 200) {
    event.mapofData = jsonDecode(response.body);
    event.data = Data(
        position: event.mapofData!["main"]['pressure'].toString(),
        city: event.mapofData?['name'].toString(),
        discription: event.mapofData?["weather"][0]['description'].toString(),
        humidity: int.parse(event.mapofData!["main"]['humidity'].toString()),
        icon: event.mapofData?["weather"][0]['icon'].toString(),
        maxTemp: double.parse(event.mapofData!["main"]['temp_max'].toString()),
        minTemp: double.parse(event.mapofData!["main"]['temp_min'].toString()),
        wind: double.parse(event.mapofData!["wind"]['speed'].toString()),
        temperature: double.parse(event.mapofData!["main"]['temp'].toString()));
    return event;
  } else {
    event.mapofData = jsonDecode(response.body);
    event.data = Data(city: event.mapofData?['message'].toString());
    return event;
  }
}

Future getCurrentLocationWeather() async {
  FetchCurrentLocation event = FetchCurrentLocation();
  event.position = await getCurrentLocation();
  List<Placemark> placemarks = await placemarkFromCoordinates(
      event.position!.latitude, event.position!.longitude);
  http.Response response;
  Uri url2 = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?lat=${event.position!.latitude}&lon=${event.position!.longitude}&appid=56bae0fe92162262a26656aa0ec852b1");
  response = await http.get(url2);
  if (response.statusCode == 200) {
    event.mapofData = jsonDecode(response.body);
    event.data = Data(
        position: event.mapofData!["main"]['pressure'].toString(),
        city: placemarks[0].locality.toString(),
        discription: event.mapofData?["weather"][0]['description'].toString(),
        humidity: int.parse(event.mapofData!["main"]['humidity'].toString()),
        icon: event.mapofData?["weather"][0]['icon'].toString(),
        maxTemp: double.parse(event.mapofData!["main"]['temp_max'].toString()),
        minTemp: double.parse(event.mapofData!["main"]['temp_min'].toString()),
        wind: double.parse(event.mapofData!["wind"]['speed'].toString()),
        temperature: double.parse(event.mapofData!["main"]['temp'].toString()));
  }
  return event;
}

Future refreshCurrentWeather(String? cityName) async {
  http.Response response;
  RefreshData event = RefreshData();
  cityName = cityName!.replaceAll(RegExp(r"\s+\b|\b\s"), "");
  Uri url1 = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=56bae0fe92162262a26656aa0ec852b1");

  response = await http.get(url1);
  if (response.statusCode == 200) {
    event.mapofData = jsonDecode(response.body);
    event.data = Data(
        position: event.mapofData!["main"]['pressure'].toString(),
        city: event.mapofData?['name'].toString(),
        discription: event.mapofData?["weather"][0]['description'].toString(),
        humidity: int.parse(event.mapofData!["main"]['humidity'].toString()),
        icon: event.mapofData?["weather"][0]['icon'].toString(),
        maxTemp: double.parse(event.mapofData!["main"]['temp_max'].toString()),
        minTemp: double.parse(event.mapofData!["main"]['temp_min'].toString()),
        wind: double.parse(event.mapofData!["wind"]['speed'].toString()),
        temperature: double.parse(event.mapofData!["main"]['temp'].toString()));
    return event;
  } else {
    event.mapofData = jsonDecode(response.body);
    event.data = Data(city: event.mapofData?['message'].toString());
    return event;
  }
}
