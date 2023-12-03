part of 'get_repos_bloc.dart';

@immutable
sealed class GetReposState {}

final class GetReposInitial extends GetReposState {}

class ReposDataLoadingState extends GetReposState {}

class ReposDataRetreivedState extends GetReposState {
  late final List<RepoClass> reposData;
  ReposDataRetreivedState({
    required this.reposData,
  });
}

class ReposDataErrorState extends GetReposState {}
