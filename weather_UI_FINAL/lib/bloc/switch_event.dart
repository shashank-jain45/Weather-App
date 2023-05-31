part of 'switch_bloc.dart';

class SwitchEvent {
  const SwitchEvent();
}

class DarkMode extends SwitchEvent {
  bool? darkMode;
  DarkMode({
    this.darkMode,
  });
}
