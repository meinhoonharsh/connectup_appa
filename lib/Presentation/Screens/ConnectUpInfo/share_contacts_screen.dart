// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:connect_up/Constants/colors.dart';
import 'package:connect_up/Constants/locations.dart';
import 'package:connect_up/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:connect_up/Presentation/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareToContactsScreen extends StatefulWidget {
  const ShareToContactsScreen({Key? key}) : super(key: key);

  @override
  State<ShareToContactsScreen> createState() => _ExploreConnectUpScreenState();
}

class _ExploreConnectUpScreenState extends State<ShareToContactsScreen> {
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
        currentIndex: 1,
        mediaquery: mediaquery,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: mediaquery.height,
          width: mediaquery.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(AppImages.connectUpLogo)),
              const SizedBox(height: 15),
              Text(
                'Welcome to',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'CONNECT UP',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              // const SizedBox(height: 15),

              const SizedBox(height: 55),
              QrImage(
                data: "https://connectup.in",
                version: QrVersions.auto,
                size: mediaquery.width * 0.65,
                gapless: true,
                foregroundColor: Colors.white,
                embeddedImage: AssetImage('assets/images/logo.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(mediaquery.width * 0.2, mediaquery.width * 0.2),
                ),
              ),
              const SizedBox(height: 55),
              // const SizedBox(height: 20),  ],
            ],
          ),
        ),
      ),
    ));
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
