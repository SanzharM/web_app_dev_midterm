import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/common/state_status.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/profile/bloc/user_bloc.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.status.isError) {
          return context.showSnackBar(state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: L10n.of(context).profile,
            automaticallyImplyLeading: false,
            needLeading: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                      child: CachedNetworkImage(
                        imageUrl: state.user.avatarUrl ?? '',
                        errorWidget: (context, url, error) {
                          return Icon(
                            CupertinoIcons.profile_circled,
                            size: 48.w,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            '@${state.user.nickname}',
                            textAlign: TextAlign.left,
                            style: context.theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            state.user.username ?? '',
                            textAlign: TextAlign.left,
                            style: context.theme.textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.all(16.w),
            child: AppButton(
              title: L10n.of(context).edit,
              isLoading: state.status.isLoading,
              onPressed: null,
            ),
          ),
        );
      },
    );
  }
}
