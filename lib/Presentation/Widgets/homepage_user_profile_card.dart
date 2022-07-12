// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePageUserProfileCard extends StatelessWidget {
  Size mediaQuery;
  String name;
  String image;
  String contentImage;
  DateTime time;
  String title;
  String description;
  HomePageUserProfileCard({
    Key? key,
    required this.mediaQuery,
    required this.name,
    required this.image,
    required this.contentImage,
    required this.time,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: mediaQuery.height * 0.35,
            // width: mediaQuery.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Spacer(flex: 1),
                      CircleAvatar(
                        radius: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            image,
                          ),
                        ),
                      ),
                      const Spacer(flex: 1),
                      Text(
                        name,
                        style: const TextStyle(),
                      ),
                      const Spacer(flex: 10),
                      Text(
                        DateFormat('dd-MM-yyyy').format(time),
                        style: const TextStyle(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: mediaQuery.height * 0.3,
                  width: mediaQuery.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      'https://picsum.photos/200',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              description,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
