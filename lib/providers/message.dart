import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/services/message_service.dart';

final messageRepo = Provider((ref) => MessageService());

final messageProvider = FutureProvider((ref) {
  final res = ref.read(messageRepo).getMessages();
  return res;
});
