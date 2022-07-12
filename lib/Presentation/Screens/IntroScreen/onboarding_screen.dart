// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:semikolan_app/Constants/colors.dart';
import 'package:semikolan_app/Constants/locations.dart';
import 'package:semikolan_app/Routes/routes.gr.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: mediaquery.height,
        width: mediaquery.width,
        decoration: BoxDecoration(
          gradient: linearGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: mediaquery.height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.semikolanLogoImg),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'SemiKolan',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: mediaquery.height * 0.05),
            SizedBox(
                height: mediaquery.height * 0.2,
                width: mediaquery.width * 0.75,
                child: Image.asset(
                  AppImages.onBoardingImg,
                  fit: BoxFit.cover,
                )),
            SizedBox(height: mediaquery.height * 0.05),
            Text(
              'NEVER STOP BUILDING',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            SizedBox(height: mediaquery.height * 0.05),
            InkWell(
              onTap: () {
                context.pushRoute(SignInScreen());
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff8892B0),
                ),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child:
                     Text(
                      'GET STARTED',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
