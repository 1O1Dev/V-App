import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/services/service.dart';

final userRep = Provider((ref) => UserServices());

final userProvider = FutureProvider((ref) {
  final res = ref.read(userRep).getAllUsers();
  return res;
});
