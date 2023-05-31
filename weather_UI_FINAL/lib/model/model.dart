import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Data extends Equatable {
  String? city;
  String? discription;
  double? temperature;
  double? minTemp;
  double? maxTemp;
  double? wind;
  int? humidity;
  String? icon;
  String? position;

  Data(
      {this.city,
      this.discription,
      this.temperature,
      this.minTemp,
      this.maxTemp,
      this.wind,
      this.humidity,
      this.icon,
      this.position});

  @override
  List<Object?> get props => [
        discription,
        temperature,
        minTemp,
        maxTemp,
        wind,
        humidity,
        city,
        icon,
        position
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (city != null) {
      result.addAll({'city': city});
    }
    if (discription != null) {
      result.addAll({'discription': discription});
    }
    if (temperature != null) {
      result.addAll({'temperature': temperature});
    }
    if (minTemp != null) {
      result.addAll({'minTemp': minTemp});
    }
    if (maxTemp != null) {
      result.addAll({'maxTemp': maxTemp});
    }
    if (wind != null) {
      result.addAll({'wind': wind});
    }
    if (humidity != null) {
      result.addAll({'humidity': humidity});
    }
    if (icon != null) {
      result.addAll({'icon': icon});
    }
    if (position != null) {
      result.addAll({'position': position});
    }

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      city: map['city'],
      discription: map['discription'],
      temperature: map['temperature']?.toDouble(),
      minTemp: map['minTemp']?.toDouble(),
      maxTemp: map['maxTemp']?.toDouble(),
      wind: map['wind']?.toDouble(),
      humidity: map['humidity']?.toInt(),
      icon: map['icon'],
      position: map['position'],
    );
  }
}
