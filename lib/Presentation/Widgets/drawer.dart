// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:connect_up/Constants/colors.dart';
import 'package:connect_up/Data/services/secure_storage.dart';
import 'package:connect_up/Presentation/Widgets/primary_button.dart';
import 'package:flutter/material.dart';
// import 'package:nhsbpmonitor/constants/locations.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawer2State createState() => _MyDrawer2State();
}

class _MyDrawer2State extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          height: mediaquery.height,
          decoration: BoxDecoration(
            color: AppColors.darkBlueColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // cancelButton(context),
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white.withOpacity(0.6),
                            size: 20,
                          )),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // const Spacer(flex: 1),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      minRadius: 25,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mrs. Lorem Ipsum',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'connectUp',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        // const SizedBox(height: 5),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Text(
                        //     'view_and_edit_profile',
                        //     style: TextStyle(
                        //         decoration: TextDecoration.underline,
                        //         color: Colors.white.withOpacity(0.8),
                        //         fontSize: 12),
                        //   ),
                        // ),
                      ],
                    ),
                    const Spacer(
                      flex: 10,
                    ),
                  ],
                ),
                sizedBoxSpacer(),
                PrimaryButton(
                  onPressed: () {
                    final storage = SecureStorage();
                    storage.deleteAll();
                  },
                  buttonText: 'Logout',
                  isHalfSize: true,
                  isLoading: true,
                ),
                Divider(
                  color: Colors.white.withOpacity(0.1),
                  thickness: 1,
                ),
                sizedBoxSpacer(),
                Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                sizedBoxSpacer(),
                DrawerButton(
                    ontap: () {
                      // context.replaceRoute(HomeScreen());
                    },
                    title: "Dashboard",
                    leadIcon: Icons.bar_chart_rounded),
                sizedBoxSpacer(),
                DrawerButton(
                  ontap: () {},
                  title: "Feed",
                  leadIcon: Icons.analytics_outlined,
                ),
                sizedBoxSpacer(),
                DrawerButton(
                  ontap: () {},
                  title: "User Account",
                  leadIcon: Icons.person,
                ),
                sizedBoxSpacer(),
                DrawerButton(
                    ontap: () {},
                    title: "Members",
                    leadIcon: Icons.people_outline_rounded),
                sizedBoxSpacer(),
                DrawerButton(
                    ontap: () {},
                    title: "Startups",
                    leadIcon: Icons.star_outline_outlined),
                sizedBoxSpacer(),
                DrawerButton(
                  ontap: () {
                    // context.pushRoute(PersonalDetailsScreen());
                  },
                  title: "Events",
                  leadIcon: Icons.calendar_month_outlined,
                ),
                sizedBoxSpacer(),
                DrawerButton(
                    ontap: () {
                      // context.pushRoute(BasicInfo());
                    },
                    title: "Forums",
                    leadIcon: Icons.format_paint_outlined),
                sizedBoxSpacer(),
                DrawerButton(
                    ontap: () {
                      // context.pushRoute(RemindersScreen());
                    },
                    title: "Join Startup",
                    leadIcon: Icons.shopping_bag_rounded),
                sizedBoxSpacer(),
                // DrawerButton(
                //     ontap: () {
                //       final storage = SecureStorage();
                //       storage.deleteAll();
                //       // context.replaceRoute(const OnBoardingScreen());
                //       // context.replaceRouteonst OnBoardingScreen());
                //     },
                //     title: "logout"),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox sizedBoxSpacer() => const SizedBox(height: 15);
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key? key,
    required this.ontap,
    required this.title,
    required this.leadIcon,
  }) : super(key: key);

  final void Function()? ontap;
  final String title;
  final IconData leadIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: ontap,
            icon: Icon(
              leadIcon,
              size: 20,
              color: Colors.white.withOpacity(0.6),
            )),
        TextButton(
          onPressed: ontap,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
