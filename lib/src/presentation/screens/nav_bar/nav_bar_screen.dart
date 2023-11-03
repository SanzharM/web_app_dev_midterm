import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:web_app_dev_midterm/src/core/utils/utils.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/home/home_screen.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/nav_bar/bloc/nav_bar_bloc.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/profile/profile_screen.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  static final Map<int, Widget> _tabs = {
    0: const HomeScreen(),
    1: const ProfileScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      builder: (context, state) {
        Widget getChild() {
          return _tabs[state.currentIndex] ?? _tabs.values.first;
        }

        Color getColor(int index) {
          if (index == state.currentIndex) {
            return context.theme.primaryColor;
          }

          return context.theme.hintColor;
        }

        return Scaffold(
          body: AnimatedSwitcher(
            duration: Utils.animationDuration,
            child: getChild(),
          ),
          bottomNavigationBar: CupertinoTabBar(
            height: kBottomNavigationBarHeight.h,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            activeColor: context.theme.primaryColor,
            inactiveColor: ColorName.secondaryGrey,
            border: const Border.fromBorderSide(
              BorderSide(color: ColorName.lightGrey),
            ),
            currentIndex: state.currentIndex,
            onTap: context.read<NavBarBloc>().changeIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.search,
                  color: getColor(0),
                  size: context.theme.iconTheme.size,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.person,
                  color: getColor(1),
                  size: context.theme.iconTheme.size,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
