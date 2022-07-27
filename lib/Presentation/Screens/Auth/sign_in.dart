// // import 'dart:html';

// // ignore_for_file: use_build_context_synchronously

// import 'dart:developer';

// import 'package:auto_route/auto_route.dart';
// import 'package:connect_up/Constants/enums.dart';
// import 'package:connect_up/Constants/locations.dart';
// import 'package:connect_up/Logic/Cubit/auth_cubit/auth_cubit.dart';
// import 'package:connect_up/Presentation/Widgets/snackbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:semikolan_app/Constants/colors.dart';
// import 'package:semikolan_app/Constants/enums.dart';
// import 'package:semikolan_app/Constants/locations.dart';
// import 'package:semikolan_app/Data/services/google_sign_in_api.dart';
// import 'package:semikolan_app/Logic/Cubit/auth_cubit/auth_cubit.dart';
// import 'package:semikolan_app/Presentation/Widgets/primary_button.dart';
// import 'package:semikolan_app/Presentation/Widgets/snackbar.dart';
// import 'package:semikolan_app/Routes/routes.gr.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   bool isVisible = true;

//   TextEditingController emailController =
//       TextEditingController(text: "test@gmail.com");
//   TextEditingController passwordController =
//       TextEditingController(text: "Test@123");

//   @override
//   void initState() {
//     super.initState();
//   }

