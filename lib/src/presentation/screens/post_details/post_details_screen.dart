import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/common/state_status.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/post_details/bloc/post_details_bloc.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_icon_button.dart';

class PostDetailsScreen extends StatelessWidget with AutoRouteWrapper {
  const PostDetailsScreen({
    super.key,
    required this.post,
  });

  final PostEntity post;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<PostDetailsBloc>(
      create: (_) => PostDetailsBloc(post),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostDetailsBloc, PostDetailsState>(
      listener: (context, state) {
        if (state.status.isError) {
          return context.showSnackBar(state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: L10n.of(context).post,
            actions: <Widget>[
              AppIconButton(
                icon: const Icon(CupertinoIcons.heart),
                onPressed: () {},
              ),
              AppIconButton(
                icon: const Icon(CupertinoIcons.bubble_left),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                      child: CachedNetworkImage(
                        imageUrl: state.post.avatarUrl ?? '',
                        height: 50.w,
                        fit: BoxFit.contain,
                        errorWidget: (_, __, ___) => Icon(
                          CupertinoIcons.exclamationmark_circle_fill,
                          color: context.theme.hintColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            state.post.author ?? '',
                            textAlign: TextAlign.left,
                            style: context.theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            state.post.nickname ?? '',
                            textAlign: TextAlign.left,
                            style: context.theme.textTheme.titleSmall?.apply(
                              color: context.theme.hintColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  state.post.text ?? '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
