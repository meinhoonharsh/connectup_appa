// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:auto_route/auto_route.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.popRoute();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff0A192F),
              size: 20,
            )),
      ),
      body: Center(
        child: Container(
          height: mediaquery.height * 0.2,
          width: mediaquery.width * 0.5,
          child: Lottie.asset('assets/lottiefiles/comingsoon.json',
              fit: BoxFit.cover),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var mediaquery = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 300,
        width: 300,
        child: Lottie.asset('assets/lottiefiles/comingsoon.json',
            fit: BoxFit.cover),
      ),
    );
  }
}
