// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect_up/Constants/colors.dart';
import 'package:connect_up/Constants/locations.dart';
import 'package:connect_up/Presentation/Widgets/drawer.dart';
import 'package:connect_up/Presentation/Widgets/primary_button.dart';
import 'package:connect_up/Presentation/Widgets/snackbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class UserStartUpInfoScreen extends StatefulWidget {
  const UserStartUpInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserStartUpInfoScreen> createState() => _UserStartUpInfoScreenState();
}

class _UserStartUpInfoScreenState extends State<UserStartUpInfoScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  DateTime birthDay = DateTime.now();
  TextEditingController startUpNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController taglineController = TextEditingController();
  TextEditingController fundedAtController = TextEditingController();

  TextEditingController contactEmailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController youtubeProfileController = TextEditingController();
  TextEditingController twitterProfileController = TextEditingController();
  TextEditingController instagramProfileController = TextEditingController();
  TextEditingController facebookProfileController = TextEditingController();
  TextEditingController linkedInProfileController = TextEditingController();
  TextEditingController githubProfileController = TextEditingController();
  Uint8List? logoImageBytes;
  Uint8List? coverImageBytes;

// scroll controller for the list view
  bool isGeneralInfoVisible = true;
  bool isLogoCoverVisible = false;
  bool isContactsDetailsVisible = false;
  bool isSocialInfoVisible = false;
  bool isStartupInfoVisible = false;
  final _bottomKey = GlobalKey();
  final _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
        // bottomNavigationBar: MyBottomNavigationBar(
        //   currentIndex: 3,
        //   mediaquery: mediaquery,
        // ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: mediaquery.height * 0.15,
                          width: mediaquery.width * 0.87,
                          child: coverImageBytes != null
                              ? Image.memory(
                                  coverImageBytes!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  AppImages.authBackgroundImage,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      left: mediaquery.width * 0.87 * 0.5 - 55,
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: logoImageBytes != null
                                ? Image.memory(
                                    logoImageBytes!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    AppImages.connectUpLogo,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                // const SizedBox(height: 20),

                Text(
                  'ConnectUp',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '@connectup',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: mediaquery.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isGeneralInfoVisible = true;
                            isLogoCoverVisible = false;
                            isContactsDetailsVisible = false;
                            isSocialInfoVisible = false;
                            isStartupInfoVisible = false;
                          });
                          _scrollController.position.ensureVisible(
                            _bottomKey.currentContext!.findRenderObject()!,
                            curve: Curves.easeInOut,
                            alignment:
                                0.05, // How far into view the item should be scrolled (between 0 and 1).
                            duration: const Duration(seconds: 1),
                          );
                        },
                        child: Text(
                          'General Info',
                          style: TextStyle(
                              color: isGeneralInfoVisible
                                  ? Color(0xff7750F8)
                                  : Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isGeneralInfoVisible = false;
                            isLogoCoverVisible = true;
                            isContactsDetailsVisible = false;
                            isSocialInfoVisible = false;
                            isStartupInfoVisible = false;
                          });
                          _scrollController.position.ensureVisible(
                            _bottomKey.currentContext!.findRenderObject()!,
                            curve: Curves.easeInOut,
                            alignment:
                                0.05, // How far into view the item should be scrolled (between 0 and 1).
                            duration: const Duration(seconds: 1),
                          );
                        },
                        child: Text(
                          'Logo & Cover',
                          style: TextStyle(
                              color: isLogoCoverVisible
                                  ? Color(0xff7750F8)
                                  : Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isGeneralInfoVisible = false;
                            isLogoCoverVisible = false;
                            isContactsDetailsVisible = true;
                            isSocialInfoVisible = false;
                            isStartupInfoVisible = false;
                          });
                          _scrollController.position.ensureVisible(
                            _bottomKey.currentContext!.findRenderObject()!,
                            curve: Curves.easeInOut,
                            alignment:
                                0.05, // How far into view the item should be scrolled (between 0 and 1).
                            duration: const Duration(seconds: 1),
                          );
                        },
                        child: Text(
                          'Contact Details',
                          style: TextStyle(
                              color: isContactsDetailsVisible
                                  ? Color(0xff7750F8)
                                  : Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isGeneralInfoVisible = false;
                            isLogoCoverVisible = false;
                            isContactsDetailsVisible = false;
                            isSocialInfoVisible = true;
                            isStartupInfoVisible = false;
                          });
                          _scrollController.position.ensureVisible(
                            _bottomKey.currentContext!.findRenderObject()!,
                            curve: Curves.easeInOut,
                            alignment:
                                0.05, // How far into view the item should be scrolled (between 0 and 1).
                            duration: const Duration(seconds: 1),
                          );
                        },
                        child: Text(
                          'Social Info',
                          style: TextStyle(
                              color: isSocialInfoVisible
                                  ? Color(0xff7750F8)
                                  : Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isGeneralInfoVisible = false;
                            isLogoCoverVisible = false;
                            isContactsDetailsVisible = false;
                            isSocialInfoVisible = false;
                            isStartupInfoVisible = true;
                          });
                          _scrollController.position.ensureVisible(
                            _bottomKey.currentContext!.findRenderObject()!,
                            curve: Curves.easeInOut,
                            alignment:
                                0.05, // How far into view the item should be scrolled (between 0 and 1).
                            duration: const Duration(seconds: 1),
                          );
                        },
                        child: Text(
                          'Startup Info',
                          style: TextStyle(
                              color: isStartupInfoVisible
                                  ? Color(0xff7750F8)
                                  : Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                PrimaryButton(onPressed: () {}, buttonText: "Save Changes"),
                SizedBox(height: 20),
                OutlinedButton(
                  style: ButtonStyle(
                    // backgroundColor: Color.fromARGB(255, 43, 50, 68),
                    // foregroundColor: Colors.white,
                    side: MaterialStateProperty.all(BorderSide(
                      width: 1,
                      color: Colors.grey,
                    )),
                  ),
                  onPressed: () {
                    context.popRoute();
                  },
                  child: SizedBox(
                    height: 50,
                    width: mediaquery.width * 0.8,
                    child: Center(
                      child: Text(
                        'Discard All',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(key: _bottomKey, height: 50),
                isGeneralInfoVisible
                    ? generalInfoSection()
                    : isLogoCoverVisible
                        ? logoAndCoverSection(mediaquery)
                        : isContactsDetailsVisible
                            ? contactDetailsSection()
                            : isSocialInfoVisible
                                ? socialInfoSection()
                                : isStartupInfoVisible
                                    ? startUpInfoSection()
                                    : Container(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget generalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General Info',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        _profileNameInputField(),
        const SizedBox(height: 30),
        userNameInputField(),
        const SizedBox(height: 30),
        TextFormField(
          style: inputTextStyle(),
          controller: taglineController,
          decoration: InputDecoration(
            hintText: "Tagline",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: outlineInputBorderStyle(),
            focusedBorder: outlineInputBorderStyle(),
            errorBorder: outlineInputBorderStyle(),
            disabledBorder: outlineInputBorderStyle(),
          ),
        ),
        const SizedBox(height: 30),
        descriptionInputField(),
        const SizedBox(height: 30),
        Text(
          'Public',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'Make your startup public',
          style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.7)),
        ),
        const SizedBox(height: 5),
        Switch.adaptive(
            // activeTrackColor: const Color(0xffEFF4FD),
            activeColor: const Color(0xffEFF4FD),
            activeTrackColor: const Color(0xff00CC5A),
            value: true,
            onChanged: (val) {
              setState(() {});
            }),
        SizedBox(height: 50),
      ],
    );
  }

  Widget logoAndCoverSection(Size mediaquery) {
    return SizedBox(
      width: mediaquery.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Logo',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: mediaquery.height * 0.05),

// dotted container border
          InkWell(
            onTap: pickLogoImage,
            child: Container(
              // height: mediaquery.height * 0.17,
              width: mediaquery.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 43, 50, 68),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logoImageBytes != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                                height: mediaquery.height * 0.15,
                                width: mediaquery.width * 0.7,
                                child: Image.memory(
                                  logoImageBytes!,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        )
                      : const Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.grey,
                        ),
                  Text(
                    'Select Logo',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '110*110px size minimum',
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: mediaquery.height * 0.05),
          Text(
            'Select Cover',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: mediaquery.height * 0.05),
          InkWell(
            onTap: pickCoverImage,
            child: Container(
              // height: mediaquery.height * 0.17,
              width: mediaquery.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 43, 50, 68),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  coverImageBytes != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                                height: mediaquery.height * 0.15,
                                width: mediaquery.width * 0.7,
                                child: Image.memory(
                                  coverImageBytes!,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        )
                      : const Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.grey,
                        ),
                  Text(
                    'Select Cover',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '110*110px size minimum',
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget contactDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Details',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        emailInputFIeld(contactEmailController, "Contact Email"),
        const SizedBox(height: 30),
        emailInputFIeld(contactEmailController, "Hiring Email"),
        const SizedBox(height: 30),
        // website text field
        TextFormField(
          style: inputTextStyle(),
          controller: startUpNameController,
          decoration: InputDecoration(
            hintText: "Website",
            // border
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: outlineInputBorderStyle(),
            focusedBorder: outlineInputBorderStyle(),
            errorBorder: outlineInputBorderStyle(),
            disabledBorder: outlineInputBorderStyle(),
          ),
        ),
        const SizedBox(height: 30),
        TextFormField(
          style: inputTextStyle(),
          controller: taglineController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: "Contact Number",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: outlineInputBorderStyle(),
            focusedBorder: outlineInputBorderStyle(),
            errorBorder: outlineInputBorderStyle(),
            disabledBorder: outlineInputBorderStyle(),
          ),
        ),
        TextFormField(
          readOnly: true,
          style: inputTextStyle(),
          controller: fundedAtController,
          onTap: () {
            datePicker(context).then((value) {
              setState(() {
                birthDay = value ?? birthDay;
                fundedAtController.text =
                    DateFormat('dd - MM - yyyy').format(birthDay);
              });
            });
          },
          decoration: InputDecoration(
            labelText: "Founded At",
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: _calenderIcon(),
            enabledBorder: outlineInputBorderStyle(),
            focusedBorder: outlineInputBorderStyle(),
            errorBorder: outlineInputBorderStyle(),
            disabledBorder: outlineInputBorderStyle(),
          ),
        ),
        const SizedBox(height: 30),

        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
            // disabledItemFn: (String s) => s.startsWith('I'),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(
                color: Colors.white,
              ),
              dropdownSearchDecoration: InputDecoration(
                labelText: "Funded",
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: outlineInputBorderStyle(),
                focusedBorder: outlineInputBorderStyle(),
                errorBorder: outlineInputBorderStyle(),
                disabledBorder: outlineInputBorderStyle(),
              )),
          dropdownButtonProps: DropdownButtonProps(
            color: Colors.white,
          ),
          items: [
            // list of countries
            'India',
            'USA',
            'UK',
          ],
          onChanged: print,
          selectedItem: "India",
        ),

        SizedBox(height: 50),
      ],
    );
  }

  Widget startUpInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'StartUp Info',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
            // disabledItemFn: (String s) => s.startsWith('I'),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(
                color: Colors.white,
              ),
              dropdownSearchDecoration: InputDecoration(
                labelText: "Stage",
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: outlineInputBorderStyle(),
                focusedBorder: outlineInputBorderStyle(),
                errorBorder: outlineInputBorderStyle(),
                disabledBorder: outlineInputBorderStyle(),
              )),
          dropdownButtonProps: DropdownButtonProps(
            color: Colors.white,
          ),
          items: [
            // list of countries
            'India',
            'USA',
            'UK',
          ],
          onChanged: print,
          selectedItem: "India",
        ),
        const SizedBox(height: 30),
        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(
                color: Colors.white,
              ),
              dropdownSearchDecoration: InputDecoration(
                labelText: "Category",
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: outlineInputBorderStyle(),
                focusedBorder: outlineInputBorderStyle(),
                errorBorder: outlineInputBorderStyle(),
                disabledBorder: outlineInputBorderStyle(),
              )),
          dropdownButtonProps: DropdownButtonProps(
            color: Colors.white,
          ),
          items: [
            // list of countries
            'India',
            'USA',
            'UK',
          ],
          onChanged: print,
          // selectedItem: "India",
        ),
        const SizedBox(height: 30),
        Text(
          'Startup intrests& Domains',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        DropdownSearch<String>.multiSelection(
          items: [
            // user intrest
            'Cricket',
            'Football',

            'Weight Lifting',
            'Gym',
            'Yoga',
            'Martial Arts',
            'Boxing',
            'Weight Lifting',
            'Gym',
          ],
          popupProps: PopupPropsMultiSelection.menu(
            showSelectedItems: true,
            showSearchBox: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
            hintText: "Select your intrest",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: outlineInputBorderStyle(),
            focusedBorder: outlineInputBorderStyle(),
            errorBorder: outlineInputBorderStyle(),
            disabledBorder: outlineInputBorderStyle(),
          )),
          dropdownButtonProps: DropdownButtonProps(
            color: Colors.transparent,
          ),
          onChanged: print,
          selectedItems: ["Tennis"],
        ),
        const SizedBox(height: 30),
        Text(
          'Objective reason to join',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        DropdownSearch<String>.multiSelection(
          items: [
            // user intrest
            'Cricket',
            'Football',

            'Weight Lifting',
            'Gym',
            'Yoga',
            'Martial Arts',
            'Boxing',
            'Weight Lifting',
            'Gym',
          ],
          popupProps: PopupPropsMultiSelection.menu(
            showSelectedItems: true,
            showSearchBox: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
            hintText: "Objective reason to join",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: outlineInputBorderStyle(),
            focusedBorder: outlineInputBorderStyle(),
            errorBorder: outlineInputBorderStyle(),
            disabledBorder: outlineInputBorderStyle(),
          )),
          dropdownButtonProps: DropdownButtonProps(
            color: Colors.transparent,
          ),
          onChanged: print,
          selectedItems: ["Tennis"],
        )
      ],
    );
  }

  Widget socialInfoSection() {
    var colors = Colors.white;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Social Networks',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        socialInputFields(
            githubProfileController, "Github", colors, AppIcons.github),
        const SizedBox(height: 30),
        socialInputFields(
            linkedInProfileController, "LinkedIn", colors, AppIcons.linkedin),
        const SizedBox(height: 30),
        socialInputFields(facebookProfileController, "Facebook",
            Colors.lightBlueAccent, AppIcons.linkedin),
        const SizedBox(height: 30),
        socialInputFields(instagramProfileController, "Instagram", Colors.pink,
            AppIcons.linkedin),
        const SizedBox(height: 30),
        socialInputFields(twitterProfileController, "Twitter", Colors.blue,
            AppIcons.linkedin),
        const SizedBox(height: 30),
        socialInputFields(
            youtubeProfileController, "Youtube", Colors.red, AppIcons.linkedin),
      ],
    );
  }

  TextFormField socialInputFields(TextEditingController controller,
      String labelText2, Color colors, String icon) {
    return TextFormField(
      style: inputTextStyle(),
      controller: controller,
      decoration: InputDecoration(
        labelText: "$labelText2 Profile Link",
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              color: colors,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                icon,
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: outlineInputBorderStyle(),
        focusedBorder: outlineInputBorderStyle(),
        errorBorder: outlineInputBorderStyle(),
        disabledBorder: outlineInputBorderStyle(),
      ),
    );
  }

  Widget referralsItems(Size mediaquery, String refralCode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Referrals',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: mediaquery.height * 0.17,
          width: mediaquery.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 43, 50, 68),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(flex: 5),
                  IconButton(
                      onPressed: () {
                        Share.share(
                            'check out http://beta.connectup.in/$refralCode',
                            subject: 'ConnectUp');
                      },
                      icon: const Icon(
                        Icons.share,
                        size: 30,
                        color: Colors.white,
                      )),
                  const Spacer(flex: 1),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                            text: 'http://beta.connectup.in/$refralCode'));
                        showSnackBar(
                            context, Color(0xff7750f8), "Copied to clipboard");
                      },
                      icon: const Icon(
                        Icons.copy,
                        size: 20,
                        color: Colors.white,
                      )),
                  const Spacer(flex: 5),
                ],
              ),
              Text(
                refralCode,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Referal Code',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: mediaquery.height * 0.17,
          width: mediaquery.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 43, 50, 68),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Member till date',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              Text(
                '0',
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'joined using your referal code',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9), fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: mediaquery.height * 0.17,
          width: mediaquery.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 43, 50, 68),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Referrals',
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
                SizedBox(height: 10),
                Text(
                  'No one joined using your referal code',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  TextFormField emailInputFIeld(
      TextEditingController controller, String hintText) {
    return TextFormField(
      style: inputTextStyle(),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: outlineInputBorderStyle(),
        focusedBorder: outlineInputBorderStyle(),
        errorBorder: outlineInputBorderStyle(),
        disabledBorder: outlineInputBorderStyle(),
      ),
    );
  }

  TextFormField descriptionInputField() {
    return TextFormField(
      style: inputTextStyle(),
      controller: descriptionController,
      decoration: InputDecoration(
        hintText: "Write a little description about you",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: outlineInputBorderStyle(),
        focusedBorder: outlineInputBorderStyle(),
        errorBorder: outlineInputBorderStyle(),
        disabledBorder: outlineInputBorderStyle(),
      ),
      maxLines: 5,
    );
  }

  TextFormField userNameInputField() {
    return TextFormField(
      style: inputTextStyle(),
      controller: userNameController,
      decoration: InputDecoration(
        hintText: "Username",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: outlineInputBorderStyle(),
        focusedBorder: outlineInputBorderStyle(),
        errorBorder: outlineInputBorderStyle(),
        disabledBorder: outlineInputBorderStyle(),
      ),
    );
  }

  TextFormField _profileNameInputField() {
    return TextFormField(
      style: inputTextStyle(),
      controller: startUpNameController,
      decoration: InputDecoration(
        hintText: "Startup Name",
        // border
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: outlineInputBorderStyle(),
        focusedBorder: outlineInputBorderStyle(),
        errorBorder: outlineInputBorderStyle(),
        disabledBorder: outlineInputBorderStyle(),
      ),
    );
  }

  Padding _calenderIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Row(
          children: [
            const Icon(
              Icons.calendar_month,
              color: Colors.white,
              size: 20,
            ),
            const Icon(
              Icons.arrow_drop_down_circle_outlined,
              size: 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle inputTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    );
  }

  OutlineInputBorder outlineInputBorderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ),
    );
  }

  Future<DateTime?> datePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1995),
        lastDate: DateTime.now());
  }

  void pickLogoImage() async {
    //image_picker: ^0.8.4+11
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      logoImageBytes = File(image!.path).readAsBytesSync();
    });
  }

  void pickCoverImage() async {
    //image_picker: ^0.8.4+11
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      coverImageBytes = File(image!.path).readAsBytesSync();
    });
  }
}
