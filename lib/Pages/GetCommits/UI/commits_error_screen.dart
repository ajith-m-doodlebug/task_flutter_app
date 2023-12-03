import 'package:flutter/material.dart';
import 'package:task_urbanmatch/Colors/colors.dart';
import 'package:task_urbanmatch/Fonts/fonts.dart';

class CommitsErrorScreen extends StatelessWidget {
  const CommitsErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Opps!! Sorry an error occurred.",
        style: TextStyle(
          color: primaryColor,
          fontSize: 18,
          fontFamily: reclineMedium,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
