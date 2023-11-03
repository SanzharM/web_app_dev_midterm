part of 'settings_bloc.dart';

class SettingsState {
  final ThemeMode themeMode;
  final Locale locale;
  final String appVersion;

  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('ru'),
    this.appVersion = '',
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    String? appVersion,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
