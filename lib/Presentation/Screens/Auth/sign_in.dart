// import 'dart:html';

// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semikolan_app/Constants/colors.dart';
import 'package:semikolan_app/Constants/enums.dart';
import 'package:semikolan_app/Constants/locations.dart';
import 'package:semikolan_app/Data/services/google_sign_in_api.dart';
import 'package:semikolan_app/Logic/Cubit/auth_cubit/auth_cubit.dart';
import 'package:semikolan_app/Presentation/Widgets/primary_button.dart';
import 'package:semikolan_app/Presentation/Widgets/snackbar.dart';
import 'package:semikolan_app/Routes/routes.gr.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isVisible = true;

  TextEditingController emailController =
      TextEditingController(text: "test@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "Test@123");

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.loggedIn) {
          showSnackBar(context, Colors.green, "Successfully LoggedIn!");
        }
        if (state.status == AuthStatus.unauthorized) {
          showSnackBar(
              context, Colors.red, "${state.message}.Please try again");
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Stack(children: [
                Container(
                  height: mediaquery.height * 0.4,
                  width: mediaquery.width,
                  decoration: BoxDecoration(
                    gradient: linearGradient(),
                  ),
                  child: Center(
                    child: SizedBox(
                        height: mediaquery.height * 0.35,
                        width: mediaquery.width * 0.75,
                        child: Image.asset(
                          AppImages.signInImg,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                SizedBox(
                  width: mediaquery.width,
                  child: Column(
                    children: [
                      SizedBox(height: mediaquery.height * 0.35),
                      Container(
                        // height: mediaquery.height * 0.2,
                        width: mediaquery.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            TextFormField(
                              controller: emailController,
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
                                hintText: "Email",
                                fillColor: const Color(0xffE6F1FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: mediaquery.width * 0.87,
                                ),
                                filled: true,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              obscureText: isVisible,
                              controller: passwordController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field can not be empty';
                                }
                                if (val.length < 6) {
                                  return 'Password must be greater than 6 digits.';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    icon: Icon(
                                      isVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off_outlined,
                                      size: 20,
                                      color: const Color(0xff242424),
                                    )),
                                hintText: "password",
                                fillColor: const Color(0xffE6F1FF),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: mediaquery.width * 0.87,
                                ),
                                filled: true,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'FORGOT PASSWORD',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff0A192F)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                              return PrimaryButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // context.pushRoute(const HomeScreen());
                                    BlocProvider.of<AuthCubit>(context)
                                        .loginUser(emailController.text,
                                            passwordController.text);
                                  }
                                },
                                buttonText: "LOG IN",
                                isLoading: state.status == AuthStatus.loggingIn,
                              );
                            }),
                            const SizedBox(height: 20),
                            const Text(
                              'OR LOG IN BY',
                              textScaleFactor: 1,
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Spacer(
                                  flex: 4,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: const Color(0xffE6F1FF),
                                  child: IconButton(
                                      onPressed: () {
                                        // googleSignIn();
                                      },
                                      icon: const Icon(
                                        Icons.g_mobiledata,
                                        color: Color(0xff0A192F),
                                        size: 30,
                                      )),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: const Color(0xffE6F1FF),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.facebook_sharp,
                                        color: Color(0xff0A192F),
                                        size: 20,
                                      )),
                                ),
                                const Spacer(
                                  flex: 4,
                                ),
                              ],
                            ),
                            SizedBox(height: mediaquery.height * 0.03),
                            Row(
                              children: [
                                const Spacer(),
                                const Text(
                                  "Don't have account?",
                                  style: TextStyle(),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.replaceRoute(const SignUpScreen());
                                  },
                                  child: const Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0A192F)),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            SizedBox(height: mediaquery.height * 0.1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future googleSignIn(BuildContext context, AuthCubit authCubit) async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      showSnackBar(context, Colors.red, "Failed to Sinup. Please try again!");
    } else {
      authCubit.registerUserWithGoogle(user.displayName.toString(),
          user.email.toString(), "", user.photoUrl.toString(), "googleID");
      log("User, ${user.toString()}");
    }
  }
}
