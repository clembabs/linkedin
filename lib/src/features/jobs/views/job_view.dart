import 'package:flutter/material.dart';
import 'package:linkedin/src/core/constants/app_colors.dart';
import 'package:linkedin/src/widgets/search_text_field.dart';
import 'package:linkedin/src/widgets/spacing.dart';

class JobView extends StatelessWidget {
  const JobView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage('https://picsum.photos/200/200'),
                backgroundColor: Colors.transparent,
              ),
              const Spacing.largeWidth(),
              const Expanded(
                child: SearchTextField(),
              ),
              const Spacing.largeWidth(),
              Icon(
                Icons.view_sidebar,
                color: AppColors.dark.withOpacity(.4),
              ),
              const Spacing.largeWidth(),
              Icon(
                Icons.chat_rounded,
                color: AppColors.dark.withOpacity(.4),
              )
            ],
          ),
        ),
        const Center(
          heightFactor: 30,
          child: Text('Job Screen Pending'),
        )
      ],
    )));
  }
}
