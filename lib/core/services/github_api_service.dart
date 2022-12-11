import 'package:dio/dio.dart';
import 'package:test_app/data/user/user.dart';
import 'package:test_app/features/following/data/following.dart';
import 'package:test_app/features/repositories/data/repository.dart';

const baseUrl = 'https://api.github.com/users/';

class GitHubApiService {
  GitHubApiService(this.dio);

  final Dio dio;

  Future<User?> getUser(String name) async {
    final Response response = await dio.get('$baseUrl$name');
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }
    return null;
  }

  Future<List<Following>?> getFollowing(String name) async {
    final Response response = await dio.get('$baseUrl$name/following');
    if (response.statusCode == 200) {
      return Following.listFromJson(response.data);
    }

    return null;
  }

  Future<List<Following>?> getFollowers(String name) async {
    final Response response = await dio.get('$baseUrl$name/followers');
    if (response.statusCode == 200) {
      return Following.listFromJson(response.data);
    }

    return null;
  }

  Future<List<Repository>?> getRepositories(String name) async {
    final Response response = await dio.get('$baseUrl$name/repos');
    if (response.statusCode == 200) {
      return Repository.listFromJson(response.data);
    }

    return null;
  }
}
