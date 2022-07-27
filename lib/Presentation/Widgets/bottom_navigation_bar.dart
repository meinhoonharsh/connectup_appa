// ignore_for_file: prefer_const_constructors
import 'package:auto_route/auto_route.dart';
import 'package:connect_up/Presentation/Widgets/comind_soon_page.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      onTap: (int val) {
        switch (val) {
          case 0:
            // context.pushRoute(HomeScreen());

            break;
          case 1:
            // context.pushRoute(IntrestScreen());

            break;
          case 2:
            // context.pushRoute(ComingSoonScreen());

            break;
          case 3:
            // context.pushRoute(UserProfileScreen());

            break;
          default:
          // context.pushRoute(HomeScreen());
        } //returns tab id which is user tapped
      },
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xff0A192F).withOpacity(0.7),
      currentIndex: currentIndex,
      items: [
        FloatingNavbarItem(icon: Icons.home, title: 'Home'),
        FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
        FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
        FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
      ],
    );
  }
}