//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final mediaquery = MediaQuery.of(context).size;
//     return BlocListener<AuthCubit, AuthState>(
//       listener: (context, state) {
//         if (state.status == AuthStatus.loggedIn) {
//           showSnackBar(context, Colors.green, "Successfully LoggedIn!");
//         }
//         if (state.status == AuthStatus.unauthorized) {
//           showSnackBar(
//               context, Colors.red, "${state.message}.Please try again");
//         }
//       },
//       child: SafeArea(
//         child: Scaffold(
//           body: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Stack(children: [
//                 Container(
//                   height: mediaquery.height * 0.4,
//                   width: mediaquery.width,
//                   decoration: BoxDecoration(
//                     gradient: linearGradient(),
//                   ),
//                   child: Center(
//                     child: SizedBox(
//                         height: mediaquery.height * 0.35,
//                         width: mediaquery.width * 0.75,
//                         child: Image.asset(
//                           AppImages.signInImg,
//                           fit: BoxFit.cover,
//                         )),
//                   ),
//                 ),
//                 SizedBox(
//                   width: mediaquery.width,
//                   child: Column(
//                     children: [
//                       SizedBox(height: mediaquery.height * 0.35),
//                       Container(
//                         // height: mediaquery.height * 0.2,
//                         width: mediaquery.width,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Column(
//                           children: [
//                             const SizedBox(height: 40),
//                             TextFormField(
//                               controller: emailController,
//                               validator: (val) {
//                                 if (val!.isEmpty) {
//                                   return 'Field can not be empty';
//                                 }
//                                 RegExp emailRegex = RegExp(
//                                     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//                                 if (!emailRegex.hasMatch(val)) {
//                                   return "Enter a valid email";
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                 hintText: "Email",
//                                 fillColor: const Color(0xffE6F1FF),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 constraints: BoxConstraints(
//                                   maxWidth: mediaquery.width * 0.87,
//                                 ),
//                                 filled: true,
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             TextFormField(
//                               obscureText: isVisible,
//                               controller: passwordController,
//                               validator: (val) {
//                                 if (val!.isEmpty) {
//                                   return 'Field can not be empty';
//                                 }
//                                 if (val.length < 6) {
//                                   return 'Password must be greater than 6 digits.';
//                                 }

//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                 suffixIcon: IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         isVisible = !isVisible;
//                                       });
//                                     },
//                                     icon: Icon(
//                                       isVisible
//                                           ? Icons.visibility
//                                           : Icons.visibility_off_outlined,
//                                       size: 20,
//                                       color: const Color(0xff242424),
//                                     )),
//                                 hintText: "password",
//                                 fillColor: const Color(0xffE6F1FF),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 constraints: BoxConstraints(
//                                   maxWidth: mediaquery.width * 0.87,
//                                 ),
//                                 filled: true,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 const Spacer(),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   child: TextButton(
//                                     onPressed: () {},
//                                     child: const Text(
//                                       'FORGOT PASSWORD',
//                                       textScaleFactor: 1,
//                                       style: TextStyle(
//                                           fontSize: 10,
//                                           color: Color(0xff0A192F)),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             BlocBuilder<AuthCubit, AuthState>(
//                                 builder: (context, state) {
//                               return PrimaryButton(
//                                 onPressed: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     // context.pushRoute(const HomeScreen());
//                                     BlocProvider.of<AuthCubit>(context)
//                                         .loginUser(emailController.text,
//                                             passwordController.text);
//                                   }
//                                 },
//                                 buttonText: "LOG IN",
//                                 isLoading: state.status == AuthStatus.loggingIn,
//                               );
//                             }),
//                             const SizedBox(height: 20),
//                             const Text(
//                               'OR LOG IN BY',
//                               textScaleFactor: 1,
//                               style: TextStyle(fontSize: 14),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 const Spacer(
//                                   flex: 4,
//                                 ),
//                                 CircleAvatar(
//                                   radius: 20,
//                                   backgroundColor: const Color(0xffE6F1FF),
//                                   child: IconButton(
//                                       onPressed: () {
//                                         // googleSignIn();
//                                       },
//                                       icon: const Icon(
//                                         Icons.g_mobiledata,
//                                         color: Color(0xff0A192F),
//                                         size: 30,
//                                       )),
//                                 ),
//                                 const Spacer(
//                                   flex: 1,
//                                 ),
//                                 CircleAvatar(
//                                   radius: 20,
//                                   backgroundColor: const Color(0xffE6F1FF),
//                                   child: IconButton(
//                                       onPressed: () {},
//                                       icon: const Icon(
//                                         Icons.facebook_sharp,
//                                         color: Color(0xff0A192F),
//                                         size: 20,
//                                       )),
//                                 ),
//                                 const Spacer(
//                                   flex: 4,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: mediaquery.height * 0.03),
//                             Row(
//                               children: [
//                                 const Spacer(),
//                                 const Text(
//                                   "Don't have account?",
//                                   style: TextStyle(),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     context.replaceRoute(const SignUpScreen());
//                                   },
//                                   child: const Text(
//                                     'SIGN UP',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                         color: Color(0xff0A192F)),
//                                   ),
//                                 ),
//                                 const Spacer(),
//                               ],
//                             ),
//                             SizedBox(height: mediaquery.height * 0.1),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future googleSignIn(BuildContext context, AuthCubit authCubit) async {
//     final user = await GoogleSignInApi.login();
//     if (user == null) {
//       showSnackBar(context, Colors.red, "Failed to Sinup. Please try again!");
//     } else {
//       authCubit.registerUserWithGoogle(user.displayName.toString(),
//           user.email.toString(), "", user.photoUrl.toString(), "googleID");
//       log("User, ${user.toString()}");
//     }
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:connect_up/Constants/colors.dart';
import 'package:connect_up/Constants/locations.dart';
import 'package:connect_up/Presentation/Widgets/primary_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
  bool rememberMe = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

// for testing purpose only in debug mode

  @override
  void initState() {
    if (!kReleaseMode) {
      emailController.text = "test@gmail.com";
      passwordController.text = "123456";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        // appBar: AppBar(),
        body: SingleChildScrollView(
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
                                width: 1, color: AppColors.darkBlueColor)),
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
                                width: 1, color: AppColors.darkBlueColor)),
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
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(
                                  color: const Color(0xff7750f8), width: 1),
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
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(
                                  color: const Color(0xff7750f8), width: 1),
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
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(
                                    color: const Color(0xff7750f8), width: 1),
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

                        // const SizedBox(height: 40),
                        const SizedBox(height: 40),
                        PrimaryButton(
                            onPressed: () {},
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              // height: 50,
                              // width: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.g_mobiledata,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                              ),
                            ),
                            Container(
                              // height: 50,
                              // width: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.g_mobiledata,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                              ),
                            ),
                            Container(
                              // height: 50,
                              // width: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.g_mobiledata,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                              ),
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
        //floatingActionButton: FloatingActionButton(onPressed: (){},),
      ),
    );
  }
}
