// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class CommingSoonLabel extends StatelessWidget {
  // const CommingSoonLabel({Key? key}) : super(key: key);
  final Widget child;
  const CommingSoonLabel({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 5,
          top: 0,
          child: Container(
            height: 20,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  'Coming Soon',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
