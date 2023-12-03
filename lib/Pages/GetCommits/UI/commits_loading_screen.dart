import 'package:flutter/material.dart';
import 'package:task_urbanmatch/Loading/loadingrectange.dart';
import 'package:task_urbanmatch/UIHelpers/uihelpers.dart';

class CommitsLoadingScreen extends StatelessWidget {
  const CommitsLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: screenSidePadding,
        child: ListView(
          children: [
            verticalSpaceTiny,
            LoadingRectange(
              height: 70,
              width: screenWidth(context),
            ),
            verticalSpaceRegular,
            LoadingRectange(
              height: 250,
              width: screenWidth(context),
            ),
            verticalSpaceRegular,
            LoadingRectange(
              height: 60,
              width: screenWidth(context),
            ),
          ],
        ),
      ),
    );
  }
}
