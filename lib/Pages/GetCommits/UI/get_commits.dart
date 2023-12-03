import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_urbanmatch/Classes/repo_class.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';
import 'package:task_urbanmatch/Fonts/fonts.dart';
import 'package:task_urbanmatch/Pages/GetCommits/UI/commit_details_card.dart';
import 'package:task_urbanmatch/Pages/GetCommits/UI/commits_count_card.dart';
import 'package:task_urbanmatch/Pages/GetCommits/UI/commits_error_screen.dart';
import 'package:task_urbanmatch/Pages/GetCommits/UI/commits_loading_screen.dart';
import 'package:task_urbanmatch/Pages/GetCommits/bloc/get_commits_bloc.dart';
import 'package:task_urbanmatch/Pages/GetRepos/UI/repo_details_card.dart';
import 'package:task_urbanmatch/UIHelpers/uihelpers.dart';

class GetCommits extends StatelessWidget {
  const GetCommits({super.key, required this.repoClass});
  final RepoClass repoClass;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCommitsBloc()
        ..add(CommitsDataFetchEvent(
          login: repoClass.login,
          name: repoClass.name,
        )),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              verticalSpaceMedium,
              // Repo Data
              RepoDetailsCard(
                repoClass: repoClass,
                onTap: null,
              ),

              // Commit Data
              BlocBuilder<GetCommitsBloc, GetCommitsState>(
                builder: (context, state) {
                  if (state is CommitsDataLoadingState) {
                    return const CommitsLoadingScreen();
                  } else if (state is CommitsDataRetreivedState) {
                    return Column(
                      children: [
                        // Total Count
                        CommitsCountCard(count: state.commitsData.length),

                        // Last commit
                        CommitDetailsCard(
                          commitClass: state.commitsData[0],
                        ),

                        // Button
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (!await launchUrl(Uri.parse(repoClass.url))) {}
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(screenWidth(context) - 50, 50),
                              ),
                            ),
                            child: const Text(
                              "Open Repo",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: leoLight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is CommitsDataErrorState) {
                    return const CommitsErrorScreen();
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
