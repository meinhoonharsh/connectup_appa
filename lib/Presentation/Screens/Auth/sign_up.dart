// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'dart:html';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semikolan_app/Constants/colors.dart';
import 'package:semikolan_app/Constants/enums.dart';
import 'package:semikolan_app/Constants/locations.dart';
import 'package:semikolan_app/Logic/Cubit/auth_cubit/auth_cubit.dart';
import 'package:semikolan_app/Presentation/Widgets/primary_button.dart';
import 'package:semikolan_app/Presentation/Widgets/snackbar.dart';
import 'package:semikolan_app/Routes/routes.gr.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isVisible = false;
  TextEditingController emailController =
      TextEditingController(text: "test@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "Test@123");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "Test@122");

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.loggedIn) {
          showSnackBar(context, Colors.green, "Successfully SignUp");
          context.replaceRoute(IntrestScreen());
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
                          AppImages.signUpImg,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                SizedBox(
                  // height: mediaquery.height * 0.7,
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
                            SizedBox(height: 40),
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
                                fillColor: Color(0xffE6F1FF),
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
                              obscureText: !isVisible,
                              controller: passwordController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field can not be empty';
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
                                      color: Color(0xff242424),
                                    )),
                                hintText: "Password",
                                fillColor: Color(0xffE6F1FF),
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
                            TextFormField(
                              obscureText: !isVisible,
                              controller: confirmPasswordController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field can not be empty';
                                }
                                if (val.toString() != passwordController.text) {
                                  setState(() {
                                    isVisible = true;
                                  });
                                  return "Password must be same";
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
                                      color: Color(0xff242424),
                                    )),
                                hintText: "Confirm password",
                                fillColor: Color(0xffE6F1FF),
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
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'FORGOT PASSWORD',
                                textScaleFactor: 1,
                                style: const TextStyle(
                                    fontSize: 15, color: Color(0xff0A192F)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                              return PrimaryButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(context)
                                        .registerUser(
                                            emailController.text,
                                            passwordController.text,
                                            passwordController.text);
                                  }
                                },
                                buttonText: "Sign Up",
                                isLoading: state.status == AuthStatus.loggingIn,
                              );
                            }),
                            const SizedBox(height: 20),
                            Text(
                              'OR LOG IN BY',
                              textScaleFactor: 1,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Spacer(
                                  flex: 4,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xffE6F1FF),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.g_mobiledata,
                                        color: Color(0xff0A192F),
                                        size: 30,
                                      )),
                                ),
                                const Spacer(flex: 1),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xffE6F1FF),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.facebook_sharp,
                                        color: Color(0xff0A192F),
                                        size: 20,
                                      )),
                                ),
                                const Spacer(flex: 4),
                              ],
                            ),
                            SizedBox(height: mediaquery.height * 0.03),
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  "Have an account?",
                                  style: const TextStyle(),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.replaceRoute(SignInScreen());
                                  },
                                  child: Text(
                                    'LOG IN',
                                    style: const TextStyle(
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
}
