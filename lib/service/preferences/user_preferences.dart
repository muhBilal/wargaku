import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wargaku/model/user.dart';

class UserPreferences {
  static const String _keyUid = 'uid';
  static const String _keyName = 'name';
  static const String _keyRole = 'role';
  static const String _keyNik = 'nik';
  static const String _keyAccessToken = 'access_token';

  static Future<void> saveUser(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_keyUid, user.uid);
      await prefs.setString(_keyName, user.name);
      await prefs.setString(_keyRole, user.role);
      await prefs.setString(_keyNik, user.nik);
      await prefs.setString(_keyAccessToken, user.accessToken);
      // print("User saved successfully.");
    } catch (e) {
      debugPrint("Error : $e");
    }
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getInt(_keyUid);
    final name = prefs.getString(_keyName);
    final role = prefs.getString(_keyRole);
    final nik = prefs.getString(_keyNik);
    final accessToken = prefs.getString(_keyAccessToken);

    if (uid != null &&
        name != null &&
        role != null &&
        nik != null &&
        accessToken != null) {
      return User(
        uid: uid,
        name: name,
        role: role,
        nik: nik,
        accessToken: accessToken,
      );
    }

    return null;
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUid);
    await prefs.remove(_keyName);
    await prefs.remove(_keyRole);
    await prefs.remove(_keyNik);
    await prefs.remove(_keyAccessToken);
  }
}
