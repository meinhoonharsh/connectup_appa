// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect_up/Constants/colors.dart';
import 'package:connect_up/Constants/locations.dart';
import 'package:connect_up/Presentation/Widgets/bottom_navigation_bar.dart';
import 'package:connect_up/Presentation/Widgets/drawer.dart';
import 'package:connect_up/Presentation/Widgets/primary_button.dart';
import 'package:connect_up/Presentation/Widgets/snackbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class UserProfileInfoScreen extends StatefulWidget {
  const UserProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileInfoScreen> createState() => _UserProfileInfoScreenState();
}

class _UserProfileInfoScreenState extends State<UserProfileInfoScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  DateTime birthDay = DateTime.now();
  TextEditingController profileNameController =
      TextEditingController(text: "satyapsr13");
  TextEditingController userNameController =
      TextEditingController(text: "satyapsr13");
  TextEditingController publicWebsiteController =
      TextEditingController(text: "https://connectup/satyaprakash.com");
  TextEditingController birthdayController = TextEditingController();

  TextEditingController publicEmailController =
      TextEditingController(text: "satyaprakash@connectup.com");
  TextEditingController descriptionController = TextEditingController();

  bool profileExpansion = false;
  bool accoundExpansion = false;
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
          currentIndex: 3,
          mediaquery: mediaquery,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    onExpansionChanged: ((value) {
                      setState(() {
                        profileExpansion = value;
                      });
                    }),
                    trailing: profileExpansion
                        ? const Icon(
                            Icons.remove,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                    backgroundColor: Color.fromARGB(255, 43, 50, 68),
                    leading: const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Profile',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'change the avatar' * 5,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: mediaquery.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 55),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Profile Info',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Social & Streams',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Referrals',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    onExpansionChanged: ((value) {
                      setState(() {
                        accoundExpansion = value;
                      });
                    }),
                    trailing: accoundExpansion
                        ? const Icon(
                            Icons.remove,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                    backgroundColor: Color.fromARGB(255, 43, 50, 68),
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.green,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'change the avatar' * 5,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: mediaquery.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 55),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Profile Info',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Social & Streams',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Referrals',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                OutlinedButton(
                  style: ButtonStyle(
                    // backgroundColor: Color.fromARGB(255, 43, 50, 68),
                    // foregroundColor: Colors.white,
                    side: MaterialStateProperty.all(BorderSide(
                      width: 1,
                      color: Colors.grey,
                    )),
                  ),
                  onPressed: () {},
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
                const SizedBox(height: 50),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MY PROFILE',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'PFOFILE INFO',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SecondryButton(
                          onPressed: () {
                            // final storage = SecureStorage();
                            // storage.deleteAll();
                          },
                          buttonText: 'Save changes',
                          isHalfSize: true,
                          // isLoading: true,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: mediaquery.height * 0.17,
                      width: mediaquery.width * 0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 43, 50, 68),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Center(
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  "https://pikwizard.com/photos/doctors-and-surgeon-standing-together-in-hospital--65f20168c02da9d8acada2e0cdc06eb0-l.jpg",
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                    Color(0xfff2f2f2), BlendMode.color),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                ),
                              ),
                            ),
                          ),
                        ),
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
                          const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.grey,
                          ),
                          Text(
                            'Change Avatar',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '110*110px size minimum',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 10),
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
                          const Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.grey,
                          ),
                          Text(
                            'Change Cover',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '110*110px size minimum',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
                const SizedBox(height: 50),
                aboutProfileItems(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget aboutProfileItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About your profile',
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
        descriptionInputField(),
        const SizedBox(height: 30),
        emailInputFIeld(),
        const SizedBox(height: 30),
        TextFormField(
          style: inputTextStyle(),
          controller: publicWebsiteController,
          decoration: InputDecoration(
            labelText: "Public Website",
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  Clipboard.setData(
                          ClipboardData(text: publicWebsiteController.text))
                      .then((_) {
                    showSnackBar(context, const Color(0xff7750f8),
                        "Copied to clipboard!");
                  });
                },
                icon: const Icon(
                  Icons.copy,
                  size: 20,
                  color: Colors.white,
                )),
            enabledBorder: outlineInputBorderStyle(),
            focusedBorder: outlineInputBorderStyle(),
            errorBorder: outlineInputBorderStyle(),
            disabledBorder: outlineInputBorderStyle(),
          ),
        ),
        const SizedBox(height: 30),
        TextFormField(
          style: inputTextStyle(),
          controller: birthdayController,
          onTap: () {
            datePicker(context).then((value) {
              setState(() {
                birthDay = value ?? birthDay;
                birthdayController.text =
                    DateFormat('dd - MM - yyyy').format(birthDay);
              });
            });
          },
          decoration: InputDecoration(
            labelText: "Birthay",
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
        // search dropdown
        //   DropdownButtonFormField(
        //   decoration: InputDecoration(
        //     labelText: "Country",
        //     labelStyle: TextStyle(
        //       color: Colors.grey,
        //     ),
        //     enabledBorder: outlineInputBorderStyle(),
        //     focusedBorder: outlineInputBorderStyle(),
        //     errorBorder: outlineInputBorderStyle(),
        //     disabledBorder: outlineInputBorderStyle(),
        //   ),
        //   value: country,
        //   items: [
        //     DropdownMenuItem(
        //       child: Text('India'),
        //       value: 'India',
        //     ),
        //     DropdownMenuItem(
        //       child: Text('USA'),
        //       value: 'USA',
        //     ),
        //     DropdownMenuItem(
        //       child: Text('UK'),
        //       value: 'UK',
        //     ),
        //   ],
        //   onChanged: (value) {
        //     setState(() {
        //       country = value;
        //     });
        //   },
        // ),
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
                labelText: "Country",
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
                labelText: "Select you institute",
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
                labelText: "Select academic background",
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
        )
      ],
    );
  }

  TextFormField emailInputFIeld() {
    return TextFormField(
      style: inputTextStyle(),
      controller: publicEmailController,
      decoration: InputDecoration(
        labelText: "Public Email",
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
        labelText: "Username",
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

  TextFormField _profileNameInputField() {
    return TextFormField(
      style: inputTextStyle(),
      controller: profileNameController,
      decoration: InputDecoration(
        labelText: "Profile Name",
        // border
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
}
