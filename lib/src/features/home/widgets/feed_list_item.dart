import 'package:flutter/material.dart';
import 'package:linkedin/src/core/app_theme.dart';
import 'package:linkedin/src/core/constants/app_colors.dart';
import 'package:linkedin/src/widgets/spacing.dart';
import 'package:readmore/readmore.dart';

class FeedListItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String role;
  final String posted;
  final String? nameRegisteredIndex;
  final bool status;
  final String? text;
  const FeedListItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.role,
    required this.posted,
    this.nameRegisteredIndex,
    required this.status,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacing.smallHeight(),
          Divider(
            color: AppColors.dark.withOpacity(.1),
            thickness: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageUrl),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: AppTheme.bodyOne.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '•',
                            style: AppTheme.bodyOne.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            nameRegisteredIndex!,
                            style: AppTheme.bodyOne.copyWith(
                                fontWeight: FontWeight.w200,
                                color: AppColors.dark.withOpacity(.3)),
                          ),
                        ],
                      ),
                      Text(
                        role,
                        style: AppTheme.bodyOne.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.dark.withOpacity(.5)),
                      ),
                      Row(
                        children: [
                          Text(
                            posted,
                            style: AppTheme.bodyOne.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.dark.withOpacity(.5)),
                          ),
                          Text(
                            '•',
                            style: AppTheme.bodyOne.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.dark.withOpacity(.5)),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.public,
                            size: 16,
                            color: AppColors.dark.withOpacity(.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(Icons.view_sidebar_outlined)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 8, bottom: 10),
            child: ReadMoreText(
              text!,
              trimLines: 2,
              colorClickableText: AppColors.dark.withOpacity(.4),
              trimMode: TrimMode.Line,
              trimCollapsedText: 'See more',
              trimExpandedText: 'See less',
              style: AppTheme.bodyOne.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.dark,
              ),
              moreStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const Spacing.smallHeight(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.thumb_up,
                  color: AppColors.dark.withOpacity(.4),
                ),
                Icon(
                  Icons.insert_comment_rounded,
                  color: AppColors.dark.withOpacity(.4),
                ),
                Icon(
                  Icons.share,
                  color: AppColors.dark.withOpacity(.4),
                ),
                Icon(
                  Icons.send,
                  color: AppColors.dark.withOpacity(.4),
                )
              ],
            ),
          )
        ]);
  }
}
