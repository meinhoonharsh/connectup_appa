// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:semikolan_app/Data/services/secure_storage.dart';
// import 'package:nhsbpmonitor/constants/locations.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawer2State createState() => _MyDrawer2State();
}

class _MyDrawer2State extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          height: mediaquery.height - 20,
          decoration: BoxDecoration(
            color: Color(0xff23A6B1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // cancelButton(context),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                          'PT0003',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'view_and_edit_profile',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      minRadius: 25,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Divider(
                  color: Colors.white.withOpacity(0.1),
                  thickness: 1,
                ),
                SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      // context.replaceRoute(HomeScreen());
                    },
                    title: "home"),
                SizedBox(height: 20),
                DrawerButton(ontap: () {}, title: "my_appoinments"),
                SizedBox(height: 20),
                DrawerButton(ontap: () {}, title: "my_doctor"),
                SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      // context.pushRoute(PregnancyDetails());
                    },
                    title: "pregnancy_details"),
                SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      // context.pushRoute(PersonalDetailsScreen());
                    },
                    title: "personal_details"),
                SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      // context.pushRoute(BasicInfo());
                    },
                    title: "settings"),
                SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      // context.pushRoute(RemindersScreen());
                    },
                    title: "reminders"),
                SizedBox(height: 20),
                DrawerButton(
                    ontap: () {
                      final storage = SecureStorage();
                      storage.deleteAll();
                      // context.replaceRoute(const OnBoardingScreen());
                      // context.replaceRouteonst OnBoardingScreen());
                    },
                    title: "logout"),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key? key,
    required this.ontap,
    required this.title,
  }) : super(key: key);

  final void Function()? ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
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
    );
  }
}
