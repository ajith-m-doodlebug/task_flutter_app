part of 'get_commits_bloc.dart';

@immutable
sealed class GetCommitsEvent {}

class CommitsDataFetchEvent extends GetCommitsEvent {
  late final String login;
  late final String name;
  CommitsDataFetchEvent({required this.login, required this.name});
}
