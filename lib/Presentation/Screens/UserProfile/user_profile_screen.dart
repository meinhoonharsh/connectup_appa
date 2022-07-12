// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:semikolan_app/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:semikolan_app/Presentation/Widgets/comind_soon_page.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    var data = '@semikolan';
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: 3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: mediaquery.height * 0.25,
                  width: mediaquery.width,
                  decoration: BoxDecoration(
                    color: Color(0xff0A192F),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.5, 50.0)),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: SizedBox(
                    height: 100,
                    width: mediaquery.width,
                    child: Row(
                      children: [
                        const Spacer(
                          flex: 2,
                        ),
                        Text(
                          data,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -75,
                  left: mediaquery.width * 0.5 - 75,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
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
            Text(
              'Semikolan',
              style: const TextStyle(
                  fontSize: 30,
                  color: Color(0xff0A192F),
                  fontWeight: FontWeight.bold),
            ),
            // const SizedBox(height: 5),
            Text(
              'Developer Community',
              style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff0A192F),
                  fontWeight: FontWeight.bold),
            ),
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
            SizedBox(
              height: mediaquery.height * 0.4,
              width: mediaquery.width,
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Scaffold(
                  // // backgroundColor: Colors.black87,

                  body: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: AppBar(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          bottom: TabBar(
                            labelColor: Color(0xff0A192F),
                            indicatorColor: Colors.black,
                            tabs: [
                              Tab(
                                text: 'POSTS',
                              ),
                              Tab(
                                text: 'PROJECTS',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // first tab bar view widget
                            ComingSoonWidget(),
                            //  ComingSoonWidget(),

                            // second tab bar viiew widget
                            Container(
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  'projects',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
             SizedBox(height: mediaquery.height * 0.1),
          ],
        ),
      ),
    );
  }
}
