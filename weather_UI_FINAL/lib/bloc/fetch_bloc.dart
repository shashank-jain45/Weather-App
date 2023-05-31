import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app/model/get_weather.dart';
import 'package:weather_app/model/model.dart';
part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends HydratedBloc<FetchEvent, FetchState> {
  FetchBloc() : super(FetchState(fetchedData: const [], cityNames: const [])) {
    on<FetchWeather>(_fetchWeather);
    on<FetchCurrentLocation>(_fetchCurrentLocationWeather);
    on<RefreshData>(_refreshData);
    on<DeleteData>(_deleteData);
  }
  void _fetchWeather(FetchWeather event, Emitter<FetchState> emit) async {
    event = await getCurrentWeather(event.cityName);
    if (event.data!.city == "city not found") {
      emit(
        FetchState(
          cityNames: List.from(state.cityNames!),
          fetchedData: List.from(state.fetchedData),
          snackBar: true,
          date: DateTime.now(),
        ),
      );
    } else {
      if (state.cityNames!.contains(event.data!.city)) {
        int index = state.cityNames!.indexOf(event.data!.city!);
        emit(
          FetchState(
              date: DateTime.now(),
              cityNames: List.from(state.cityNames!),
              fetchedData: List.from(state.fetchedData)..removeAt(index),
              snackBar: false),
        );
        emit(
          FetchState(
              date: DateTime.now(),
              cityNames: List.from(state.cityNames!),
              fetchedData: List.from(state.fetchedData)
                ..insert(index, event.data),
              snackBar: false),
        );
      } else {
        emit(
          FetchState(
              date: DateTime.now(),
              cityNames: List.from(state.cityNames!)
                ..insert(0, event.data!.city!),
              fetchedData: List.from(state.fetchedData)..insert(0, event.data),
              snackBar: false),
        );
      }
    }
  }

  void _fetchCurrentLocationWeather(
      FetchCurrentLocation event, Emitter<FetchState> emit) async {
    event = await getCurrentLocationWeather();
    if (state.cityNames!.contains(event.data!.city)) {
      int index = state.cityNames!.indexOf(event.data!.city!);
      emit(
        FetchState(
            date: DateTime.now(),
            cityNames: List.from(state.cityNames!),
            fetchedData: List.from(state.fetchedData)..removeAt(index),
            snackBar: false),
      );
      emit(
        FetchState(
            date: DateTime.now(),
            cityNames: List.from(state.cityNames!),
            fetchedData: List.from(state.fetchedData)
              ..insert(index, event.data),
            snackBar: false),
      );
    } else {
      emit(
        FetchState(
            date: DateTime.now(),
            cityNames: List.from(state.cityNames!)
              ..insert(0, event.data!.city!),
            fetchedData: List.from(state.fetchedData)..insert(0, event.data),
            snackBar: false),
      );
    }
  }

  void _refreshData(RefreshData event, Emitter<FetchState> emit) async {
    if (state.cityNames!.isEmpty) {
    } else {
      for (var i = 0; i < state.cityNames!.length; i++) {
        event = await refreshCurrentWeather(state.cityNames![i]);
        if (event.data!.city == 'city not found') {
          emit(
            FetchState(
                date: DateTime.now(),
                cityNames: List.from(state.cityNames!),
                fetchedData: List.from(state.fetchedData),
                snackBar: false),
          );
        } else {
          emit(
            FetchState(
                date: DateTime.now(),
                cityNames: List.from(state.cityNames!),
                fetchedData: List.from(state.fetchedData)..removeAt(i),
                snackBar: false),
          );
          emit(
            FetchState(
                date: DateTime.now(),
                cityNames: List.from(state.cityNames!),
                fetchedData: List.from(state.fetchedData)
                  ..insert(i, event.data),
                snackBar: false),
          );
        }
      }
    }
  }

  @override
  FetchState? fromJson(Map<String, dynamic> json) {
    return FetchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(FetchState state) {
    return state.toMap();
  }

  void _deleteData(DeleteData event, Emitter<FetchState> emit) {
    emit(
      FetchState(
        date: DateTime.now(),
        cityNames: List.from(state.cityNames!)..removeAt(event.index!),
        snackBar: false,
        fetchedData: List.from(state.fetchedData)..removeAt(event.index!),
      ),
    );
  }
}
