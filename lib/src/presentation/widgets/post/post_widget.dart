import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    this.author,
    this.avatarUrl,
    this.nickname,
    this.postedAt,
    this.text,
    this.likes,
    this.reposts,
    this.attachments = const <String>[],
    this.onPressed,
  });

  final String? author;
  final String? avatarUrl;
  final String? nickname;
  final DateTime? postedAt;
  final String? text;
  final String? likes;
  final String? reposts;
  final List<String> attachments;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _ImageBuilder(url: avatarUrl),
                SizedBox(width: 8.w),
                Expanded(
                  child: _PostContent(
                    author: author,
                    nickname: nickname,
                    postedAt: postedAt,
                    text: text,
                    likes: likes,
                    reposts: reposts,
                    attachments: attachments,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }
}

class _ImageBuilder extends StatelessWidget {
  const _ImageBuilder({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.w,
      width: 36.w,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        width: double.maxFinite,
        height: double.maxFinite,
        errorWidget: (context, url, error) {
          return const Icon(CupertinoIcons.exclamationmark_circle_fill);
        },
      ),
    );
  }
}

class _PostContent extends StatelessWidget {
  const _PostContent({
    Key? key,
    required this.author,
    required this.nickname,
    required this.postedAt,
    required this.text,
    required this.likes,
    required this.reposts,
    required this.attachments,
  }) : super(key: key);

  final String? author;
  final String? nickname;
  final DateTime? postedAt;
  final String? text;
  final String? likes;
  final String? reposts;
  final List<String> attachments;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Text(
              author ?? 'Unknown author',
              textAlign: TextAlign.left,
              style: context.theme.textTheme.titleMedium,
            ),
            if (nickname?.isNotEmpty ?? false)
              Text(
                ' ${nickname!}',
                textAlign: TextAlign.left,
                style: context.theme.textTheme.bodySmall?.apply(
                  color: context.theme.hintColor,
                ),
              ),
            if (postedAt != null) ...[
              //TODO: posted time
            ]
          ],
        ),
        if (text?.isNotEmpty ?? false) ...[
          SizedBox(height: 8.h),
          Text(
            text!,
            textAlign: TextAlign.left,
            style: context.theme.textTheme.bodyMedium,
          ),
        ],
        SizedBox(height: 16.h),
        // Attachments

        // Likes
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              CupertinoIcons.heart,
              color: context.theme.primaryColor,
              size: 16.w,
            ),
            SizedBox(width: 8.w),
            Text(
              L10n.of(context).nLikes(likes!),
              style: context.theme.textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}
