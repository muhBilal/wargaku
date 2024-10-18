
import 'package:flutter/material.dart';
import 'package:wargaku/model/user.dart';
import 'package:wargaku/service/auth/auth_service.dart';
import 'package:wargaku/service/preferences/user_preferences.dart';

class AuthProvider with ChangeNotifier {
  final UserRepository _repo = UserRepository();
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage ?? '';

  Future<bool> login(String user, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final credentials = {'user': user, 'password': password};
      _user = await _repo.login(credentials);

      if (_user != null) {
        await UserPreferences.saveUser(_user!);
        _errorMessage = null;
        return true;
      } else {
        _errorMessage = 'Login Failed: User is null';
        return false;
      }
    } catch (e) {
      _errorMessage = 'Login Failed: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //create for register 
  Future<bool> register(String user, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final credentials = {'user': user, 'password': password};
      _user = await _repo.register(credentials);

      if (_user != null) {
        await UserPreferences.saveUser(_user!);
        _errorMessage = null;
        return true;
      } else {
        _errorMessage = 'Register Failed: User is null';
        return false;
      }
    } catch (e) {
      _errorMessage = 'Register Failed: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await UserPreferences.clearUser();
    notifyListeners();
  }
}
