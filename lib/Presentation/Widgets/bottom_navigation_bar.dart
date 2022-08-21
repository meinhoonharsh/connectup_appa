// ignore_for_file: prefer_const_constructors
import 'package:auto_route/auto_route.dart';
import 'package:connect_up/Routes/routes.gr.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.mediaquery,
  }) : super(key: key);

  final int currentIndex;
  final Size mediaquery;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaquery.width,
      color: const Color(0xff7750f8),
      child: FloatingNavbar(
        onTap: (int val) {
          switch (val) {
            case 0:
              context.pushRoute(HomeScreen());

              break;
            case 1:
              context.pushRoute(ExploreConnectUpScreen());

              break;
            case 2:
              break;
            case 3:
              context.pushRoute(UserProfileInfoScreen());
              break;
            case 4:
              context.pushRoute(UserProfileScreen());
              // context.pushRoute(UserProfileScreen());

              break;
            default:
            // context.pushRoute(HomeScreen());
          } //returns tab id which is user tapped
        },
        backgroundColor: const Color(0xff7750f8),
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        selectedBackgroundColor: Colors.transparent,
        currentIndex: currentIndex,
        items: [
          FloatingNavbarItem(icon: Icons.shopping_bag, title: 'Home'),
          FloatingNavbarItem(
              icon: Icons.emoji_emotions_outlined, title: 'Explore'),
          FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
          FloatingNavbarItem(icon: Icons.person_add, title: 'Edit'),
          FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors
// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';

// class MyBottomNavigationBar extends StatefulWidget {
//     MyBottomNavigationBar({
//     Key? key,
//     required this.currentIndex,
//   }) : super(key: key);

//     int currentIndex;

//   @override
//   State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaquery = MediaQuery.of(context).size;
//     return Container(
//       width: mediaquery.width,
//       color: const Color(0xff7750f8),

//       child: FloatingNavbar(
//         onTap: (int val) {
//           switch (val) {
//             case 0:
//               // context.pushRoute(HomeScreen());

//               break;
//             case 1:
//               // context.pushRoute(IntrestScreen());
//               setState(() {
//                 widget.currentIndex = 1;
//               });
//               break;
//             case 2:
//               // context.pushRoute(ComingSoonScreen());

//               break;
//             case 3:
//               // context.pushRoute(UserProfileScreen());

//               break;
//             case 4:
//               // context.pushRoute(UserProfileScreen());

//               break;
//             default:
//             // context.pushRoute(HomeScreen());
//           } //returns tab id which is user tapped
//         },
//         backgroundColor: const Color(0xff7750f8),
//         unselectedItemColor: Colors.white.withOpacity(0.5),
//         selectedItemColor: Colors.white,
//         selectedBackgroundColor: Colors.transparent,
//         currentIndex: widget.currentIndex,

//         items: [
//           FloatingNavbarItem(icon: Icons.shopping_bag, title: 'Home'),
//           FloatingNavbarItem(
//               icon: Icons.emoji_emotions_outlined, title: 'Explore'),
//           FloatingNavbarItem(icon: Icons.chat_sharp, title: 'Explore'),
//           FloatingNavbarItem(icon: Icons.notifications, title: 'Chats'),
//           FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
//         ],
//       ),
//     );
//   }
// }
