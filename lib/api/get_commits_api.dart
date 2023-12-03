import 'package:dio/dio.dart';
import 'package:task_urbanmatch/Classes/commit_class.dart';

final dio = Dio();

Future<List<CommitClass>> getCommitsAPI(
    {required String login, required String name}) async {
  List<CommitClass> result = [];

  try {
    final response =
        await dio.get('https://api.github.com/repos/$login/$name/commits');

    for (var commitData in response.data) {
      CommitClass repo = CommitClass(
        name: commitData['commit']['author']["name"] ?? "",
        email: commitData['commit']['author']["email"] ?? "",
        date: commitData['commit']['author']["date"] ?? "",
        message: commitData['commit']['message'] ?? "",
      );
      result.add(repo);
    }
  } catch (e) {}

  return result;
}
