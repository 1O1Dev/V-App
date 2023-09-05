import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_app/models/model.dart';

class TokenDatabase {
  Future<bool> savedToken(TokenModel token) async {
    final box = await SharedPreferences.getInstance();
    final saved = await box.setString('token', token.toJson());
    if (saved != true) return false;
    return true;
  }

  Future<TokenModel?> getToken() async {
    final box = await SharedPreferences.getInstance();
    final token = box.get('token');
    if (token == null) return null;
    return TokenModel.fromJson(token.toString());
  }
}
