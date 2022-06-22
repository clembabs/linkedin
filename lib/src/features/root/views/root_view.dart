import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:linkedin/src/features/home/views/home_view.dart';
import 'package:linkedin/src/features/jobs/views/job_view.dart';
import 'package:linkedin/src/features/my_networks/views/my_network_view.dart';
import 'package:linkedin/src/features/notifications/views/notifications_view.dart';
import 'package:linkedin/src/features/post/views/post_view.dart';
import 'package:linkedin/src/widgets/bottom_nav_bar.dart';

class RootView extends HookWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = useState(0);

    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex.value,
        children: [
          HomeView(),
          const MyNetworkView(),
          const PostView(),
          const NotificationsView(),
          const JobView(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentPageIndex.value,
        onTap: (index) => currentPageIndex.value = index,
      ),
    );
  }
}
