import 'package:flutter/material.dart';
import 'package:task_urbanmatch/Loading/loadingrectange.dart';
import 'package:task_urbanmatch/UIHelpers/uihelpers.dart';

class ReposLoadingScreen extends StatelessWidget {
  const ReposLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenSidePadding,
      child: ListView(
        children: [
          verticalSpaceTiny,
          LoadingRectange(
            height: 150,
            width: screenWidth(context),
          ),
          verticalSpaceTiny,
          LoadingRectange(
            height: 15,
            width: screenWidth(context),
          ),
          verticalSpaceRegular,
          LoadingRectange(
            height: 150,
            width: screenWidth(context),
          ),
          verticalSpaceTiny,
          LoadingRectange(
            height: 15,
            width: screenWidth(context),
          ),
          verticalSpaceRegular,
          LoadingRectange(
            height: 150,
            width: screenWidth(context),
          ),
          verticalSpaceTiny,
          LoadingRectange(
            height: 15,
            width: screenWidth(context),
          ),
          verticalSpaceRegular,
          LoadingRectange(
            height: 150,
            width: screenWidth(context),
          ),
          verticalSpaceTiny,
          LoadingRectange(
            height: 15,
            width: screenWidth(context),
          ),
        ],
      ),
    );
  }
}
