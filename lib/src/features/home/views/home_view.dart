import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:linkedin/src/core/app_theme.dart';
import 'package:linkedin/src/core/constants/app_colors.dart';
import 'package:linkedin/src/features/home/widgets/feed_list_item.dart';
import 'package:linkedin/src/widgets/search_text_field.dart';
import 'package:linkedin/src/widgets/spacing.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: const RightDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Spacing.smallHeight(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _scaffoldKey.currentState!.openDrawer(),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200/200'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const Spacing.largeWidth(),
                    const Expanded(
                      child: SearchTextField(),
                    ),
                    const Spacing.largeWidth(),
                    Icon(
                      Icons.chat_rounded,
                      color: AppColors.dark.withOpacity(.4),
                    )
                  ],
                ),
              ),
              const Spacing.smallHeight(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return FeedListItem(
                      name: faker.person.name(),
                      imageUrl: faker.image.image(),
                      role: faker.job.title(),
                      posted: '3w',
                      status: false,
                      nameRegisteredIndex: '1st',
                      text: faker.lorem.sentences(3).toString(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class RightDrawer extends StatelessWidget {
  const RightDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 1.3,
      child: ListView(
        children: [
          Container(
            color: Colors.grey.withOpacity(.1),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/200'),
                    backgroundColor: Colors.transparent,
                  ),
                  const Spacing.mediumWidth(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        faker.person.name(),
                        style: AppTheme.bodyOne.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const Spacing.smallHeight(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'View Profile',
                            style: AppTheme.bodyOne.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.blueGrey),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '•',
                            style: AppTheme.bodyOne.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Settings',
                            style: AppTheme.bodyOne.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 10.0, left: 15, right: 10, top: 10),
            child: Container(
              color: Colors.grey.withOpacity(.1),
              height: 30,
              child: Text(
                'Try Premium Free',
                style: AppTheme.bodyOne.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.blueGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
