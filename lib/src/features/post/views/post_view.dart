import 'package:flutter/material.dart';
import 'package:linkedin/src/core/app_theme.dart';
import 'package:linkedin/src/core/constants/app_colors.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: GestureDetector(
          child: const Icon(
            Icons.close,
            size: 25,
            color: Colors.black,
          ),
        ),
        shadowColor: Colors.white,
        title: Text(
          'Share Post',
          style: AppTheme.bodyOne,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Text(
                'Post',
                style: AppTheme.bodyOne,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/200'),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Clement Babaniyi',
                        style: AppTheme.bodyOne.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.public),
                          Text(
                            'Anyone',
                            style: AppTheme.bodyOne.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_downward_sharp,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const JobBottomSheet()
        ],
      ),
    ));
  }
}

class JobBottomSheet extends StatelessWidget {
  const JobBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Hashtag',
            style: AppTheme.bodyOne.copyWith(color: Colors.blue),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.photo_camera_front),
              const SizedBox(width: 15),
              const Icon(Icons.video_call),
              const SizedBox(width: 15),
              const Icon(Icons.picture_in_picture),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => FractionallySizedBox(
                      heightFactor: 0.6,
                      //TODO Add An On-Close button above the bottomsheet
                      child: ListView(
                        children: [
                          const SizedBox(height: 10),
                          bottomList(Icons.picture_as_pdf, 'Add a Photo'),
                          bottomList(Icons.record_voice_over, 'Take A Video'),
                          bottomList(
                              Icons.wallet_giftcard, 'Celebrate An Occasion'),
                          bottomList(Icons.bookmark_outline, 'Add A Document'),
                          bottomList(
                              Icons.add_box, 'Share that you are hiring'),
                          bottomList(Icons.picture_as_pdf, 'Find An Expert'),
                          bottomList(Icons.bar_chart, 'Create a poll'),
                        ],
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.format_list_bulleted_outlined),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.chat_rounded,
                    color: AppColors.dark.withOpacity(.4),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Anyone',
                    style: AppTheme.bodyOne,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomList(IconData icon, String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.dark.withOpacity(.4),
          ),
          const SizedBox(width: 15),
          Text(
            item,
            style: AppTheme.bodyOne,
          )
        ],
      ),
    );
  }
}
