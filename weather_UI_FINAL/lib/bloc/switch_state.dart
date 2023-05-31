part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool darkMode;
  const SwitchState(this.darkMode);

  @override
  List<Object> get props => [darkMode];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'darkMode': darkMode});

    return result;
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      map['darkMode'] ?? false,
    );
  }
}
