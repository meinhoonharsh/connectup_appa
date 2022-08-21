// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:connect_up/Constants/colors.dart';
import 'package:connect_up/Constants/locations.dart';
import 'package:connect_up/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:connect_up/Presentation/Widgets/comind_soon_page.dart';
import 'package:connect_up/Presentation/Widgets/coming_soon_label.dart';
import 'package:connect_up/Presentation/Widgets/drawer.dart';
import 'package:connect_up/Presentation/Widgets/primary_button.dart';
import 'package:connect_up/Presentation/Widgets/user_post_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

// scroll controller for the list view
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    const data = '@semikolan';
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xff7750f8),
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(AppImages.connectUpLogo),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.horizontal_split_rounded,
                color: Colors.white,
              ),
              tooltip: 'Drawer',
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: AppColors.darkBlueColor,
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 4,
          mediaquery: mediaquery,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: mediaquery.width * 0.87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 43, 50, 68),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      profileAndBackGroundImage(mediaquery),
                      const SizedBox(height: 55),
                      
                      const SizedBox(height: 55),
                      // const SizedBox(height: 20),

                      Text(
                        'ConnectUp',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '@connectup',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      // SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  _scrollController.animateTo(-200,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 50,
                              width: mediaquery.width * 0.5,
                              child: ListView(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.apple,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.mail,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.apple,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.mail,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.apple,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.mail,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  _scrollController.animateTo(200,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      // SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '1',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'posts',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                            // verticle divider
                            verticleLine(),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '1',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                            verticleLine(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '1',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Visits',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      SecondryButton(
                        onPressed: () {},
                        buttonText: 'Follow',
                        isHalfSize: true,
                        color: Colors.green,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              CommingSoonLabel(
                child: UserPostCard(
                  mediaQuery: mediaquery,
                  title: 'title',
                  image: 'https://picsum.photos/200',
                  time: DateTime.now(),
                  name: 'Name',
                  description:
                      // "It is discription It is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discription",
                      "ConnectUp Post " * 50,
                  contentImage: "https://picsum.photos/200",
                ),
              ),
              SizedBox(height: 20),
              UserPostCard(
                mediaQuery: mediaquery,
                title: 'title',
                image: 'https://picsum.photos/200',
                time: DateTime.now(),
                name: 'Name',
                description:
                    // "It is discription It is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discription",
                    "ConnectUp Post " * 50,
                contentImage: "https://picsum.photos/200",
              ),
              SizedBox(height: 20),
              UserPostCard(
                mediaQuery: mediaquery,
                title: 'title',
                image: 'https://picsum.photos/200',
                time: DateTime.now(),
                name: 'Name',
                description:
                    // "It is discription It is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discriptionIt is discription",
                    "ConnectUp Post " * 50,
                contentImage: "https://picsum.photos/200",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Stack profileAndBackGroundImage(Size mediaquery) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: mediaquery.height * 0.15,
              width: mediaquery.width * 0.87,
              child: Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Positioned(
        //   top: 10,
        //   child: SizedBox(
        //     height: 100,
        //     width: mediaquery.width,
        //     child: Row(
        //       children: [
        //         const Spacer(
        //           flex: 2,
        //         ),
        //         Text(
        //           data,
        //           style: const TextStyle(
        //               color: Colors.white, fontSize: 15),
        //         ),
        //         const Spacer(
        //           flex: 1,
        //         ),
        //         IconButton(
        //             onPressed: () {},
        //             icon: const Icon(
        //               Icons.settings,
        //               color: Colors.white,
        //               size: 20,
        //             )),
        //       ],
        //     ),
        //   ),
        // ),

        Positioned(
          bottom: -40,
          left: mediaquery.width * 0.87 * 0.5 - 55,
          child: Container(
            height: 110,
            width: 110,
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  'https://picsum.photos/200',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container verticleLine() {
    return Container(
      height: 25,
      width: 2,
      color: Colors.white.withOpacity(0.3),
    );
  }
}
