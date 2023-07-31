import 'dart:convert';
import 'package:v_app/models/model.dart';
import 'package:http/http.dart' as http;
import '../configs/config.dart';

class UserServices {
  Future<List<SearchUserModel>> getAllUsers() async {
    try {
      final uri = Uri.parse('$apiUri/users-search');
      final res = await http.get(uri);
      List<SearchUserModel> usersList = [];

      if (res.statusCode != 200) return [];

      final users = jsonDecode(res.body)['users'];
      for (var user in users) {
        usersList.add(SearchUserModel.fromMap(user));
      }
      return usersList;
    } catch (e) {
      throw Exception('Error getting users : $e');
    }
  }

  Future<UserModelOne> getUserById(String userId) async {
    try {
      final uri = Uri.parse('$apiUri/users/$userId');
      final res = await http.get(uri);

      if (res.statusCode == 200) {
        final user = jsonDecode(res.body);
        return UserModelOne.fromMap(user);
      } else {
        throw Exception('Failed to get user. Status code: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting user by id : $e');
    }
  }

  Future<List<SearchUserModel>> searchUsers(String name) async {
    try {
      print("Search is coming : $name");
      final uri = Uri.parse('$apiUri/users-search-name');
      final body = jsonEncode(name);
      print("body : $body");
      final res = await http.post(uri, body: body);
      List<SearchUserModel> usersList = [];

      if (res.statusCode != 200) return [];

      final users = jsonDecode(res.body)['users'];
      for (var user in users) {
        usersList.add(SearchUserModel.fromMap(user));
      }
      print("usersList : $usersList");
      return usersList;
    } catch (e) {
      throw Exception('Error getting search users : $e');
    }
  }
}
