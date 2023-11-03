import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  void changeIndex(int index) => add(NavBarChangeIndexEvent(index));

  NavBarBloc() : super(const NavBarState()) {
    on<NavBarChangeIndexEvent>(_changeIndex);
  }

  void _changeIndex(
    NavBarChangeIndexEvent event,
    Emitter<NavBarState> emit,
  ) {
    if (state.currentIndex == event.index) return;
    emit(state.copyWith(currentIndex: event.index));
    HapticFeedback.lightImpact();
  }
}
