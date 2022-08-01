// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:connect_up/Constants/colors.dart';
import 'package:connect_up/Constants/locations.dart';
import 'package:connect_up/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:connect_up/Presentation/Widgets/comind_soon_page.dart';
import 'package:connect_up/Presentation/Widgets/drawer.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
          currentIndex: 3,
          mediaquery: mediaquery,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: mediaquery.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                height: mediaquery.height * 0.15,
                                width: mediaquery.width * 0.8,
                                // decoration: BoxDecoration(
                                //   color: Color(0xff0A192F),
                                //   borderRadius: BorderRadius.vertical(
                                //       bottom: Radius.elliptical(
                                //           MediaQuery.of(context).size.width * 0.5, 50.0)),
                                // ),
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
                            left: mediaquery.width * 0.8 * 0.5 - 55,
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
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
                      ),
                      const SizedBox(height: 75),
                      const SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: mediaquery.width * 0.85,
                        decoration: BoxDecoration(
                          color: Color(0xffE6F1FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '1M Followers',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff0A192F),
                              ),
                            ),
                            Text(
                              '10 Following',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff0A192F),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: mediaquery.width * 0.65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.workspaces_outlined,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.wechat_outlined,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.facebook,
                                  size: 30,
                                )),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: mediaquery.height * 0.4,
                      //   width: mediaquery.width,
                      //   child: DefaultTabController(
                      //     length: 2,
                      //     initialIndex: 0,
                      //     child: Scaffold(
                      //       // // backgroundColor: Colors.black87,

                      //       body: Column(
                      //         children: [
                      //           SizedBox(
                      //             height: 80,
                      //             child: AppBar(
                      //               backgroundColor: Colors.white,
                      //               elevation: 0,
                      //               bottom: TabBar(
                      //                 labelColor: Color(0xff0A192F),
                      //                 indicatorColor: Colors.black,
                      //                 tabs: [
                      //                   Tab(
                      //                     text: 'POSTS',
                      //                   ),
                      //                   Tab(
                      //                     text: 'PROJECTS',
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //           Expanded(
                      //             child: TabBarView(
                      //               children: [
                      //                 // first tab bar view widget
                      //                 ComingSoonWidget(),
                      //                 //  ComingSoonWidget(),

                      //                 // second tab bar viiew widget
                      //                 Container(
                      //                   color: Colors.white,
                      //                   child: Center(
                      //                     child: Text(
                      //                       'projects',
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: mediaquery.height * 0.1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
