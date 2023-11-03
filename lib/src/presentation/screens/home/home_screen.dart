import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/common/state_status.dart';
import 'package:web_app_dev_midterm/src/core/app_router/app_router.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/core/utils/utils.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/home/bloc/home_bloc.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_icon_button.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/loader/custom_loader.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/post/post_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.status.isError) {
          return context.showSnackBar(state.message);
        }
      },
      builder: (context, state) {
        Widget getBody() {
          if (state.status.isLoading) {
            return const CustomLoader();
          }
          if (state.posts.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  L10n.of(context).listIsEmpty,
                ),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final PostEntity post = state.posts.elementAt(index);
              return PostWidget(
                author: post.author,
                avatarUrl: post.avatarUrl,
                likes: L10n.of(context).nLikes('15.5K'),
                nickname: post.nickname,
                attachments: post.attachments ?? [],
                postedAt: post.postedAt,
                reposts: null,
                text: post.text,
                onPressed: () {
                  if (post.id == null) {
                    return context.showSnackBar('Post not found');
                  }
                  context.read<HomeBloc>().getPostById(
                        post.id!,
                      );
                },
              );
            },
          );
        }

        return NestedScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              leading: AppIconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(CupertinoIcons.profile_circled),
                onPressed: () {
                  // Open Drawer
                },
              ),
              centerTitle: true,
              title: Assets.icons.logoBlack.image(
                height: 42.h,
                fit: BoxFit.contain,
              ),
              actions: <Widget>[
                AppIconButton(
                  icon: const Icon(CupertinoIcons.settings),
                  onPressed: () {
                    context.router.push<void>(const SettingsRoute());
                  },
                ),
              ],
            ),
          ],
          body: AnimatedSwitcher(
            duration: Utils.animationDuration,
            child: getBody(),
          ),
        );
      },
    );
  }
}
