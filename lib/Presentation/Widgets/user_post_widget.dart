// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:connect_up/Constants/colors.dart';

class PostsWidget extends StatelessWidget {
  // const PostsWidget({Key? key}) : super(key: key);
  final String userName;
  final DateTime postTime;
  const PostsWidget({
    Key? key,
    required this.userName,
    required this.postTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Container(
      height: mediaquery.height * 0.3,
      width: mediaquery.width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.darkBlueColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                minRadius: 25,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Column(
                children: [
                  Text(
                    '$userName shared a post',
                    style: const TextStyle(),
                  ),
                  Text(
                    timeago.format(postTime).toString(),
                    style: const TextStyle(),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz_outlined,
                    size: 20,
                  )),
            ],
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 20,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message_outlined,
                    size: 20,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                    size: 20,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
