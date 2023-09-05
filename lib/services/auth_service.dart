import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v_app/configs/config.dart';
import 'package:v_app/databases/database.dart';
import 'package:v_app/databases/token_database.dart';
import 'package:v_app/models/token_model.dart';
import 'package:v_app/models/user.dart';

class AuthServices {
  var headersList = {'Accept': '*/*', 'Content-Type': 'application/json'};
  Future<bool> login(String email, String password) async {
    try {
      final body = jsonEncode({"email": email, "password": password});
      final res = await http.post(Uri.parse('$apiUri/auth/login'),
          headers: headersList, body: body);
      if (res.statusCode != 200) return false;
      bool isSavedUser = await UserDatabase()
          .savedUser(UserModel.fromMap(jsonDecode(res.body)['user']));
      final token = {
        "accessToken": jsonDecode(res.body)['accessToken'],
        "refreshToken": jsonDecode(res.body)['refreshToken'],
      };
      bool isSavedToken =
          await TokenDatabase().savedToken(TokenModel.fromMap(token));
      return isSavedUser && isSavedToken;
    } catch (e) {
      throw Exception("Error login : $e");
    }
  }
}
