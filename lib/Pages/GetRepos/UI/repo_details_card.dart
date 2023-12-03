import 'package:flutter/material.dart';
import 'package:task_urbanmatch/Classes/repo_class.dart';
import 'package:task_urbanmatch/Colors/colors.dart';
import 'package:task_urbanmatch/Fonts/fonts.dart';
import 'package:task_urbanmatch/UIHelpers/uihelpers.dart';

class RepoDetailsCard extends StatelessWidget {
  const RepoDetailsCard(
      {super.key, required this.repoClass, required this.onTap});
  final RepoClass repoClass;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Repo name & Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Repo name
                  SizedBox(
                    width: 200,
                    child: Text(
                      repoClass.name,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontFamily: bisonBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Logo
                  CircleAvatar(
                    radius: 15.0,
                    backgroundImage: NetworkImage(repoClass.avatarUrl),
                  ),
                ],
              ),
              verticalSpaceSmall,

              // Description
              SizedBox(
                height: 60,
                child: Text(
                  repoClass.description,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 15,
                    fontFamily: lucidaRegular,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              verticalSpaceSmall,

              // Repo watchers & Repo forks
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Repo watchers
                  SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Data
                        Text(
                          repoClass.watchers.toString(),
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontFamily: bisonBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                        // Name
                        const Text(
                          "Watchers",
                          style: TextStyle(
                            color: subHeadingGrey,
                            fontSize: 18,
                            fontFamily: bisonBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                    child: VerticalDivider(
                      width: 20,
                      thickness: 2,
                      color: subHeadingGrey,
                    ),
                  ),

                  // Repo forks
                  SizedBox(
                    width: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Data
                        Text(
                          repoClass.forks.toString(),
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontFamily: bisonBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                        // Name
                        const Text(
                          "Forks",
                          style: TextStyle(
                            color: subHeadingGrey,
                            fontSize: 18,
                            fontFamily: bisonBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
