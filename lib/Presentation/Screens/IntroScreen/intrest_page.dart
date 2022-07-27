
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:semikolan_app/Presentation/Widgets/primary_button.dart';
// import 'package:semikolan_app/Routes/routes.gr.dart';

// class IntrestScreen extends StatefulWidget {
//   const IntrestScreen({Key? key}) : super(key: key);

//   @override
//   State<IntrestScreen> createState() => _IntrestScreenState();
// }

// class _IntrestScreenState extends State<IntrestScreen> {
//   List<String> userIntrests = [
//     "Semikolan",
//     "Web-D",
//     "Mobile App",
//     "Arts Designing",
//     "Core Coding",
//     "Web",
//     "App",
//     "Designing",
//     "Coding",
//     "Gaming",
//     "Open Source",

//     "Photography",
//   ];
//   List<String> selectedList = [
//     "Semikolan",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final mediaquery = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: mediaquery.height * 0.25,
//               width: mediaquery.width,
//               decoration: BoxDecoration(
//                 color: const Color(0xff0A192F),
//                 borderRadius: BorderRadius.vertical(
//                     bottom: Radius.elliptical(
//                         MediaQuery.of(context).size.width * 0.5, 50.0)),
//               ),
//               child: const Center(
//                 child: Text(
//                   'Your Intrests ?',
//                   style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Center(
//               child: SizedBox(
//                 // height: mediaquery.height * 0.5,
//                 child: GridView.builder(
//                   itemCount: userIntrests.length,
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 2 / 2,
//                     crossAxisSpacing: 0,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemBuilder: (ctx, index) {
//                     bool isContains =
//                         selectedList.contains(userIntrests[index]);
//                     return InkWell(
//                       onTap: () {
//                         if (isContains) {
//                           setState(() {
//                             selectedList.remove(userIntrests[index]);
//                           });
//                         } else {
//                           setState(() {
//                             selectedList.add(userIntrests[index]);
//                           });
//                         }
//                       },
//                       child: Center(
//                         child: Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: SizedBox(
//                                 height: mediaquery.height * 0.4,
//                                 width: mediaquery.width * 0.35,
//                                 // decoration: BoxDecoration(
//                                 //   color: isContains
//                                 //       ? Colors.green
//                                 //       : Colors.transparent,
//                                 // ),
//                                 child: Image.network(
//                                   'https://picsum.photos/200',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: Container(
//                                 height: mediaquery.height * 0.4,
//                                 width: mediaquery.width * 0.35,
//                                 decoration: BoxDecoration(
//                                     color: isContains
//                                         ? const Color(0xff0A192F).withOpacity(0.7)
//                                         : Colors.transparent),
//                                 child: Icon(
//                                   Icons.done,
//                                   size: 30,
//                                   color: isContains
//                                       ? Colors.white
//                                       : Colors.transparent,
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 2,
//                               left: 5,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: FittedBox(
//                                   child: Text(
//                                     userIntrests[index],
//                                     style: const TextStyle(
//                                         color: Colors.white, fontSize: 15),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },

//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             PrimaryButton(
//                 onPressed: () {
//                   context.pushRoute(const HomeScreen());
//                 },
//                 buttonText: "EXPLORE NOW"),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }
