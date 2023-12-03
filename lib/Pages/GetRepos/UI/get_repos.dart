import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_urbanmatch/Colors/colors.dart';
import 'package:task_urbanmatch/Pages/GetCommits/UI/get_commits.dart';
import 'package:task_urbanmatch/Pages/GetRepos/UI/repos_error_screen.dart';
import 'package:task_urbanmatch/Pages/GetRepos/UI/repos_loading_screen.dart';
import 'package:task_urbanmatch/Pages/GetRepos/UI/repo_details_card.dart';
import 'package:task_urbanmatch/Pages/GetRepos/bloc/get_repos_bloc.dart';
import 'package:task_urbanmatch/UIHelpers/uihelpers.dart';

class GetRepos extends StatelessWidget {
  GetRepos({super.key});

  final TextEditingController searchController =
      TextEditingController(text: 'freeCodeCamp');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetReposBloc()..add(ReposDataFetchEvent(userName: 'freeCodeCamp')),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                // Search Bar

                BlocBuilder<GetReposBloc, GetReposState>(
                    builder: (context, state) {
                  return Container(
                    height: 70,
                    padding: screenSidePadding,
                    color: const Color.fromARGB(255, 222, 201, 255),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                            onTapOutside: (event) {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          color: primaryColor,
                          onPressed: searchController.text != ""
                              ? () {
                                  context
                                      .read<GetReposBloc>()
                                      .add(ReposDataFetchEvent(
                                        userName: searchController.text,
                                      ));
                                }
                              : null,
                        ),
                      ],
                    ),
                  );
                }),

                // List of repos
                SizedBox(
                  height: screenHeight(context) - 100,
                  child: BlocBuilder<GetReposBloc, GetReposState>(
                    builder: (context, state) {
                      if (state is ReposDataLoadingState) {
                        return const ReposLoadingScreen();
                      } else if (state is ReposDataRetreivedState) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.reposData.length,
                          itemBuilder: (context, index) {
                            return RepoDetailsCard(
                              repoClass: state.reposData[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GetCommits(
                                      repoClass: state.reposData[index],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else if (state is ReposDataErrorState) {
                        return const ReposErrorScreen();
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
