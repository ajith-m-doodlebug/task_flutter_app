part of 'get_commits_bloc.dart';

@immutable
sealed class GetCommitsState {}

final class GetCommitsInitial extends GetCommitsState {}

class CommitsDataLoadingState extends GetCommitsState {}

class CommitsDataRetreivedState extends GetCommitsState {
  late final List<CommitClass> commitsData;
  CommitsDataRetreivedState({required this.commitsData});
}

class CommitsDataErrorState extends GetCommitsState {}
