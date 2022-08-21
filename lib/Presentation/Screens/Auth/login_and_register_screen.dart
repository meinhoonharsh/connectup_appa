// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connect_up/Constants/colors.dart';
import 'package:connect_up/Constants/locations.dart';
// import 'package:connect_up/Presentation/Screens/Home/home_screen.dart';
import 'package:connect_up/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:connect_up/Presentation/Widgets/drawer.dart';
import 'package:connect_up/Presentation/Widgets/primary_button.dart';
import 'package:connect_up/Routes/routes.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginAndRegisterScreen extends StatefulWidget {
  const LoginAndRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginAndRegisterScreen> createState() => _LoginAndRegisterScreenState();
}

class _LoginAndRegisterScreenState extends State<LoginAndRegisterScreen> {
  bool isLogin = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool rememberMe = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // for testing purpose only in debug mode

  @override
  void initState() {
    // if (!kReleaseMode) {
    if (1 == 1) {
      emailController.text = "satyapsr13@gmail.com";
      passwordController.text = "123456";
      confirmPasswordController.text = "123456";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,

        // appBar: AppBar(),
        // bottomNavigationBar: MyBottomNavigationBar(
        //   currentIndex: 0,
        //   mediaquery: mediaquery,
        // ),
        drawer: const MyDrawer(),

        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              SizedBox(
                height: mediaquery.height,
                width: mediaquery.width,
                child: Image.asset(
                  AppImages.authBackgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(AppImages.connectUpLogo)),
                      const SizedBox(height: 15),
                      Text(
                        'Welcome to ',
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
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: isLogin
                                ? null
                                : () {
                                    setState(() {
                                      isLogin = true;
                                    });
                                  },
                            child: Container(
                              height: 50,
                              width: mediaquery.width * 0.35,
                              decoration: BoxDecoration(
                                  color: !isLogin
                                      ? Colors.transparent
                                      : AppColors.darkBlueColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  border: Border.all(
                                      width: 1,
                                      color: AppColors.darkBlueColor)),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: !isLogin
                                ? null
                                : () {
                                    setState(() {
                                      isLogin = false;
                                    });
                                  },
                            child: Container(
                              height: 50,
                              width: mediaquery.width * 0.35,
                              decoration: BoxDecoration(
                                  color: isLogin
                                      ? Colors.transparent
                                      : AppColors.darkBlueColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  border: Border.all(
                                      width: 1,
                                      color: AppColors.darkBlueColor)),
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: mediaquery.width * 0.85,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlueColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                'Account Login',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: emailController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Field can not be empty';
                                  }
                                  RegExp emailRegex = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                  if (!emailRegex.hasMatch(val)) {
                                    return "Enter a valid email";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  labelText: "Your Email",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: const Color(0xff7750f8),
                                        width: 1),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: passwordController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Field can not be empty';
                                  }
                                  // RegExp emailRegex = RegExp(
                                  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                  // if (!emailRegex.hasMatch(val)) {
                                  //   return "Enter a valid email";
                                  // }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: const Color(0xff7750f8),
                                        width: 1),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: !isLogin,
                                  child: const SizedBox(height: 20)),
                              Visibility(
                                visible: !isLogin,
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  controller: confirmPasswordController,
                                  validator: (val) {
                                    if (isLogin) {
                                      return null;
                                    }
                                    if (val!.isEmpty) {
                                      return 'Field can not be empty';
                                    }
                                    if (val.toString() !=
                                        passwordController.text) {
                                      return 'Password should be same!';
                                    }
                                    // RegExp emailRegex = RegExp(
                                    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                    // if (!emailRegex.hasMatch(val)) {
                                    //   return "Enter a valid email";
                                    // }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                      borderSide: BorderSide(
                                          color: const Color(0xff7750f8),
                                          width: 1),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: !isLogin,
                                  child: const SizedBox(height: 20)),

                              // Row(
                              //   children: [
                              //     Text(
                              //       'Remember me ',
                              //       style: const TextStyle(),
                              //     ),
                              //   ],
                              // ),

                              const SizedBox(height: 40),
                              PrimaryButton(
                                  onPressed: () {
                                    // if (_formKey.currentState!.validate()) {}
                                    context.pushRoute(HomeScreen());
                                  },
                                  buttonText: isLogin ? "Login" : "Register"),
                              const SizedBox(height: 20),
                              Text(
                                '${isLogin ? 'Login' : 'Register'} with your Social Account',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(AppIcons.google,
                                            fit: BoxFit.cover)),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(AppIcons.github,
                                              fit: BoxFit.cover),
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(AppIcons.linkedin,
                                              fit: BoxFit.cover),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // PrimaryButton(onPressed: () {}, buttonText: ""),
                      SizedBox(height: mediaquery.height * 0.1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //floatingActionButton: FloatingActionButton(onPressed: (){},),
      ),
    );
  }
}
