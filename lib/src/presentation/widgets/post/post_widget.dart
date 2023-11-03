import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';

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
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
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
    return SizedBox(
      height: 36.w,
      width: 36.w,
      child: CachedNetworkImage(
        imageUrl: url ?? '',
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
          children: <Widget>[
            Text(
              author ?? 'Author',
              textAlign: TextAlign.left,
              style: context.theme.textTheme.titleMedium,
            ),
            if (nickname?.isNotEmpty ?? false)
              Text(
                nickname!,
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
      ],
    );
  }
}
