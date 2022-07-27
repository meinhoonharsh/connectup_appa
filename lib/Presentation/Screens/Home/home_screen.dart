// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:auto_route/auto_route.dart';
import 'package:connect_up/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:connect_up/Presentation/Widgets/comind_soon_page.dart';
import 'package:flutter/material.dart';
// import 'package:semikolan_app/Presentation/Widgets/bottom_navigation_bar.dart';
// import 'package:semikolan_app/Presentation/Screens/UserProfile/user_profile_screen.dart';
// import 'package:semikolan_app/Presentation/Widgets/homepage_user_profile_card.dart';
// import 'package:semikolan_app/Routes/routes.gr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  // implement search delegate
                  showSearch(context: context, delegate: SearchScreen());
                },
                child: Container(
                  height: 40,
                  width: mediaquery.width,
                  decoration: BoxDecoration(
                    color: Color(0xffE6F1FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const Spacer(flex: 2),
                      const Icon(
                        Icons.search,
                        color: Color(0xff0A192F),
                        size: 20,
                      ),
                      Text(
                        'search',
                        style: const TextStyle(
                            color: Color(0xff0A192F), fontSize: 15),
                      ),
                      const Spacer(flex: 20),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.telegram,
                  color: Color(0xff0A192F),
                  size: 30,
                ),
                tooltip: 'search',
                onPressed: () {
                  // context.pushRoute(ComingSoonScreen());
                },
              ),
            ],
            bottom: TabBar(
              // isScrollable: true,
              labelColor: Color(0xff0A192F),

              indicatorColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 20,
                color: Color(0xff0A192F),
              ),
              tabs: [
                Tab(
                  text: 'For You',
                ),
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Updates',
                ),
              ],
            ),
          ),
          // drawer: ,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff0A192F),
            onPressed: () {
              // context.pushRoute(ComingSoonScreen());
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
          bottomNavigationBar: MyBottomNavigationBar(
              currentIndex: 0), // backgroundColor: Colors.black87,
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    // ListView.separated(
                    //   itemCount: 3,
                    //   itemBuilder: (ctx, index) => HomePageUserProfileCard(
                    //       mediaQuery: mediaquery,
                    //       name: "Semikolan",
                    //       image: "https://picsum.photos/200",
                    //       contentImage: "https://picsum.photos/800",
                    //       time: DateTime.now(),
                    //       title: "Semikolan",
                    //       description: "Welcome to semikolan Mobile App"),
                    //   separatorBuilder: (BuildContext context, int index) {
                    //     return SizedBox(height: 10);
                    //   },
                    // ),
                    // ListView.separated(
                    //   itemCount: 20,
                    //   itemBuilder: (ctx, index) => HomePageUserProfileCard(
                    //       mediaQuery: mediaquery,
                    //       name: "Semikolan",
                    //       image: "https://picsum.photos/200",
                    //       contentImage: "https://picsum.photos/200",
                    //       time: DateTime.now(),
                    //       title: "Semikolan",
                    //       description: "Welcome to semikolan Mobile App"),
                    //   separatorBuilder: (BuildContext context, int index) {
                    //     return SizedBox(height: 10);
                    //   },
                    // ),
                    // ListView.separated(
                    //   itemCount: 1,
                    //   itemBuilder: (ctx, index) => HomePageUserProfileCard(
                    //       mediaQuery: mediaquery,
                    //       name: "Semikolan",
                    //       image: "https://picsum.photos/200",
                    //       contentImage: "https://picsum.photos/200",
                    //       time: DateTime.now(),
                    //       title: "Semikolan",
                    //       description: "Welcome to semikolan Mobile App"),
                    //   separatorBuilder: (BuildContext context, int index) {
                    //     return SizedBox(height: 10);
                    //   },
                    // ),


                  ],
                ),
              ),
              // SizedBox(height: mediaquery.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
     return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return Container();
  }
}
