// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:connect_up/Constants/colors.dart';
import 'package:connect_up/Data/services/secure_storage.dart';
import 'package:connect_up/Presentation/Widgets/coming_soon_label.dart';
import 'package:connect_up/Presentation/Widgets/primary_button.dart';
import 'package:connect_up/Routes/routes.gr.dart';
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
                    // CircleAvatar(
                    //   backgroundColor: Colors.grey,
                    //   minRadius: 25,
                    //   child: const Icon(
                    //     Icons.person,
                    //     color: Colors.white,
                    //     size: 35,
                    //   ),
                    // ),
                    // ClipPath(
                    //   clipper: HexagonClipper(),
                    //   child: Container(
                    //     width: 60,

                    //     /// controll the size and color
                    //     height: 60,
                    //     decoration: BoxDecoration(
                    //       color: Colors.green,
                    //       // color: Colors.grey,
                    //       // borderRadius: BorderRadius.circular(25),
                    //     ),
                    //     child: Center(
                    //       child: ClipPath(
                    //         clipper: HexagonClipper(),
                    //         child: Container(
                    //           width: 50,

                    //           /// controll the size and color
                    //           height: 50,
                    //           decoration: BoxDecoration(
                    //             color: Colors.grey,
                    //             // borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           child: Center(
                    //             child: CircleAvatar(
                    //               backgroundColor: Colors.grey,
                    //               minRadius: 25,
                    //               child: const Icon(
                    //                 Icons.person,
                    //                 color: Colors.white,
                    //                 size: 35,
                    //               ),
                    //             ),
                    //             // ClipPath(
                    //             //   clipper: HexagonClipper(),
                    //             //   child: Container(
                    //             //     width: 45,

                    //             //     /// controll the size and color
                    //             //     height: 45,
                    //             //     color: Colors.amber,
                    //             //   ),
                    //             // ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

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
                          'Satya Prakash',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'ConnectUp',
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
                    context.replaceRoute(LoginAndRegisterScreen());
                  },
                  buttonText: 'Logout',
                  isHalfSize: true,
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

                SizedBox(
                  height: mediaquery.height * 0.7,
                  child: ListView(
                    children: [
                      DrawerButton(
                          ontap: () {
                            // context.replaceRoute(UserProfileInfoScreen());
                            context.replaceRoute(HomeScreen());
                          },
                          title: "Dashboard",
                          leadIcon: Icons.bar_chart_rounded),
                      sizedBoxSpacer(),
                      CommingSoonLabel(
                        child: DrawerButton(
                          ontap: () {},
                          title: "Feed",
                          leadIcon: Icons.analytics_outlined,
                        ),
                      ),
                      sizedBoxSpacer(),
                      DrawerButton(
                        ontap: () {
                          context.replaceRoute(UserProfileInfoScreen());
                        },
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
                          ontap: () {
                            context.replaceRoute(UserStartUpInfoScreen());
                          },
                          title: "Startups",
                          leadIcon: Icons.star_outline_outlined),
                      sizedBoxSpacer(),
                      DrawerButton(
                        ontap: () {
                          // context.replaceRoute(PersonalDetailsScreen());
                        },
                        title: "Events",
                        leadIcon: Icons.calendar_month_outlined,
                      ),
                      sizedBoxSpacer(),
                      DrawerButton(
                          ontap: () {
                            // context.replaceRoute(BasicInfo());
                          },
                          title: "Forums",
                          leadIcon: Icons.format_paint_outlined),
                      sizedBoxSpacer(),
                      DrawerButton(
                          ontap: () {
                            // context.replaceRoute(RemindersScreen());
                          },
                          title: "Join Startup",
                          leadIcon: Icons.shopping_bag_rounded),
                      sizedBoxSpacer(),
                      SizedBox(height: mediaquery.height * 0.1),
                    ],
                  ),
                ),
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

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4484802, size.height * 0.3452079);
    path0.lineTo(size.width * 0.4937050, size.height * 0.3001905);
    path0.lineTo(size.width * 0.5395414, size.height * 0.3419515);
    path0.lineTo(size.width * 0.5398651, size.height * 0.4376328);
    path0.lineTo(size.width * 0.4937050, size.height * 0.4838799);
    path0.lineTo(size.width * 0.4487410, size.height * 0.4312933);
    path0.lineTo(size.width * 0.4484802, size.height * 0.3452079);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..moveTo(size.width / 2, 0) // moving to topCenter 1st, then draw the path
      ..lineTo(size.width, size.height * .25)
      ..lineTo(size.width, size.height * .75)
      ..lineTo(size.width * .5, size.height)
      ..lineTo(0, size.height * .75)
      ..lineTo(0, size.height * .25)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
