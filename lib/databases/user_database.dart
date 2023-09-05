import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_app/models/user.dart';

class UserDatabase {
  Future<bool> savedUser(UserModel user) async {
    try {
      final box = await SharedPreferences.getInstance();
      final saved = await box.setString('user', jsonEncode(user));
      if (saved != true) return false;
      return true;
    } catch (e) {
      throw Exception('Error saved user data: $e');
    }
  }

  Future<UserModel?> getUser() async {
    try {
      final box = await SharedPreferences.getInstance();
      final userString = box.getString('user');
      if (userString == null) return null;
      final res = jsonDecode(userString);
      return UserModel.fromJson(res);
    } catch (e) {
      throw Exception('Error getting user data: $e');
    }
  }
}
