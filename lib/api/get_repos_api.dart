import 'package:dio/dio.dart';
import 'package:task_urbanmatch/Classes/repo_class.dart';

final dio = Dio();

Future<List<RepoClass>> getReposAPI({required String userName}) async {
  List<RepoClass> result = [];
  try {
    var response =
        await dio.get('https://api.github.com/users/$userName/repos');

    for (var repoData in response.data) {
      RepoClass repo = RepoClass(
        login: repoData['owner']["login"] ?? "",
        avatarUrl: repoData['owner']["avatar_url"] ?? "",
        name: repoData['name'] ?? "",
        url: repoData['html_url'] ?? "",
        description: repoData['description'] ?? "",
        watchers: repoData['watchers_count'] ?? 0,
        forks: repoData['forks_count'] ?? 0,
      );
      result.add(repo);
    }
  } catch (e) {}
  return result;
}
