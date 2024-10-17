import 'package:wargaku/model/user.dart';
import 'package:wargaku/utils/api_utils.dart';
import 'package:wargaku/utils/repository.dart';

class UserRepository {
  ResourcesRepository repo = ResourcesRepository();

  Future<User> login(Map<String, dynamic> credentials) async {
    final response = await ApiUtils.post(repo.getFunLogin, credentials);
    return User.fromJson(response);
  }

  Future<User> register(Map<String, dynamic> credentials) async {
    final response = await ApiUtils.post(repo.getFunSignUp, credentials);
    return User.fromJson(response);
  }
}
