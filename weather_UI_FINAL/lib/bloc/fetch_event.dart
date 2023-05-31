part of 'fetch_bloc.dart';

class FetchEvent {
  const FetchEvent();
}

class FetchWeather extends FetchEvent {
  Data? data;
  Map? mapofData;
  String? cityName;

  FetchWeather({
    this.data,
    this.mapofData,
    this.cityName,
  });
}

class FetchCurrentLocation extends FetchEvent {
  Data? data;
  Map? mapofData;
  Position? position;
  FetchCurrentLocation({
    this.data,
    this.mapofData,
    this.position,
  });
}

class RefreshData extends FetchEvent {
  Data? data;
  Map? mapofData;
  RefreshData({
    this.data,
    this.mapofData,
  });
}

class DeleteData extends FetchEvent {
  int? index;
  DeleteData({
    this.index,
  });
}
