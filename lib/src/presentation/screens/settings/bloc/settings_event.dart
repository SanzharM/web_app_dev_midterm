part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class SettingsInitialEvent extends SettingsEvent {}

class SettingsChangeEvent extends SettingsEvent {
  final Locale? locale;
  final ThemeMode? themeMode;

  SettingsChangeEvent({
    this.locale,
    this.themeMode,
  });
}
