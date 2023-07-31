import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/models/user.dart';
import 'package:v_app/services/service.dart';

final userRep = Provider((ref) => UserServices());

final usersProvider = FutureProvider((ref) {
  final res = ref.read(userRep).getAllUsers();
  return res;
});

final userProvider = FutureProvider.family<UserModelOne, String>((ref, userId) {
  final res = ref.read(userRep).getUserById(userId);
  return res;
});

final searchUserProvider = FutureProvider.autoDispose
    .family<List<SearchUserModel>, String>((ref, name) {
  final res = ref.read(userRep).searchUsers(name);
  return res;
});
