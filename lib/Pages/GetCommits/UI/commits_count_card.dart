import 'package:flutter/material.dart';
import 'package:task_urbanmatch/Colors/colors.dart';
import 'package:task_urbanmatch/Fonts/fonts.dart';

class CommitsCountCard extends StatelessWidget {
  const CommitsCountCard({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text
          const Text(
            "Total Commits :",
            style: TextStyle(
              color: subHeadingGrey,
              fontSize: 18,
              fontFamily: bisonBold,
            ),
          ),

          // Date
          Text(
            count.toString(),
            style: const TextStyle(
              color: primaryColor,
              fontSize: 18,
              fontFamily: bisonBold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
