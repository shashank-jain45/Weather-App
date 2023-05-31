part of 'fetch_bloc.dart';

// ignore: must_be_immutable
class FetchState extends Equatable {
  final List<Data?> fetchedData;
  List<String>? cityNames = ['Mangaluru'];
  bool? snackBar = true;
  DateTime? date;
  FetchState({
    this.cityNames,
    this.date,
    this.snackBar,
    required this.fetchedData,
  });

  @override
  List<Object?> get props => [fetchedData, date, snackBar, cityNames];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'fetchedData': fetchedData.map((x) => x?.toMap()).toList()});
    if (cityNames != null) {
      result.addAll({'cityNames': cityNames});
    }
    if (snackBar != null) {
      result.addAll({'snackBar': snackBar});
    }
    if (date != null) {
      result.addAll({'date': date!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory FetchState.fromMap(Map<String, dynamic> map) {
    return FetchState(
      fetchedData:
          List<Data?>.from(map['fetchedData']?.map((x) => Data.fromMap(x))),
      cityNames: List<String>.from(map['cityNames']),
      snackBar: map['snackBar'],
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
    );
  }
}
