import 'package:flutter/material.dart';
import 'package:task_urbanmatch/Colors/colors.dart';
import 'package:task_urbanmatch/Fonts/fonts.dart';

class ReposErrorScreen extends StatelessWidget {
  const ReposErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Opps!! Sorry an error occurred.",
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontFamily: reclineMedium,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "Please try searching again",
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontFamily: leoBold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
