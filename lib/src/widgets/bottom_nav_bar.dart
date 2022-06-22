import 'package:flutter/material.dart';
import 'package:linkedin/src/core/app_theme.dart';
import 'package:linkedin/src/core/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: BottomAppBar(
        child: BottomNavigationBar(
          selectedLabelStyle: AppTheme.exp1,
          unselectedLabelStyle: AppTheme.exp1,
          selectedItemColor: AppColors.dark,
          unselectedItemColor: AppColors.dark.withOpacity(.4),
          currentIndex: currentIndex,
          onTap: onTap,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: _BottomNavIcon(iconPath: Icons.home),
              activeIcon: _BottomNavIcon(iconPath: Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _BottomNavIcon(iconPath: Icons.people_alt),
              activeIcon: _BottomNavIcon(iconPath: Icons.people_alt),
              label: 'My Network',
            ),
            BottomNavigationBarItem(
              icon: _BottomNavIcon(iconPath: Icons.add_box),
              activeIcon: _BottomNavIcon(iconPath: Icons.add_box),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: _BottomNavIcon(iconPath: Icons.notifications),
              activeIcon: _BottomNavIcon(iconPath: Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: _BottomNavIcon(iconPath: Icons.business_center),
              activeIcon: _BottomNavIcon(iconPath: Icons.business_center),
              label: 'Jobs',
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavIcon extends StatelessWidget {
  const _BottomNavIcon({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  final IconData iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Icon(iconPath),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
