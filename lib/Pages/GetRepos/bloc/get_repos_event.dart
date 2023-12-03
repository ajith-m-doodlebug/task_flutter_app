part of 'get_repos_bloc.dart';

@immutable
sealed class GetReposEvent {}

class ReposDataFetchEvent extends GetReposEvent {
  late final String userName;
  ReposDataFetchEvent({required this.userName});
}
