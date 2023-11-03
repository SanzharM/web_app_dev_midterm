import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/core/local_storage/local_storage.dart';
import 'package:web_app_dev_midterm/src/service_locator.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  void initial() => add(SettingsInitialEvent());

  void changeLocale(Locale locale) => add(SettingsChangeEvent(locale: locale));
  void changeThemeMode(ThemeMode themeMode) =>
      add(SettingsChangeEvent(themeMode: themeMode));

  SettingsBloc() : super(const SettingsState()) {
    on<SettingsInitialEvent>(_initial);
    on<SettingsChangeEvent>(_change);
  }

  final LocalStorage _localStorage = sl<LocalStorage>();

  void _initial(
    SettingsInitialEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(locale: L10n.supportedLocales.first));

    final ThemeMode themeMode = await _localStorage.getThemeMode();
    final Locale locale = await _localStorage.getLocale();
    emit(state.copyWith(
      locale: locale,
      themeMode: themeMode,
    ));
  }

  void _change(
    SettingsChangeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    if (event.locale != null) {
      await _localStorage.setLocale(event.locale!);
    }
    if (event.themeMode != null) {
      await _localStorage.setThemeMode(event.themeMode!);
    }
    emit(state.copyWith(
      locale: event.locale,
      themeMode: event.themeMode,
    ));
  }
}
