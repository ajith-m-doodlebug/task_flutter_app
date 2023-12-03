import 'package:flutter/material.dart';
import 'package:task_urbanmatch/Classes/commit_class.dart';
import 'package:task_urbanmatch/Colors/colors.dart';
import 'package:task_urbanmatch/Fonts/fonts.dart';
import 'package:task_urbanmatch/UIHelpers/uihelpers.dart';

class CommitDetailsCard extends StatelessWidget {
  const CommitDetailsCard({super.key, required this.commitClass});
  final CommitClass commitClass;

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
      child: Column(
        children: [
          // Name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text
              const Text(
                "Last commit by",
                style: TextStyle(
                  color: subHeadingGrey,
                  fontSize: 18,
                  fontFamily: bisonBold,
                ),
              ),

              // Data
              SizedBox(
                width: 150,
                child: Text(
                  commitClass.name,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontFamily: bisonBold,
                  ),
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          // Email
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text
              const Text(
                "Mail",
                style: TextStyle(
                  color: subHeadingGrey,
                  fontSize: 18,
                  fontFamily: bisonBold,
                ),
              ),

              // Data
              SizedBox(
                width: 200,
                child: Text(
                  commitClass.email,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontFamily: bisonBold,
                  ),
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          // Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text
              const Text(
                "Date & Time",
                style: TextStyle(
                  color: subHeadingGrey,
                  fontSize: 18,
                  fontFamily: bisonBold,
                ),
              ),

              // Data
              SizedBox(
                width: 150,
                child: Text(
                  commitClass.date,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontFamily: bisonBold,
                  ),
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          verticalSpaceTiny,
          const Divider(),
          verticalSpaceTiny,

          const Text(
            "Commit Message",
            style: TextStyle(
              color: subHeadingGrey,
              fontSize: 18,
              fontFamily: bisonBold,
            ),
          ),
          verticalSpaceSmall,

          SizedBox(
            width: 300,
            child: Text(
              commitClass.message,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 15,
                fontFamily: lucidaRegular,
              ),
              maxLines: 5,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
