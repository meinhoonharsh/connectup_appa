// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:connect_up/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserPostCard extends StatefulWidget {
  final Size mediaQuery;
  final String name;
  final String image;
  final String contentImage;
  final DateTime time;
  final String title;
  final String description;
  const UserPostCard({
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
  State<UserPostCard> createState() => _UserPostCardState();
}

class _UserPostCardState extends State<UserPostCard> {
  bool isfavourate = false;
  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
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
              color: Color.fromARGB(255, 43, 50, 68),
              // color: Colors.white,
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
                        backgroundImage: NetworkImage(
                          widget.image,
                        ),
                      ),
                      const Spacer(flex: 1),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            // DateFormat('dd-MM-yyyy').format(time),
                            timeago.format(widget.time.subtract(
                              Duration(hours: 55000),
                            )),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 10),
                      IconButton(
                          onPressed: () {
                            // Pop up menu button

                            // showMenu(
                            //   context: context,
                            //   // position: RelativeRect.,
                            //   items: [
                            //     PopupMenuItem(
                            //       value: 1,
                            //       child: Text('Share'),
                            //     ),
                            //     PopupMenuItem(
                            //       value: 2,
                            //       child: Text('Delete'),
                            //     ),
                            //   ],
                            // );


                          },
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                            size: 20,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: widget.mediaQuery.height * 0.3,
                  width: widget.mediaQuery.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: widget.mediaQuery.height * 0.1,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              widget.description,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Chip(
                                label: Text(
                                  'Lorem',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Color(0xff7750f8),
                              ),
                              Chip(
                                label: Text(
                                  'iste',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Color(0xff7750f8),
                              ),
                              Chip(
                                label: Text(
                                  'iste',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Color(0xff7750f8),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.2),
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isfavourate = !isfavourate;
                                  });
                                },
                                icon: Icon(
                                  isfavourate
                                      ? Icons.thumb_up_alt
                                      : Icons.thumb_up_alt_outlined,
                                  size: 20,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.message,
                                  size: 20,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  Share.share(
                                      'check out http://beta.connectup.in/',
                                      subject: 'ConnectUp');
                                },
                                icon: const Icon(
                                  Icons.share,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
