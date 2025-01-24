import 'package:github_users_app/Models/UsersModel.dart';
import 'package:github_users_app/Providers/users_api.dart';

class Userviewmodel {
  final _api = UsersApi();

  Future<List<User>?> getAllGithubUsers() async {
    return _api.getAllGithubUsers();
  }
}
