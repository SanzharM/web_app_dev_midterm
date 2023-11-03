part of 'nav_bar_bloc.dart';

class NavBarState extends Equatable {
  const NavBarState({
    this.currentIndex = 0,
  });

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];

  NavBarState copyWith({
    int? currentIndex,
  }) {
    return NavBarState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
